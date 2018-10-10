From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH / PULL 4/4] arm64: exynos: Enable generic power domain support
Date: Wed, 10 Oct 2018 20:25:58 +0200
Message-ID: <20181010182558.7034-5-krzk@kernel.org>
References: <20181010182558.7034-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181010182558.7034-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Generic power domains are needed to enable support for Exynos power
domains.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 393d2b524284..3b8e7e6ea6fb 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -67,6 +67,7 @@ config ARCH_EXYNOS
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
+	select PM_GENERIC_DOMAINS if PM
 	select SOC_SAMSUNG
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
-- 
2.17.1
