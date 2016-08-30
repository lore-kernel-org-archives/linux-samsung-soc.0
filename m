From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 4/4] ARM: defconfig: Exynos for v4.9
Date: Tue, 30 Aug 2016 11:18:56 +0200
Message-ID: <1472548739-20050-2-git-send-email-k.kozlowski@samsung.com>
References: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:63777 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757638AbcH3JT0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 05:19:26 -0400
In-reply-to: <1472548739-20050-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>

Hi,

Expected conflict in multi_v7 - take all the changes:

--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@@ -135,8 -136,7 +136,8 @@@ CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=
  CONFIG_CPU_FREQ_GOV_POWERSAVE=m
  CONFIG_CPU_FREQ_GOV_USERSPACE=m
  CONFIG_CPU_FREQ_GOV_CONSERVATIVE=m
- CONFIG_CPU_FREQ_GOV_SCHEDUTIL=m
+ CONFIG_CPU_FREQ_GOV_SCHEDUTIL=y
 +CONFIG_ARM_IMX6Q_CPUFREQ=y
  CONFIG_QORIQ_CPUFREQ=y
  CONFIG_CPU_IDLE=y
  CONFIG_ARM_CPUIDLE=y



Best regards,
Krzysztof


The following changes since commit 29b4817d4018df78086157ea3a55c1d9424a7cfc:

  Linux 4.8-rc1 (2016-08-07 18:18:00 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-defconfig-4.9

for you to fetch changes up to 88ea168f0a35c6aeab3c6703f7eb3b1c925c5b12:

  Merge tag 'tags/samsung-defconfig-schedutil-4.9' into next/defconfig (2016-08-24 06:54:32 +0200)

----------------------------------------------------------------

Samsung defconfig update for v4.9:
1. Device dynamic frequency and voltage scalling is now supported
   on many Exynos boards, enable it.
2. Enable PM_DEBUG, cleanup old IPV6_PRIVACY.
3. Enable SECCOMP for Systemd on Arch.
4. cpufreq schedutil cannot be module anymore.

----------------------------------------------------------------
Borislav Petkov (1):
      ARM: s3c2410_defconfig: Remove CONFIG_IPV6_PRIVACY

Chanwoo Choi (1):
      ARM: exynos_defconfig: Enable bus frequency scaling with devfreq

Javier Martinez Canillas (2):
      ARM: exynos_defconfig: Don't attempt to enable schedutil governor as module
      ARM: multi_v7_defconfig: Don't attempt to enable schedutil governor as module

Krzysztof Kozlowski (4):
      ARM: exynos_defconfig: Enable PM_DEBUG
      ARM: exynos_defconfig: Enable SECCOMP
      ARM: multi_v7_defconfig: Enable SECCOMP
      Merge tag 'tags/samsung-defconfig-schedutil-4.9' into next/defconfig

 arch/arm/configs/exynos_defconfig   | 11 ++++++++++-
 arch/arm/configs/multi_v7_defconfig |  3 ++-
 arch/arm/configs/s3c2410_defconfig  |  1 -
 3 files changed, 12 insertions(+), 3 deletions(-)
