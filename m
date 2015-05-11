From: Michal Suchanek <hramrach@gmail.com>
Subject: [PATCH] ARM: exynos_defconfig: add options to make wifi usable
Date: Mon, 11 May 2015 12:22:13 +0200
Message-ID: <20150511105034.40580.qmail@dec59.ruk.cuni.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org


The Exynos defconfig includes mwifiex sdio support which is present on
some of the Exynos boards.

For the WiFi to be usable two extra options are needed. Usermode
firmware helper to load out-of-kernel firmware and wireless extensions
so the interface can be configured with wireless-tools.

Signed-off-by: Michal Suchanek <hramrach@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d034c96..5d4ee83f 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -42,6 +42,7 @@ CONFIG_IP_PNP_BOOTP=y
 CONFIG_IP_PNP_RARP=y
 CONFIG_WIRELESS=y
 CONFIG_CFG80211=y
+CONFIG_CFG80211_WEXT=y
 CONFIG_MWIFIEX=y
 CONFIG_MWIFIEX_SDIO=y
 CONFIG_RFKILL_REGULATOR=y
@@ -49,6 +50,7 @@ CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_PROC_DEVICETREE=y
+CONFIG_FW_LOADER_USER_HELPER_FALLBACK=y
 CONFIG_DMA_CMA=y
 CONFIG_CMA_SIZE_MBYTES=64
 CONFIG_BLK_DEV_LOOP=y
-- 
2.1.4
