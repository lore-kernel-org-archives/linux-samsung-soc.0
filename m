From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] ARM: samsung: mach for v5.4
Date: Fri, 16 Aug 2019 18:30:42 +0200
Message-ID: <20190816163042.6604-3-krzk@kernel.org>
References: <20190816163042.6604-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190816163042.6604-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.4

for you to fetch changes up to 1fa70c7f49132513fb0da4afa7643395eedc7d35:

  ARM: exynos: Enable exynos-chipid driver (2019-08-15 20:29:58 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.4

1. Minor fixup in plat code (S3C platforms),
2. Enable exynos-chipid driver to provide SoC related information.

----------------------------------------------------------------
Linus Walleij (1):
      ARM: samsung: Include GPIO driver header

Pankaj Dubey (1):
      ARM: exynos: Enable exynos-chipid driver

 arch/arm/mach-exynos/Kconfig                   | 1 +
 arch/arm/plat-samsung/include/plat/gpio-core.h | 1 +
 2 files changed, 2 insertions(+)
