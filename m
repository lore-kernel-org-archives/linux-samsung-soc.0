From: Vladimir Zapolskiy <vz@mleia.com>
Subject: [PATCH 0/3] ARM: Samsung: use dma-pl330 device name for clock
Date: Wed, 17 Aug 2011 00:31:03 +0300
Message-ID: <1313530266-14939-1-git-send-email-vz@mleia.com>
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
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>
List-Id: linux-samsung-soc@vger.kernel.org

This changeset replaces s3c-pl330.x clock device names with
dma-pl330.x, otherwise there won't be a correspondence between clock
device name and amba device name, thus clocks can't be enabled.

Fixes runtime errors on clk_get() from drivers/dma/pl330.c:
  dma-pl330 dma-pl330.0: Cannot get operation clock.
  dma-pl330: probe of dma-pl330.0 failed with error -22

The changes are based on linux-samsung/next/topic-dma-pl330 branch.

Vladimir Zapolskiy (3):
  ARM: EXYNOS4: use dma-pl330 device name for clock
  ARM: S5PC100: use dma-pl330 device name for clock
  ARM: S5PV210: use dma-pl330 device name for clock

 arch/arm/mach-exynos4/clock.c |    4 ++--
 arch/arm/mach-s5pc100/clock.c |    4 ++--
 arch/arm/mach-s5pv210/clock.c |    4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.7.5.1
