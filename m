From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/5] soc: samsung: Second pull for v5.4
Date: Wed,  4 Sep 2019 19:49:59 +0200
Message-ID: <20190904175002.10487-3-krzk@kernel.org>
References: <20190904175002.10487-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190904175002.10487-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

Best regards,
Krzysztof


The following changes since commit 40d8aff614f71ab3cab20785b4f213e3802d4e87:

  soc: samsung: chipid: Convert exynos-chipid driver to use the regmap API (2019-08-15 20:25:25 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-5.4-2

for you to fetch changes up to 28578825ede61834a2c46e7f9a89012c4c7a667f:

  soc: samsung: chipid: Select missing dependency for EXYNOS_CHIPID (2019-08-22 20:16:20 +0200)

----------------------------------------------------------------
Samsung soc drivers changes for v5.4, part 2

Fixes and cleanups for recently introduced Exynos chipid driver.

----------------------------------------------------------------
Colin Ian King (1):
      soc: samsung: chipid: Fix memory leak in error path

Sylwester Nawrocki (2):
      soc: samsung: chipid: Remove the regmap lookup error log
      soc: samsung: chipid: Select missing dependency for EXYNOS_CHIPID

 drivers/soc/samsung/Kconfig         |  1 +
 drivers/soc/samsung/exynos-chipid.c | 18 +++++++++++-------
 2 files changed, 12 insertions(+), 7 deletions(-)
