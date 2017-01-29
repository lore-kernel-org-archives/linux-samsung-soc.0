From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] soc: samsung: exynos for v4.11, 2nd round
Date: Sun, 29 Jan 2017 22:06:27 +0200
Message-ID: <20170129200630.22083-2-krzk@kernel.org>
References: <20170129200630.22083-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20170129200630.22083-1-krzk@kernel.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@kernel.org>, arm@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request (tags/samsung-drivers-soc-pmu-4.11).

This adds support for Exynos5433 to PMU driver which is needed
by Marek's patchset:
 - [PATCH v2 0/8] Pad retentions support for Exynos5433
   https://lkml.kernel.org/r/1485419634-28331-1-git-send-email-m.szyprowski () samsung ! com


Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Lee Jones <lee.jones@linaro.org>

Best regards,
Krzysztof


The following changes since commit 1da6de33e43901ec5220cbf292d71172635ada67:

  soc: samsung: pmu: Remove messages for failed memory allocation (2017-01-20 18:37:27 +0200)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-soc-pmu-4.11-2

for you to fetch changes up to ee55ae6194a5439bde3a3b8ee0abda63c610e740:

  soc: samsung: pmu: Remove duplicated define for ARM_L2_OPTION register (2017-01-27 11:32:31 +0200)

----------------------------------------------------------------
Continuation of improvements for Exynos PM drivers for v4.11:
1. Add support for Exynos5433 to Power Management Unit (PMU) and Power
   Domains drivers.
2. Cleanups of duplicated and unused defines.

----------------------------------------------------------------
Chanwoo Choi (1):
      soc: samsung: pm_domains: Add new Exynos5433 compatible

Krzysztof Kozlowski (2):
      soc: samsung: pmu: Remove unused and duplicated defines
      soc: samsung: pmu: Remove duplicated define for ARM_L2_OPTION register

Marek Szyprowski (1):
      soc: samsung: pmu: Add dummy support for Exynos5433 SoC

 .../devicetree/bindings/power/pd-samsung.txt       |  1 +
 arch/arm/mach-exynos/suspend.c                     |  6 +-
 drivers/soc/samsung/exynos-pmu.c                   |  6 +-
 drivers/soc/samsung/exynos5250-pmu.c               |  2 +-
 drivers/soc/samsung/exynos5420-pmu.c               |  4 +-
 drivers/soc/samsung/pm_domains.c                   |  7 ++
 include/linux/soc/samsung/exynos-regs-pmu.h        | 75 +++-------------------
 7 files changed, 26 insertions(+), 75 deletions(-)
