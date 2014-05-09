From: Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>
Subject: [PATCH] mmc: card: restrict access to RPMB partition
Date: Fri,  9 May 2014 19:09:22 +0530
Message-ID: <1399642762-11149-1-git-send-email-yuvaraj.cd@samsung.com>
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: grundler@chromium.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jh80.chung@samsung.com, cjb@laptop.org, tgih.jun@samsung.com, linux-mmc@vger.kernel.org, sonnyrao@chromium.org, kgene.kim@samsung.com, joshi@samsung.com
Cc: t.figa@samsung.com, Andrew Bresticker <abrestic@chromium.org>, Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Andrew Bresticker <abrestic@chromium.org>

The RPMB partition should only be accessed through the RPMB ioctls
and not through read()/write().  This patch makes mmc_blk_open()
reject open attempts to the RPMB partition in read or write mode.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Yuvaraj Kumar C D <yuvaraj.cd@samsung.com>
---
 drivers/mmc/card/block.c |   10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/card/block.c b/drivers/mmc/card/block.c
index 452782b..fd59090 100644
--- a/drivers/mmc/card/block.c
+++ b/drivers/mmc/card/block.c
@@ -297,7 +297,15 @@ static int mmc_blk_open(struct block_device *bdev, fmode_t mode)
 			check_disk_change(bdev);
 		ret = 0;
 
-		if ((mode & FMODE_WRITE) && md->read_only) {
+		/*
+		 * Reject read/write access to the RPMB partition.  It should
+		 * only be accessed through ioctls.
+		 */
+		if ((mode & (FMODE_READ | FMODE_WRITE)) &&
+		    md->area_type & MMC_BLK_DATA_AREA_RPMB) {
+			mmc_blk_put(md);
+			ret = -EACCES;
+		} else if ((mode & FMODE_WRITE) && md->read_only) {
 			mmc_blk_put(md);
 			ret = -EROFS;
 		}
-- 
1.7.10.4

