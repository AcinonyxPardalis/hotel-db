<?php

    include('config/dbconnect.php');
    session_start();
    

    $sick = $_SESSION['sick'];


    $sql = "SELECT log2.nfcid, log1.entered AS enter1, log1.exited AS exit1, log1.lid, log2.entered AS enter2, log2.exited AS exit2 FROM passing_log AS log1
    INNER JOIN passing_log AS log2 ON log1.lid=log2.lid
    WHERE log1.nfcid=$sick
    AND (log2.entered BETWEEN log1.entered AND log1.exited
    OR log2.exited BETWEEN log1.entered AND log1.exited)
    AND log1.nfcid <> log2.nfcid;";
    $result = mysqli_query($conn, $sql);
    $cases = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    mysqli_free_result($result);
    mysqli_close($conn);
    

?>

<!DOCTYPE html>
    <?php include('Templates/header.php'); ?>
        <div class="container center">
        
            <?php if($cases): ?>
            
                <?php foreach($cases as $case){ ?>

                    <p><?php echo 'Visitor ' . htmlspecialchars($case['nfcid']) . ' was in location ' . htmlspecialchars($case['lid']) . ' with the confirmed case from ' . htmlspecialchars(max($case['enter1'], $case['enter2'])) . ' untill ' . htmlspecialchars(min($case['exit1'], $case['exit2'])) . '.'; ?></p>
                
                <?php }?>

                <font size = "+3">
                    <p><?php echo 'They are probably infected, contact them immediately!'; ?></p>
                </font>
            <?php else:?>
                <h4><?php echo 'No one in danger!'; ?></h4>
            <?php endif; ?>

        </div>
    <?php include('Templates/footer.php'); ?>
</html>

