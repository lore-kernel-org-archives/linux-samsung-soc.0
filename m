From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/4] ARM: exynos: Mach for v5.3
Date: Tue, 25 Jun 2019 21:34:51 +0200
Message-ID: <20190625193451.7696-4-krzk@kernel.org>
References: <20190625193451.7696-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190625193451.7696-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

The following changes since commit a188339ca5a396acc588e5851ed7e19f66b0ebd9:

  Linux 5.2-rc1 (2019-05-19 15:47:09 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-soc-5.3

for you to fetch changes up to a55e040c6f21f55f81c53c56e1d8095df35e1d02:

  ARM: exynos: Cleanup cppcheck shifting warning (2019-06-25 20:45:09 +0200)

----------------------------------------------------------------
Samsung mach/soc changes for v5.3

Only cleanups and minor fixes.

----------------------------------------------------------------
Arnd Bergmann (1):
      ARM: exynos: Only build MCPM support if used

Krzysztof Kozlowski (1):
      ARM: exynos: Make ARCH_EXYNOS3 a default option

Phong Tran (1):
      ARM: exynos: Cleanup cppcheck shifting warning

 arch/arm/mach-exynos/Kconfig   | 7 ++++++-
 arch/arm/mach-exynos/Makefile  | 2 +-
 arch/arm/mach-exynos/suspend.c | 8 ++++----
 3 files changed, 11 insertions(+), 6 deletions(-)
