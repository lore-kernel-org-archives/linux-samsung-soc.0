From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH 3.18 1/2] ARM: exynos_defconfig: Enable options to mount a rootfs via NFS
Date: Wed,  7 Feb 2018 10:21:33 +0000
Message-ID: <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
References: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:40180 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753744AbeBGKVv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 05:21:51 -0500
In-Reply-To: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>

From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>

commit 19f79ccf6d77409cd138bce8db206cdac7fd5ea7 upstream.

This patch enables the options to mount a rootfs over NFS and also
support for automatic configuration of IP addresses during boot as
needed by NFS.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/configs/exynos_defconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index e21ef830a483..e94402c05975 100644
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
@@ -170,6 +174,8 @@ CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CRAMFS=y
 CONFIG_ROMFS_FS=y
+CONFIG_NFS_FS=y
+CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
 CONFIG_NLS_ISO8859_1=y
-- 
2.11.0
