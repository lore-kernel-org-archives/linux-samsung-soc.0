From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] pata_samsung_cf: fix ata_host_activate() failure handling
Date: Mon, 31 Mar 2014 19:52:44 +0200
Message-ID: <6050762.sdUI3gZZlK@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-ide-owner@vger.kernel.org>
Sender: linux-ide-owner@vger.kernel.org
To: Tejun Heo <tj@kernel.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-ide@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Add missing clk_disable() call to ata_host_activate() failure path.

Cc: Ben Dooks <ben-linux@fluff.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 drivers/ata/pata_samsung_cf.c |   10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

Index: b/drivers/ata/pata_samsung_cf.c
===================================================================
--- a/drivers/ata/pata_samsung_cf.c	2014-03-14 16:45:04.344724378 +0100
+++ b/drivers/ata/pata_samsung_cf.c	2014-03-31 18:31:58.083631437 +0200
@@ -594,9 +594,13 @@ static int __init pata_s3c_probe(struct
 
 	platform_set_drvdata(pdev, host);
 
-	return ata_host_activate(host, info->irq,
-			info->irq ? pata_s3c_irq : NULL,
-			0, &pata_s3c_sht);
+	ret = ata_host_activate(host, info->irq,
+				info->irq ? pata_s3c_irq : NULL,
+				0, &pata_s3c_sht);
+	if (ret)
+		goto stop_clk;
+
+	return 0;
 
 stop_clk:
 	clk_disable(info->clk);

