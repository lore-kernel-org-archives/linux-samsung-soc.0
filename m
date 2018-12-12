From: Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3] media: exynos4-is: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed, 12 Dec 2018 11:20:14 -0500
Message-ID: <20181212162014.23409-1-tiny.windzz@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: kyungmin.park@samsung.com, s.nawrocki@samsung.com, mchehab@kernel.org, kgene@kernel.org, krzk@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/media/platform/exynos4-is/fimc-is.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/media/platform/exynos4-is/fimc-is.c b/drivers/media/platform/exynos4-is/fimc-is.c
index f5fc54de19da..02da0b06e56a 100644
--- a/drivers/media/platform/exynos4-is/fimc-is.c
+++ b/drivers/media/platform/exynos4-is/fimc-is.c
@@ -738,7 +738,7 @@ int fimc_is_hw_initialize(struct fimc_is *is)
 	return 0;
 }
 
-static int fimc_is_log_show(struct seq_file *s, void *data)
+static int fimc_is_show(struct seq_file *s, void *data)
 {
 	struct fimc_is *is = s->private;
 	const u8 *buf = is->memory.vaddr + FIMC_IS_DEBUG_REGION_OFFSET;
@@ -752,17 +752,7 @@ static int fimc_is_log_show(struct seq_file *s, void *data)
 	return 0;
 }
 
-static int fimc_is_debugfs_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, fimc_is_log_show, inode->i_private);
-}
-
-static const struct file_operations fimc_is_debugfs_fops = {
-	.open		= fimc_is_debugfs_open,
-	.read		= seq_read,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(fimc_is);
 
 static void fimc_is_debugfs_remove(struct fimc_is *is)
 {
@@ -777,7 +767,7 @@ static int fimc_is_debugfs_create(struct fimc_is *is)
 	is->debugfs_entry = debugfs_create_dir("fimc_is", NULL);
 
 	dentry = debugfs_create_file("fw_log", S_IRUGO, is->debugfs_entry,
-				     is, &fimc_is_debugfs_fops);
+				     is, &fimc_is_fops);
 	if (!dentry)
 		fimc_is_debugfs_remove(is);
 
-- 
2.17.0
