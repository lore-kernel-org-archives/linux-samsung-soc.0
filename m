From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [GIT PULL 1/7] ARM: EXYNOS: Non-critical fixes for v4.6
Date: Mon, 15 Feb 2016 09:34:00 +0900
Message-ID: <1455496446-23779-2-git-send-email-k.kozlowski@samsung.com>
References: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1455496446-23779-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Pankaj Dubey <pankaj.dubey@samsung.com>, Pavel Fedin <p.fedin@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Arnd, Kevin and Olof,

Few fixes from Arnd.

BTW, I did not apply one fix from his set because I had few comments
(not resolved yet).

Kind regards,
Krzysztof


The following changes since commit 92e963f50fc74041b5e9e744c330dca48e04f08d:

  Linux 4.5-rc1 (2016-01-24 13:06:47 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-fixes-non-critical-4.6

for you to fetch changes up to dc7eb9d589e595954792cc192bcbb92932e5c2ff:

  ARM: EXYNOS: select THERMAL_OF (2016-02-01 10:29:20 +0900)

----------------------------------------------------------------
Fixes from Arnd for harmless warnings for Exynos and S3C platforms.

----------------------------------------------------------------
Arnd Bergmann (5):
      ARM: s3c24xx: don't select EEPROM_AT24
      ARM: s3c24xx: allow selecting S3C2440_XTAL_16934400 for s3c2442
      ARM: s3c24xx: fix unused gta02_configure_pmu_for_charger warning
      ARM: s3c64xx: mark regulator init data as unused
      ARM: EXYNOS: select THERMAL_OF

 arch/arm/configs/mini2440_defconfig   |  1 +
 arch/arm/configs/s3c2410_defconfig    |  1 +
 arch/arm/mach-exynos/Kconfig          |  1 +
 arch/arm/mach-s3c24xx/Kconfig         |  6 ++++--
 arch/arm/mach-s3c24xx/mach-gta02.c    |  2 ++
 arch/arm/mach-s3c64xx/mach-smdk6410.c | 38 +++++++++++++++++------------------
 6 files changed, 28 insertions(+), 21 deletions(-)
