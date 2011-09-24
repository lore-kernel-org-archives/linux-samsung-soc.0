From: KyongHo Cho <pullip.cho@samsung.com>
Subject: [PATCH 0/4] iommu/exynos: Add IOMMU and Enhance System MMU for Exynos4
Date: Sat, 24 Sep 2011 09:38:42 +0900
Message-ID: <1316824726-20695-1-git-send-email-pullip.cho@samsung.com>
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
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Cc: Ohad Ben-Cohen <ohad@wizery.com>, YoungLak Kim <younglak1004.kim@samsung.com>, Joerg Roedel <joro@8bytes.org>, Kukjin Kim <kgene.kim@samsung.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

The first 2 patches are the revolutionary change to the device definition
of System MMU for Exynos4 SoCs:
 - System MMU ID is removed and a device and its dedicated System MMU are
   bound during the machine initialization.
 - Only the System MMU platform devices that are bound to their master
   devices are initialized. If a System MMU is not initialized, it is no
   longer available.
 - Clock gating of System MMU with clkdev.
 - Moved System MMU driver to the IOMMU's dedicated directory,
   drivers/iommu.

The last 2 patches introduce new IOMMU API implementation for Exynos4
System MMU. They implements all IOMMU API including Ohad's latest
suggestion about MMU fault handling and Joerg's suggestion about
bus_type.

Diffstat:

arch/arm/mach-exynos4/Kconfig               |    2 -
arch/arm/mach-exynos4/clock.c               |   43 +-
arch/arm/mach-exynos4/dev-sysmmu.c          |  281 +++-------
arch/arm/mach-exynos4/include/mach/irqs.h   |    1 -
arch/arm/mach-exynos4/include/mach/map.h    |    1 -
arch/arm/mach-exynos4/include/mach/sysmmu.h |   96 ++--
arch/arm/mach-exynos4/mach-armlex4210.c     |   24 +-
arch/arm/mach-exynos4/mach-smdkv310.c       |   28 +-
arch/arm/plat-s5p/Kconfig                   |    8 -
arch/arm/plat-s5p/Makefile                  |    1 -
arch/arm/plat-s5p/include/plat/sysmmu.h     |   95 ---
arch/arm/plat-s5p/sysmmu.c                  |  312 ----------
drivers/iommu/Kconfig                       |   14 +
drivers/iommu/Makefile                      |    1 +
drivers/iommu/exynos_iommu.c                |  859 +++++++++++++++++++++++++++
15 files changed, 1084 insertions(+), 682 deletions(-)
