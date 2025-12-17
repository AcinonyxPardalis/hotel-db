<?php

    include('config/dbconnect.php');

    $sql = 'SELECT * FROM visitor;';
    $result = mysqli_query($conn, $sql);
    $visitor = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    mysqli_free_result($result);
    mysqli_close($conn);

    //echo '<pre>';
    //print_r($visitor);
    //echo '</pre>';

?>

<!DOCTYPE html>
<html>
    <?php include('Templates/header.php'); ?>

    <h4 class="center grey-text">Visitors</h4>
    <div class="container">
        <div class="row">
        
            <?php foreach($visitor as $visitor){ ?>
                
                <div class="col s6 md3">
                    <div class="card z-depth-0">
                        <div class="card-content center">
                            <h6><?php echo htmlspecialchars($visitor['nfcid']); ?></h6>
                            <div><?php echo htmlspecialchars($visitor['fname']).' '.htmlspecialchars($visitor['surname']); ?></div>
                        </div>
                        <div class="card-action right-align"> 
                            <a href="visitorprofile.php?nfcid=<?php echo $visitor['nfcid']?>" class="brand-text">more info</a>
                        </div>
                    </div>

                </div>

            <?php } ?>

        </div>
    </div>
    <?php include('Templates/footer.php'); ?>

</html>