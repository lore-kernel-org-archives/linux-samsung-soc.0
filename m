From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH] regulator: s2mps11: fix incorrect register for buck10
Date: Wed, 30 Jan 2013 08:02:27 -0500
Message-ID: <1359550947-5731-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:31974 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752990Ab3A3Mlz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 07:41:55 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHF002DKV9G3XW0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 21:41:53 +0900 (KST)
Received: from chrome-ubuntu.sisodomain.com ([107.108.73.106])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHF002N9V8AC670@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 30 Jan 2013 21:41:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: sbkim73@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, broonie@opensource.wolfsonmicro.com

For BUCK10 the control registers are wrongly set as buck9 control register
This patch corrects the control registers for buck10

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 drivers/regulator/s2mps11.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index bd062a2..cd9ea2e 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -174,9 +174,9 @@ static struct regulator_ops s2mps11_buck_ops = {
 	.min_uV		= S2MPS11_BUCK_MIN2,			\
 	.uV_step	= S2MPS11_BUCK_STEP2,			\
 	.n_voltages	= S2MPS11_BUCK_N_VOLTAGES,		\
-	.vsel_reg	= S2MPS11_REG_B9CTRL2,			\
+	.vsel_reg	= S2MPS11_REG_B10CTRL2,			\
 	.vsel_mask	= S2MPS11_BUCK_VSEL_MASK,		\
-	.enable_reg	= S2MPS11_REG_B9CTRL1,			\
+	.enable_reg	= S2MPS11_REG_B10CTRL1,			\
 	.enable_mask	= S2MPS11_ENABLE_MASK			\
 }
 
-- 
1.8.0
