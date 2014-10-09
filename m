From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v5 6/6] arm64: exynos: Enable pinctrl support for Exynos7
Date: Thu, 09 Oct 2014 19:24:34 +0530
Message-ID: <1412862874-9335-7-git-send-email-a.kesavan@samsung.com>
References: <1412862874-9335-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47839 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757360AbaJIN7o (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Oct 2014 09:59:44 -0400
In-reply-to: <1412862874-9335-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, tomasz.figa@gmail.com, linus.walleij@linaro.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, naveenkrishna.ch@gmail.com, robh@kernel.org, devicetree@vger.kernel.org

From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>

Enable pinctrl support for exynos7 SoCs.

Signed-off-by: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Tested-by: Thomas Abraham <thomas.ab@samsung.com>
Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Rob Herring <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 arch/arm64/Kconfig |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 56e5b7c..f9c42fa 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -155,6 +155,8 @@ config ARCH_EXYNOS7
 	bool "ARMv8 based Samsung Exynos7"
 	select ARCH_EXYNOS
 	select COMMON_CLK_SAMSUNG
+	select PINCTRL
+	select PINCTRL_EXYNOS
 	help
 	  This enables support for Samsung Exynos7 SoC family
 
-- 
1.7.9.5
