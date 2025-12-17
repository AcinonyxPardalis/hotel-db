<?php

    include('config/dbconnect.php');
    
    $errors = array('sick'=>'');
    $sick = '';

    if(isset($_POST['tracing'])){

        session_start();
        
        if(empty($_POST['sick'])){
            $errors['sick'] = "You really have to tell me! <br />";
        }
        else{
            $sick = mysqli_real_escape_string($conn, $_POST['sick']);
        }
        
        if(!array_filter($errors)){
            $_SESSION['sick'] = $sick;
            header('Location: possible_cases.php');
        }
    }


?>

<!DOCTYPE html>
<html>
    <?php include('Templates/header.php'); ?>

    <section class="container grey-text">
        <h4 class="center">Trace Virus</h4>
        <form class="white" action="covid_sos.php" method="POST">
            <label>Enter sick person's nfcid:</label>
            <input type="text" name="sick" value="<?php echo htmlspecialchars($sick); ?>">
            <div class="red-text"><?php echo $errors['sick']; ?></div>
            
            <div class="center">
                <input type="submit" name="tracing" value="Tracing" class="btn brand z-depth-0">
            </div>
        </form>
    </section>

    <?php include('Templates/footer.php'); ?>

</html>