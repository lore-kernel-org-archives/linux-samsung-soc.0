From: Guillaume Tucker <guillaume.tucker@collabora.com>
Subject: [PATCH 3.18 2/2] ARM: exynos_defconfig: Enable NFSv4 client
Date: Wed,  7 Feb 2018 10:21:34 +0000
Message-ID: <84b3f560051df582f2927805775893477b44f6c7.1517997302.git.guillaume.tucker@collabora.com>
References: <CAJKOXPfsvXfONa8gT1-Vfa1qme3kC2DQBhHHLtkmTdSA+-zRKQ@mail.gmail.com>
 <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
In-Reply-To: <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
References: <7cb705ff603f159efe60c5c43e65e4648fca5113.1517997302.git.guillaume.tucker@collabora.com>
Sender: stable-owner@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>, kernel@collabora.com, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javierm@redhat.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

commit 1c1fb9b0c89a2506e556114c813a606bc1508d49 upstream.

NFS client is already enabled (NFS_FS) and by default it enables clients
for version 2 and 3. Enable explicitly the version 4 client to utilize
the newer protocol.

The NFS client is especially useful for testing kernel in automated
environments (network boot with network file system).

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Signed-off-by: Guillaume Tucker <guillaume.tucker@collabora.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index e94402c05975..8cd6eae4e89b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -175,6 +175,7 @@ CONFIG_TMPFS_POSIX_ACL=y
 CONFIG_CRAMFS=y
 CONFIG_ROMFS_FS=y
 CONFIG_NFS_FS=y
+CONFIG_NFS_V4=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ASCII=y
-- 
2.11.0
