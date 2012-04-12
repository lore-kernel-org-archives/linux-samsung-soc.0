From: Karol Lewandowski <k.lewandowsk@samsung.com>
Subject: [PATCH 01/13] regulator: Fix DT node name checking in max8997-pmic
Date: Thu, 12 Apr 2012 20:45:20 +0200
Message-ID: <1334256332-29867-2-git-send-email-k.lewandowsk@samsung.com>
References: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:43812 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1762218Ab2DLSpU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Apr 2012 14:45:20 -0400
In-reply-to: <1334256332-29867-1-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, thomas.abraham@linaro.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com, linux-kernel@vger.kernel.org, olof@lixom.net, kgene.kim@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>

Avoid hard lockup when someone provides non-supported regulator
name.

Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Thomas Abraham <thomas.abraham@linaro.org>
---
 drivers/regulator/max8997.c |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/drivers/regulator/max8997.c b/drivers/regulator/max8997.c
index dce8aaf..c20fd72 100644
--- a/drivers/regulator/max8997.c
+++ b/drivers/regulator/max8997.c
@@ -1011,6 +1011,13 @@ static int max8997_pmic_dt_parse_pdata(struct max8997_dev *iodev,
 		for (i = 0; i < ARRAY_SIZE(regulators); i++)
 			if (!of_node_cmp(reg_np->name, regulators[i].name))
 				break;
+
+		if (i == ARRAY_SIZE(regulators)) {
+			dev_warn(iodev->dev, "don't know how to configure regulator %s\n",
+				 reg_np->name);
+			continue;
+		}
+
 		rdata->id = i;
 		rdata->initdata = of_get_regulator_init_data(
 						iodev->dev, reg_np);
-- 
1.7.9.1
