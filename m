From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v4 0/6] Add device tree support for PL330 dma controller driver
Date: Mon, 19 Sep 2011 11:58:56 +0530
Message-ID: <1316413742-23535-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63424 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751071Ab1ISG3g (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Sep 2011 02:29:36 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LRR00IC7BD2ZC30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 15:29:35 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LRR00A9LBD4LZ90@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 19 Sep 2011 15:29:35 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, vinod.koul@intel.com
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Changes since v3:
- In Patch 4/6, a recommendation is added in the pl330 binding documentation
  for the name of the property which specifies the dma channel in the client
  device node.
- In Patch 6/6, dropped #ifdef around of_have_populated_dt.

Changes since v2:
- Only the sixth patch is changed, to make dma platform data conditionally
  selectable.
- Tested with v8 version of pl330 dma driver update patches from Boojin Kim.

Changes since v1:
- Removed "arm,pl330-pdma" and "arm,pl330-mdma" compatible values.
- Removed "arm,primecell-periphid" and "arm,pl330-peri-reqs"
  property requirements.

This patchset adds device tree support for PL330 driver and uses it
to add device tree support for Samsung platforms, specifically Exynos4.

First patch moves the pl330_filter function from Samsung specific wrappers
to pl330 dma driver and also adds a check to ensure that the filter function
proceeds only if it the dma channel being investigated belongs to pl330
dma controller instance.

Second patch adds support to infer the direction of the dma transfer
using the direction specified with the transfer request instead of
including this information in the platform data. This simlifies the
addition of device tree support. Third patch simplifies the platform
data for Exynos4 pl330 dma controllers. Similar patches simplifying
the platform data for other Samsung platforms is under development.

Fourth patch adds device tree support for pl330 dma controller driver.
A dma channel is represented using a phandle of the dma controller
node and the channel id within that controller. Client driver request
a dma channel using the phandle and channel id pair. Correspondingly,
the pl330 filter function has been modified to lookup a channel based
on this value.

Fifth patch adds device tree support for Samsung's DMA engine wrappers.
Client drivers retrive the channel property from their device node and
pass it to the wrappers. The wrapper functions use the property value
as the filter function parameter. Sixth patch restricts the usage of
pl330 device and platform data instances to non-dt platforms.

This patchset is based on Linux 3.1-rc6 with the following patch sets.

* To use DMA generic APIs for Samsung DMA - v8 - (16 patches)
* ARM: Samsung: use dma-pl330 device name for clock (3 patches)
* ARM: S5P64X0: Add the devname for DMA clock.
* ARM: SAMSUNG: register the second instance of PL330 DMAC (3 patches)

This patchset has been tested for both device-tree and non-device-tree
based linux 3.1-rc6 kernel.

Thomas Abraham (6):
  DMA: PL330: move filter function into driver
  DMA: PL330: Infer transfer direction from transfer request instead of platform data
  ARM: EXYNOS4: Modify platform data for pl330 driver
  DMA: PL330: Add device tree support
  ARM: SAMSUNG: Add device tree support for pl330 dma engine wrappers
  ARM: EXYNOS4: Limit usage of pl330 device instance to non-dt build

 .../devicetree/bindings/dma/arm-pl330.txt          |   30 +++
 arch/arm/mach-exynos4/Kconfig                      |   10 +
 arch/arm/mach-exynos4/Makefile                     |    3 +-
 arch/arm/mach-exynos4/dma.c                        |  227 ++++++--------------
 arch/arm/plat-samsung/dma-ops.c                    |   15 +-
 arch/arm/plat-samsung/include/plat/dma-ops.h       |    1 +
 arch/arm/plat-samsung/include/plat/dma-pl330.h     |    3 +-
 drivers/dma/pl330.c                                |   99 +++++----
 include/linux/amba/pl330.h                         |   15 +-
 9 files changed, 177 insertions(+), 226 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/dma/arm-pl330.txt
