From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/4] i2c: imx: Constify platform_device_id
Date: Sat,  2 May 2015 00:54:25 +0900
Message-ID: <1430495668-31878-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:35131 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754338AbbEAPyk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 11:54:40 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a53a7dd66945..785aa674a4da 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -241,7 +241,7 @@ static struct imx_i2c_hwdata vf610_i2c_hwdata = {
 
 };
 
-static struct platform_device_id imx_i2c_devtype[] = {
+static const struct platform_device_id imx_i2c_devtype[] = {
 	{
 		.name = "imx1-i2c",
 		.driver_data = (kernel_ulong_t)&imx1_i2c_hwdata,
-- 
2.1.4
