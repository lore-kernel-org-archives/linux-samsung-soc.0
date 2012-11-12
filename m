From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: Build failure: OMAP4430 failed due to exynos4 pinctrl
Date: Mon, 12 Nov 2012 19:20:18 +0900
Message-ID: <007b01cdc0bf$50c9ee70$f25dcb50$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:32305 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752055Ab2KLKdx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Nov 2012 05:33:53 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MDD005ZTE15K6X0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:20:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MDD004ZHE1U3210@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Nov 2012 19:20:19 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, arm@kernel.org, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Russell King - ARM Linux wrote:
> 
> Last night's randconfig for OMAP4430 failed with:
> 
> drivers/built-in.o:(.rodata+0x1a60): undefined reference to
> `exynos4210_pin_ctrl'
> 
> Config and log:
> http://www.arm.linux.org.uk/developer/build/file.php?type=config&idx=2693
> http://www.arm.linux.org.uk/developer/build/result.php?type=build&idx=2693

Oops, yeah right.

Thanks for pointing out :-)

Please test again with following?...

(+ Linus Walleij)

8<-------------------------------------------------------------
From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] pinctrl/samsung: adds dependency for pinctrl-samsung/exynos

The pinctrl-exynos should be built with ARCH_EXYNOS and pinctrl-samsung
should be built with pinctrl-exynos. If not, following error can be
happened.

drivers/built-in.o:(.rodata+0x1a60): undefined reference to
'exynos4210_pin_ctrl'

Reported-by: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 drivers/pinctrl/Kconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 7bf914d..18b473b 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -179,11 +179,13 @@ config PINCTRL_COH901
 
 config PINCTRL_SAMSUNG
 	bool "Samsung pinctrl driver"
+	depends on PLAT_SAMSUNG
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_EXYNOS4
 	bool "Pinctrl driver data for Exynos4 SoC"
+	depends on PINCTRL_SAMSUNG && ARCH_EXYNOS4
 	select PINCTRL_SAMSUNG
 
 config PINCTRL_MVEBU
-- 
1.7.4.1

8<-------------------------------------------------------------

Note, this is a re-sending due to failure of delivery... :-(

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
