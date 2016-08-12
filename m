From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable SECCOMP
Date: Fri, 12 Aug 2016 14:34:03 +0200
Message-ID: <1471005243-6409-2-git-send-email-k.kozlowski@samsung.com>
References: <1471005243-6409-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1471005243-6409-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Systemd already supports seccomp.  It seems some distros are building
systemd with seccomp, e.g. Arch on ARM, thus leading to boot errors:

systemd-logind.service: Failed at step SECCOMP spawning /usr/lib/systemd/systemd-logind: Invalid argument

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7db8dce3da5f..0ccaa519f588 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -126,6 +126,7 @@ CONFIG_SMP=y
 CONFIG_NR_CPUS=16
 CONFIG_HIGHPTE=y
 CONFIG_CMA=y
+CONFIG_SECCOMP=y
 CONFIG_ARM_APPENDED_DTB=y
 CONFIG_ARM_ATAG_DTB_COMPAT=y
 CONFIG_KEXEC=y
-- 
1.9.1
