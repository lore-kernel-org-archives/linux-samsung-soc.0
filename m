From: =?ks_c_5601-1987?B?w9bBvsiv?= <jhbird.choi@samsung.com>
Subject: [PATCH 1/2] ARM: samsung: clock: add clock_tree debugfs file
Date: Fri, 07 Sep 2012 16:20:26 +0900
Message-ID: <004a01cd8cc9$40fcd900$c2f68b00$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ks_c_5601-1987
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43296 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751528Ab2IGHU2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 7 Sep 2012 03:20:28 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9Y00GILXN4DUQ0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 16:20:27 +0900 (KST)
Received: from DOJHBIRDCHO03 ([12.23.118.55])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9Y00J9UXQ2DE00@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 07 Sep 2012 16:20:27 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org

From: Colin Cross <ccross@android.com>

Add a clock/clock_tree debugfs file that shows the entire clock
hierarchy including usage counts and rates.

Signed-off-by: Colin Cross <ccross@android.com>
Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
---
 arch/arm/plat-samsung/clock.c |   65
++++++++++++++++++++++++++++++++++++++++-
 1 files changed, 64 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
index b7338ce..9392959 100644
--- a/arch/arm/plat-samsung/clock.c
+++ b/arch/arm/plat-samsung/clock.c
@@ -396,6 +396,64 @@ int __init s3c24xx_register_baseclocks(unsigned long
xtal)

 static struct dentry *clk_debugfs_root;

+static void clock_tree_show_one(struct seq_file *s, struct clk *c, int
level)
+{
+       struct clk *child;
+       const char *state;
+       char buf[255] = { 0 };
+       int n = 0;
+
+       if (c->name)
+               n = snprintf(buf, sizeof(buf) - 1, "%s", c->name);
+
+       if (c->devname)
+               n += snprintf(buf + n, sizeof(buf) - 1 - n, ":%s", c-
>devname);
+
+       state = (c->usage > 0) ? "on" : "off";
+
+       seq_printf(s, "%*s%-*s %-6s %-3d %-10lu\n",
+               level * 3 + 1, "",
+               50 - level * 3, buf,
+               state, c->usage, clk_get_rate(c));
+
+       list_for_each_entry(child, &clocks, list) {
+               if (child->parent != c)
+                       continue;
+
+               clock_tree_show_one(s, child, level + 1);
+       }
+}
+
+static int clock_tree_show(struct seq_file *s, void *data)
+{
+       struct clk *c;
+       unsigned long flags;
+
+       seq_printf(s, " clock
state  ref rate\n");
+       seq_printf(s, "-----------------------------------------------------
---------------\n");
+
+       spin_lock_irqsave(&clocks_lock, flags);
+
+       list_for_each_entry(c, &clocks, list)
+               if (c->parent == NULL)
+                       clock_tree_show_one(s, c, 0);
+
+       spin_unlock_irqrestore(&clocks_lock, flags);
+       return 0;
+}
+
+static int clock_tree_open(struct inode *inode, struct file *file)
+{
+       return single_open(file, clock_tree_show, inode->i_private);
+}
+
+static const struct file_operations clock_tree_fops = {
+       .open           = clock_tree_open,
+       .read           = seq_read,
+       .llseek         = seq_lseek,
"0001-ARM-samsung-clock-add-clock_tree-debugfs-file.patch" 106L, 2832C
1,1           Top
+       .read           = seq_read,
+       .llseek         = seq_lseek,
+       .release        = single_release,
+};
+
 static int clk_debugfs_register_one(struct clk *c)
 {
        int err;
@@ -457,13 +515,18 @@ static int __init clk_debugfs_init(void)
 {
        struct clk *c;
        struct dentry *d;
-       int err;
+       int err = -ENOMEM;

        d = debugfs_create_dir("clock", NULL);
        if (!d)
                return -ENOMEM;
        clk_debugfs_root = d;

+       d = debugfs_create_file("clock_tree", S_IRUGO, clk_debugfs_root,
NULL,
+               &clock_tree_fops);
+       if (!d)
+               goto err_out;
+
        list_for_each_entry(c, &clocks, list) {
                err = clk_debugfs_register(c);
                if (err)
--
1.7.1
