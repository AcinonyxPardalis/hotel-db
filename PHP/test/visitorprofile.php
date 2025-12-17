<?php

    include('config/dbconnect.php');
    
    if(isset($_POST['delete'])){

        $id_to_delete=mysqli_real_escape_string($conn, $_POST[id_to_delete]);
        $sql = "DELETE FROM visitor WHERE nfcid = $id_to_delete";

        if(mysqli_query($conn, $sql)){
            header('Location: index.php');
        } {
            echo 'query error:' . mysqli_error($conn);
        }
    }

    if(isset($_POST['leave'])){

        $id_to_leave=mysqli_real_escape_string($conn, $_POST[id_to_leave]);
        $sql = "UPDATE visitor SET left_on=NOW() WHERE nfcid = $id_to_leave";

        if(mysqli_query($conn, $sql)){
            header('Location: index.php');
        } {
            echo 'query error:' . mysqli_error($conn);
        }
    }

    if(isset($_GET['nfcid'])){

        $nfcid = mysqli_real_escape_string($conn, $_GET['nfcid']); 

        $sql = "SELECT * FROM visitor WHERE nfcid=$nfcid";
        $result = mysqli_query($conn, $sql);
        $visitor = mysqli_fetch_assoc($result);

        mysqli_free_result($result);
        mysqli_close($conn);
    }

?>

<!DOCTYPE html>
    <?php include('Templates/header.php'); ?>
        <div class="container center">
        
            <?php if($visitor): ?>
            
                <h4><?php echo htmlspecialchars($visitor['fname']) . ' ' . htmlspecialchars($visitor['mname']) . ' ' . htmlspecialchars($visitor['surname']); ?> </h4>
                <p><?php echo 'NFCID:' . htmlspecialchars($visitor['nfcid']) ?></p>
                <?php if($visitor['id_num']): ?>
                    <p><?php echo htmlspecialchars($visitor['id_doc']) . ': ' . htmlspecialchars($visitor['id_num']) . ' FROM ' . htmlspecialchars($visitor['id_auth']); ?></p>
                <?php else:?>
                    <p><?php echo 'No identification papers'; ?></p>
                <?php endif; ?>
                <p><?php echo 'Born on: ' . htmlspecialchars($visitor['birthdate']) ?></p>
                <?php if($visitor['left_on']): ?>
                    <p><?php echo 'Checked in at: ' . htmlspecialchars($visitor['arrival']) . ' and left at: ' . htmlspecialchars($visitor['left_on']) ?></p>
                    <p><?php echo 'Stayed in room ' . htmlspecialchars($visitor['room']); ?></p>
                <?php else:?>
                    <p><?php echo 'Checked in at: ' . htmlspecialchars($visitor['arrival']); ?></p>
                    <p><?php echo 'Stays in room ' . htmlspecialchars($visitor['room']); ?></p>
                <?php endif; ?>
                <?php if($visitor['mail'] & $visitor['phone']): ?>
                    <h5><?php echo 'Contact information'; ?></h5>
                    <p><?php echo 'email: ' . htmlspecialchars($visitor['mail']) . ', phone number: ' . htmlspecialchars($visitor['phone']); ?></p>
                <?php else: ?>
                    <?php if($visitor['phone']):?>
                        <h5><?php echo 'Contact information'; ?></h5>
                        <p><?php echo 'phone number: ' . htmlspecialchars($visitor['phone']) . ', No email'; ?></p>
                    <?php else: ?>
                        <?php if($visitor['mail']):?>
                            <h5><?php echo 'Contact information'; ?></h5>
                            <p><?php echo 'phone number: ' . htmlspecialchars($visitor['mail']) . ', No phone number'; ?></p>
                        <?php else: ?>
                            <h5><?php echo 'No contact information'; ?></h5>
                        <?php endif; ?>
                    <?php endif; ?>
                <?php endif; ?>
                <?php if($visitor['parent']):?>
                    <font size="+3">
                        <div class="card-action"> 
                            <a href="visitorprofile.php?nfcid=<?php echo $visitor['parent']?>" class="brand-text">Parent Info</a>
                        </div>
                    </font>
                    
                <?php endif; ?>

                <?php if(!$visitor['left_on']):?>
                    <form action="visitorprofile.php" method="POST">
                    
                        <input type="hidden" name="id_to_leave" value="<?php echo $visitor['nfcid'] ?>" >
                        <input type="submit" name="leave" value="Left" class="btn brand z-depth-0" >

                    </form>
                <?php endif; ?>

                <form action="visitorprofile.php" method="POST">
                
                    <input type="hidden" name="id_to_delete" value="<?php echo $visitor['nfcid'] ?>" >
                    <input type="submit" name="delete" value="Delete" class="btn brand z-depth-0" >

                </form>
            <?php else:?>
                <h4><?php echo 'Error 404: No visitor found!'; ?></h4>
            <?php endif; ?>

        </div>
    <?php include('Templates/footer.php'); ?>
</html>

