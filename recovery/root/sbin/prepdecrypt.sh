#!/sbin/sh

echo "[prepdecrypt] Starting decrypt process..." >> /tmp/recovery.log

# Wait for metadata partition
sleep 2

# Mount metadata
mkdir -p /metadata
mount /dev/block/by-name/metadata /metadata

# Run decrypt binary if exists
if [ -x /sbin/mtk_fbe_decrypt ]; then
  /sbin/mtk_fbe_decrypt >> /tmp/recovery.log 2>&1
else
  echo "[prepdecrypt] mtk_fbe_decrypt not found!" >> /tmp/recovery.log
fi

umount /metadata
echo "[prepdecrypt] Done!" >> /tmp/recovery.log
