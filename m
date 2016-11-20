From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 5/5] ARM: s5pv210_defconfig: Remove old MACHs
Date: Sun, 20 Nov 2016 21:24:55 +0200
Message-ID: <1479669895-19124-6-git-send-email-krzk@kernel.org>
References: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1479669895-19124-1-git-send-email-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: Lars-Peter Clausen <lars@metafoo.de>
List-Id: linux-samsung-soc@vger.kernel.org

Remove non-existing MACH symbols from S5PV210 defconfig.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/configs/s5pv210_defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/configs/s5pv210_defconfig b/arch/arm/configs/s5pv210_defconfig
index fa989902236d..c51f0f02012b 100644
--- a/arch/arm/configs/s5pv210_defconfig
+++ b/arch/arm/configs/s5pv210_defconfig
@@ -9,10 +9,6 @@ CONFIG_ARCH_S5PV210=y
 CONFIG_S3C_LOWLEVEL_UART_PORT=1
 CONFIG_S3C_DEV_FB=y
 CONFIG_S5PV210_SETUP_FB_24BPP=y
-CONFIG_MACH_AQUILA=y
-CONFIG_MACH_GONI=y
-CONFIG_MACH_SMDKC110=y
-CONFIG_MACH_SMDKV210=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_VMSPLIT_2G=y
-- 
2.7.4
