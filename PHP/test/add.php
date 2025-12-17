<?php

    include('config/dbconnect.php');

    $errors = array('name'=>'', 'mname'=>'', 'surname'=>'', 'birthdate'=>'', 'arrival'=>'', 'room'=>'', 'email'=>'');
    $nfcid = $name = $mname = $surname = $ID = $id_auth = $id_doc = $birthdate = $arrival = $room  = $email = $phone = $left_on = $parent = '';

    if(isset($_POST['submit'])){
        if(!empty($_POST['nfcid'])){
            $nfcid = mysqli_real_escape_string($conn, $_POST['nfcid']);
        }
        else{
            $nfcid = 'NULL';
        }
        

        if(empty($_POST['name'])){
            $errors['name'] = "I'm still waiting for your name! <br />";
        }
        else{
            $name = mysqli_real_escape_string($conn, $_POST['name']);
            if(!preg_match('/^[a-zA-Z\s]+$/', $name)){
                $errors['name'] = "Please use latin characters only!<br />";
            }
        }
    
        if(!empty($_POST['mname'])){
            $mname = mysqli_real_escape_string($conn, $_POST['mname']);
            if(!preg_match('/^[a-zA-Z\s]+$/', $mname)){
                $errors['mname'] = "Please use latin characters only!<br />";
            }
        }
        else{
            $mname = NULL;
        }

        if(empty($_POST['surname'])){
            $errors['surname'] = "I'm still waiting for your surname! <br />";
        }
        else{
            $surname = mysqli_real_escape_string($conn, $_POST['surname']);
            if(!preg_match('/^[a-zA-Z\s]+$/', $surname)){
                $errors['surname'] = "Please use latin characters only!<br />";
            }
        }

        if(!empty($_POST['ID'])){
            $ID = mysqli_real_escape_string($conn, $_POST['ID']);
        }
        else{
            $ID = NULL;
        }

        if(!empty($_POST['id_auth'])){
            $id_auth = mysqli_real_escape_string($conn, $_POST['id_auth']);
        }
        else{
            $id_auth = NULL;
        }

        if(empty($_POST['birthdate'])){
            $errors['birthdate'] = "I'm still waiting for your birthdate! <br />";
        }
        else{
            $birthdate = mysqli_real_escape_string($conn, $_POST['birthdate']);
        }

        if(empty($_POST['arrival'])){
            $errors['arrival'] = "I'm still waiting for arrival time! <br />";
        }
        else{
            $arrival = mysqli_real_escape_string($conn, $_POST['arrival']);
        }
        
        if(empty($_POST['room'])){
            $errors['room'] = "I'm still waiting for your room! <br />";
        }
        else{
            $room = mysqli_real_escape_string($conn, $_POST['room']);
        }

        if(!empty($_POST['email'])){
            $email = mysqli_real_escape_string($conn, $_POST['email']); 
            if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                $errors['email'] = "Heyyy! This is not your email!<br />";
            }
        }
        else{
            $email = NULL;
        }

        if(!empty($_POST['phone'])){
            $phone = mysqli_real_escape_string($conn, $_POST['phone']);
        }
        else{
            $phone = NULL;
        }

        if(!empty($_POST['parent'])){
            $parent = mysqli_real_escape_string($conn, $_POST['parent']);
        }
        else{
            $parent = 'NULL';
        }

        if(array_filter($errors)){
            echo 'There are errors in the form';
        }
        else{


            if(!empty($_POST['left_on'])){
                $left_on = mysqli_real_escape_string($conn, $_POST['left_on']);
                if(!empty($_POST['id_doc'])){
                    $id_doc = mysqli_real_escape_string($conn, $_POST['id_doc']);
                    $sql = "INSERT INTO visitor VALUES
                    ($nfcid, '$name', '$mname', '$surname', '$ID', '$id_auth', '$id_doc', '$birthdate', '$arrival', $room, 1, '$email', '$phone', '$left_on', $parent)";
                }
                else{
                    $sql = "INSERT INTO visitor VALUES
                ($nfcid, '$name', '$mname', '$surname', '$ID', '$id_auth', NULL, '$birthdate', '$arrival', $room, 1, '$email', '$phone', '$left_on', $parent)";
                }
            }
            else{
                if(!empty($_POST['id_doc'])){
                    $id_doc = mysqli_real_escape_string($conn, $_POST['id_doc']);
                    $sql = "INSERT INTO visitor VALUES
                    ($nfcid, '$name', '$mname', '$surname', '$ID', '$id_auth', '$id_doc', '$birthdate', '$arrival', $room, 1, '$email', '$phone', NULL, $parent)";
                }
                else{
                    $sql = "INSERT INTO visitor VALUES
                ($nfcid, '$name', '$mname', '$surname', '$ID', '$id_auth', NULL, '$birthdate', '$arrival', $room, 1, '$email', '$phone', NULL, $parent)";
                }
            }
            
            if(mysqli_query($conn, $sql)){
                header('Location:index.php');
            }
            else{
                echo 'query error:' . mysqli_error($conn);
            }
        }
    }

?>

<!DOCTYPE html>
<html>
    <?php include('Templates/header.php'); ?>

    <section class="container grey-text">
        <h4 class="center">Add a guest</h4>
        <form class="white" action="add.php" method="POST">
            <label>Your nfcid:</label>
            <input type="text" name="nfcid" value="<?php echo htmlspecialchars($nfcid); ?>">
            <label>Your Name:</label>
            <input type="text" name="name" value="<?php echo htmlspecialchars($name); ?>">
            <div class="red-text"><?php echo $errors['name']; ?></div>
            <label>Your Middle Name:</label>
            <input type="text" name="mname" value="<?php echo htmlspecialchars($mname); ?>">
            <div class="red-text"><?php echo $errors['mname']; ?></div>
            <label>Your Surname:</label>
            <input type="text" name="surname" value="<?php echo htmlspecialchars($surname); ?>">
            <div class="red-text"><?php echo $errors['surname']; ?></div>
            <label>Type of ID document:</label>
            <input type="text" name="id_doc" value="<?php echo htmlspecialchars($id_doc); ?>">
            <label>Your ID:</label>
            <input type="text" name="ID" value="<?php echo htmlspecialchars($ID); ?>">
            <label>Your ID authority:</label>
            <input type="text" name="id_auth" value="<?php echo htmlspecialchars($id_auth); ?>">
            <label>Your Birthdate:</label>
            <input type="text" name="birthdate" value="<?php echo htmlspecialchars($birthdate); ?>">
            <div class="red-text"><?php echo $errors['birthdate']; ?></div>
            <label>Time of Arrival:</label>
            <input type="text" name="arrival" value="<?php echo htmlspecialchars($arrival); ?>">
            <div class="red-text"><?php echo $errors['arrival']; ?></div>
            <label>Your Room:</label>
            <input type="text" name="room" value="<?php echo htmlspecialchars($room); ?>">
            <div class="red-text"><?php echo $errors['room']; ?></div>
            <label>Your Email:</label>
            <input type="text" name="email" value="<?php echo htmlspecialchars($email); ?>">
            <div class="red-text"><?php echo $errors['email']; ?></div>
            <label>Your Phone:</label>
            <input type="text" name="phone" value="<?php echo htmlspecialchars($phone); ?>">
            <label>Time of Leaving:</label>
            <input type="text" name="left_on" value="<?php echo htmlspecialchars($left_on); ?>">
            <label>Your Parent:</label>
            <input type="text" name="parent" value="<?php echo htmlspecialchars($parent); ?>">
            <div class="center">
                <input type="submit" name="submit" value="submit" class="btn brand z-depth-0">
            </div>
        </form>
    </section>

    <?php include('Templates/footer.php'); ?>

</html>