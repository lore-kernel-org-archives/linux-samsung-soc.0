From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] ARM: samsung: mach/soc for v5.4, second pull
Date: Wed, 11 Sep 2019 20:36:32 +0200
Message-ID: <20190911183632.4317-2-krzk@kernel.org>
References: <20190911183632.4317-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190911183632.4317-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

Late pull, on top of previous pull request.  Unfortunately the patches
were applied right after closing the linux-next.


Best regards,
Krzysztof


The following changes since commit c663d542bfb40eeeb6d393ed155c23a4666d65e1:

  MAINTAINERS: Extend patterns for Samsung SoC, Security Subsystem and clock drivers (2019-08-22 21:04:45 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.4-3

for you to fetch changes up to 13aeb3fe4d5bd78a6dc7bde32986a7296da420d3:

  ARM: exynos: Enable support for ARM architected timers (2019-09-09 20:56:43 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.4, part 2

1. Fix system restart on S3C6410 due to missing match of watchdog,
2. Enable suppor for ARM architected timers on Exynos.

----------------------------------------------------------------
Lihua Yao (1):
      ARM: samsung: Fix system restart on S3C6410

Marek Szyprowski (1):
      ARM: exynos: Enable support for ARM architected timers

 arch/arm/mach-exynos/Kconfig           | 1 +
 arch/arm/plat-samsung/watchdog-reset.c | 1 +
 2 files changed, 2 insertions(+)
