<?php

    include('config/dbconnect.php');
    
    //$errors = array('name'=>'', 'mname'=>'', 'surname'=>'', 'birthdate'=>'', 'arrival'=>'', 'room'=>'', 'hallway'=>'', 'email'=>'');
    $nfcid = $lid = $date = '';

    if(isset($_POST['tracking'])){

        session_start();
        
        if(!empty($_POST['nfcid'])){
            $nfcid = mysqli_real_escape_string($conn, $_POST['nfcid']);
        }
        else{
            $nfcid = NULL;
        }
        
        if(!empty($_POST['lid'])){
            $lid = mysqli_real_escape_string($conn, $_POST['lid']);
        }
        else{
            $lid = NULL;
        }

        if(!empty($_POST['date'])){
            $date = mysqli_real_escape_string($conn, $_POST['date']);
        }
        else{
            $date = NULL;
        }

        $_SESSION['nfcid'] = $nfcid;
        $_SESSION['lid'] = $lid;
        $_SESSION['date'] = $date;

        header('Location: move_results.php');
    }

?>

<!DOCTYPE html>
<html>
    <?php include('Templates/header.php'); ?>

    <section class="container grey-text">
        <h4 class="center">Track Movement</h4>
        <form class="white" action="view_movement.php" method="POST">
            <label>Track by visitor's nfcid:</label>
            <input type="text" name="nfcid" value="<?php echo htmlspecialchars($nfcid); ?>">
            <label>Track by location's code:</label>
            <input type="text" name="lid" value="<?php echo htmlspecialchars($lid); ?>">
            <label>Track by date:</label>
            <input type="text" name="date" value="<?php echo htmlspecialchars($date); ?>">
            
            <div class="center">
                <input type="submit" name="tracking" value="Tracking" class="btn brand z-depth-0">
            </div>
        </form>
    </section>

    <?php include('Templates/footer.php'); ?>

</html>