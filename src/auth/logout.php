<?php
session_start();
session_destroy();
?>
<script>
    window.location.href = '/';
</script>
<?php
exit;
