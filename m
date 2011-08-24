From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/5] ARM: EXYNOS4: Add support new EXYNOS4212 SoC
Date: Wed, 24 Aug 2011 22:25:47 +0900
Message-ID: <1314192352-14911-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds support new EXYNOS4212 SoC and SMDK4212 Board.

[PATCH 1/5] ARM: EXYNOS4: Add support new EXYNOS4212 SoC
[PATCH 2/5] ARM: EXYNOS4: Add support clock for EXYNOS4212
[PATCH 3/5] ARM: EXYNOS4: Add support PM for EXYNOS4212
[PATCH 4/5] ARM: EXYNOS4: Add support SMDK4212 Board
[PATCH 5/5] tty: Add support serial for EXYNOS4212 SoC

 arch/arm/mach-exynos4/Kconfig                      |   30 ++
 arch/arm/mach-exynos4/Makefile                     |    8 +-
 arch/arm/mach-exynos4/clock-exynos4210.c           |  139 ++++++++++
 arch/arm/mach-exynos4/clock-exynos4212.c           |  118 ++++++++
 arch/arm/mach-exynos4/clock.c                      |  218 ++++++++++-----
 arch/arm/mach-exynos4/cpu.c                        |   12 +-
 arch/arm/mach-exynos4/include/mach/exynos4-clock.h |   43 +++
 arch/arm/mach-exynos4/include/mach/regs-clock.h    |   54 +++--
 arch/arm/mach-exynos4/mach-smdk4212.c              |  292 ++++++++++++++++++++
 arch/arm/mach-exynos4/pm.c                         |   79 +-----
 arch/arm/plat-s5p/cpu.c                            |    9 +
 arch/arm/plat-s5p/include/plat/exynos4.h           |    5 +-
 arch/arm/plat-s5p/include/plat/pll.h               |   55 ++++-
 arch/arm/plat-samsung/include/plat/cpu.h           |    8 +
 drivers/tty/serial/Kconfig                         |    4 +-
 15 files changed, 903 insertions(+), 171 deletions(-)
