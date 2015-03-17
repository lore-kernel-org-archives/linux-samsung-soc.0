From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] mfd: sec-core: Enable RTC on S2MPS11 PMIC
Date: Tue, 17 Mar 2015 13:36:17 +0100
Message-ID: <1426595777-10223-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60639 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932078AbbCQMg0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 08:36:26 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

The S2MPS11 PMIC (present on Arndale Octa board) has the same RTC module
as S2MPS14 device. Add respective mfd cell to enable it.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 drivers/mfd/sec-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
index 59bf322feacd..e08623807a62 100644
--- a/drivers/mfd/sec-core.c
+++ b/drivers/mfd/sec-core.c
@@ -69,6 +69,8 @@ static const struct mfd_cell s2mps11_devs[] = {
 	{
 		.name = "s2mps11-pmic",
 	}, {
+		.name = "s2mps14-rtc",
+	}, {
 		.name = "s2mps11-clk",
 		.of_compatible = "samsung,s2mps11-clk",
 	}
-- 
1.9.1
