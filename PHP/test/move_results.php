<?php

    include('config/dbconnect.php');
    session_start();
    

    $nfcid = $_SESSION['nfcid'];
    $lid = $_SESSION['lid'];
    $date = $_SESSION['date'];

    if($nfcid!=NULL){
        if($lid!=NULL){
            if($date!=NULL){
                //echo "111";
                $sql = "SELECT * FROM passing_log WHERE nfcid=$nfcid AND lid=$lid AND DATE(entered)='$date'";
            }
            else{
                //echo "110";
                $sql = "SELECT * FROM passing_log WHERE nfcid=$nfcid AND lid=$lid";
            }
        }
        else{
            if($date!=NULL){
                //echo "101";
                $sql = "SELECT * FROM passing_log WHERE nfcid=$nfcid AND DATE(entered)='$date'";
            }
            else{
                //echo "100";
                $sql = "SELECT * FROM passing_log WHERE nfcid=$nfcid";
            }
        }
    }
    else{
        if($lid!=NULL){
            if($date!=NULL){
                //echo "011";
                $sql = "SELECT * FROM passing_log WHERE lid=$lid AND DATE(entered)='$date'";
            }
            else{
                //echo "010";
                //echo $lid;
                $sql = "SELECT * FROM passing_log WHERE lid=$lid";
            }
        }
        else{
            if($date!=NULL){
                //echo "001";
                //echo $date;
                $sql = "SELECT * FROM passing_log WHERE DATE(entered)='$date'";
            }
            else{
                $sql = "SELECT * FROM passing_log";
            }
        }
    }

    $result = mysqli_query($conn, $sql);
    $logs = mysqli_fetch_all($result, MYSQLI_ASSOC);
    
    mysqli_free_result($result);
    mysqli_close($conn);
    

?>

<!DOCTYPE html>
    <?php include('Templates/header.php'); ?>
        <div class="container center">
        
            <?php if($logs): ?>
            
                <?php foreach($logs as $log){ ?>

                    <?php if($log['exited']): ?>
                        <p><?php echo 'Visitor ' . htmlspecialchars($log['nfcid']) . ' entered location ' . htmlspecialchars($log['lid']) . ' at ' . htmlspecialchars($log['entered']) . ' and exited at ' . htmlspecialchars($log['exited']); ?></p>
                    <?php else:?>
                        <p><?php echo 'Visitor ' . htmlspecialchars($log['nfcid']) . ' is in location ' . htmlspecialchars($log['lid']) . ' since ' . htmlspecialchars($log['entered']); ?></p>
                    <?php endif; ?>
                
                <?php }?>
            <?php else:?>
                <h4><?php echo 'No logs!'; ?></h4>
            <?php endif; ?>

        </div>
    <?php include('Templates/footer.php'); ?>
</html>

