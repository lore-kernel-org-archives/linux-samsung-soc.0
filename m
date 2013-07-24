From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v3 5/5] clk/exynos5250: change parent to aclk200_disp1 for hdmi
 subsystem
Date: Wed, 24 Jul 2013 19:43:35 +0530
Message-ID: <1374675215-27862-6-git-send-email-rahul.sharma@samsung.com>
References: <1374675215-27862-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:33407 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751064Ab3GXNw0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Jul 2013 09:52:26 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQG00M4Y17DU170@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 24 Jul 2013 22:52:25 +0900 (KST)
In-reply-to: <1374675215-27862-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

parent of hdmi and mixer block is mentioned as aclk200 which is
not correct. It is clocked by the ouput of aclk200_disp1. Hence
parent for mixer and hdmi clocks is changed to aclk200_disp1.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/clk/samsung/clk-exynos5250.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index c727d9e..24a66b3 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -469,8 +469,8 @@ struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
 	GATE(mie1, "mie1", "aclk200", GATE_IP_DISP1, 1, 0, 0),
 	GATE(dsim0, "dsim0", "aclk200", GATE_IP_DISP1, 3, 0, 0),
 	GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
-	GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
-	GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
+	GATE(mixer, "mixer", "mout_aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
+	GATE(hdmi, "hdmi", "mout_aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
 };
 
 static __initdata struct of_device_id ext_clk_match[] = {
-- 
1.7.10.4
