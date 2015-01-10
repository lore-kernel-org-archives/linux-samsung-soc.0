From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH 1/2] drivers: bus: check cci device tree node status
Date: Sat, 10 Jan 2015 08:41:35 +0530
Message-ID: <1420859496-27533-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:62950 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753495AbbAJDTL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Jan 2015 22:19:11 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NHX0005JYJXSCA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 10 Jan 2015 12:19:09 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, arm@kernel.org, arnd@arndb.de, khilman@kernel.org, olof@lixom.net
Cc: linux-samsung-soc@vger.kernel.org, kesavan.abhilash@gmail.com, sudeep.holla@arm.com, nicolas.pitre@linaro.org, Punit.Agrawal@arm.com, Will.Deacon@arm.com, Mark.Rutland@arm.com, k.kozlowski@samsung.com

The arm-cci driver completes the probe sequence even if the cci node is
marked as disabled. Add a check in the driver to honour the cci status
in the device tree.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Acked-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Nicolas Pitre <nico@linaro.org>
Tested-by: Sudeep Holla <sudeep.holla@arm.com>
Tested-by: Kevin Hilman <khilman@linaro.org>
---
Changes:
	- Re-sending without the RFT tags

 drivers/bus/arm-cci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 860da40..0ce5e2d 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -1312,6 +1312,9 @@ static int cci_probe(void)
 	if (!np)
 		return -ENODEV;
 
+	if (!of_device_is_available(np))
+		return -ENODEV;
+
 	cci_config = of_match_node(arm_cci_matches, np)->data;
 	if (!cci_config)
 		return -ENODEV;
-- 
2.2.0
