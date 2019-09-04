From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/5] ARM: samsung: mach for v5.4, second (replacing previous)
Date: Wed,  4 Sep 2019 19:50:01 +0200
Message-ID: <20190904175002.10487-5-krzk@kernel.org>
References: <20190904175002.10487-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904175002.10487-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Replaces previous pull (and it includes it).

Best regards,
Krzysztof


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.4-2

for you to fetch changes up to c663d542bfb40eeeb6d393ed155c23a4666d65e1:

  MAINTAINERS: Extend patterns for Samsung SoC, Security Subsystem and clock drivers (2019-08-22 21:04:45 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.4

1. Minor fixup in plat and mach code (S3C platforms),
2. Enable exynos-chipid driver to provide SoC related information,
3. Extend the patterns for Samsung maintainer entries to cover all
   important files.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      MAINTAINERS: Extend patterns for Samsung SoC, Security Subsystem and clock drivers

Linus Walleij (1):
      ARM: samsung: Include GPIO driver header

Masahiro Yamada (1):
      ARM: s3c64xx: squash samsung_usb_phy.h into setup-usb-phy.c

Pankaj Dubey (1):
      ARM: exynos: Enable exynos-chipid driver

 MAINTAINERS                                    |  9 +++++++--
 arch/arm/mach-exynos/Kconfig                   |  1 +
 arch/arm/mach-s3c64xx/setup-usb-phy.c          |  5 +++++
 arch/arm/plat-samsung/include/plat/gpio-core.h |  1 +
 arch/arm/plat-samsung/include/plat/usb-phy.h   |  2 --
 include/linux/usb/samsung_usb_phy.h            | 17 -----------------
 6 files changed, 14 insertions(+), 21 deletions(-)
 delete mode 100644 include/linux/usb/samsung_usb_phy.h
