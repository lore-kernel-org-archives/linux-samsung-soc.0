From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH 3.18] ARM: exynos_defconfig: enable CONFIG_ROOT_NFS and dependencies
Date: Tue,  6 Feb 2018 14:00:36 +0000
Message-ID: <33565d824a8fde35618fdfaa2205f437874aec6c.1517925184.git.guillaume.tucker@collabora.com>
Return-path: <stable-owner@vger.kernel.org>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Guillaume Tucker <guillaume.tucker@collabora.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable CONFIG_ROOT_NFS and dependencies (CONFIG_NFS_*, CONFIG_IP_PNP)
in order to be able to boot the Exynos devices with NFS root.

Tested on exynos4412-odroidx2.

Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/configs/exynos_defconfig | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index e21ef830a483..999ea477be54 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -33,6 +33,10 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
+CONFIG_IP_PNP=y
+CONFIG_IP_PNP_DHCP=y
+CONFIG_IP_PNP_BOOTP=y
+CONFIG_IP_PNP_RARP=y
 CONFIG_RFKILL_REGULATOR=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
@@ -170,6 +174,10 @@ CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CRAMFS=y
 CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_NFS_V3_ACL=y
+CONFIG_NFS_V4=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
-- 
2.11.0
