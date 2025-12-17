<?php

    include('config/dbconnect.php');

    $sql = 'SELECT description, COUNT(*) AS amount FROM location WHERE lid BETWEEN 26 AND 60 GROUP BY description';
    $result = mysqli_query($conn, $sql);
    $facilities = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    mysqli_free_result($result);
    mysqli_close($conn);

    //echo '<pre>';
    //print_r($visitor);
    //echo '</pre>';

?>

<!DOCTYPE html>
<html>
    <?php include('Templates/header.php'); ?>

    <h4 class="center grey-text">Facilities</h4>
    <div class="container">
        <div class="row">
        
            <?php foreach($facilities as $facility){ ?>
                
                <div class="col s6 md3">
                    <div class="card z-depth-0">
                        <div class="card-content center">
                            <h6><?php echo htmlspecialchars($facility['amount']); ?></h6>
                            <?php if($facility['amount']>1){ ?>
                                <div><?php echo htmlspecialchars($facility['description']) . 's'; ?></div>
                            <?php } 
                            else{ ?>
                                <div><?php echo htmlspecialchars($facility['description']); ?></div>
                            <?php } ?>
                        </div>
                    </div>

                </div>

            <?php } ?>

        </div>
    </div>
    <?php include('Templates/footer.php'); ?>

</html>