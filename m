From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v5 0/6] Add device tree support for PL330 dma controller driver
Date: Wed, 28 Sep 2011 14:55:19 +0530
Message-ID: <1317201925-25148-1-git-send-email-thomas.abraham@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:18463 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751973Ab1I1JZl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Sep 2011 05:25:41 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LS8002XB7IRLLW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 28 Sep 2011 18:25:39 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.37])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LS8006X77IKS650@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 28 Sep 2011 18:25:39 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org, vinod.koul@intel.com
Cc: grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, robherring2@gmail.com, patches@linaro.org, jassisinghbrar@gmail.com, boojin.kim@samsung.com

Changes since v4:
- Rebased with Samsung maintainer's for-next branch which is at linux-3.1-rc7
  - Modified Patch 6/6 to apply cleanly.

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
to pl330 dma driver and also adds a check to ensure that the filter
function proceeds only if it the dma channel being investigated belongs
to pl330 dma controller instance.

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

This patchset is based on Linux 3.1-rc7 and tested tested for both
device-tree and non-device-tree kernel on smdkv310.

Thomas Abraham (6):
  DMA: PL330: move filter function into driver
  DMA: PL330: Infer transfer direction from transfer request instead of platform data
  ARM: EXYNOS4: Modify platform data for pl330 driver
  DMA: PL330: Add device tree support
  ARM: SAMSUNG: Add device tree support for pl330 dma engine wrappers
  ARM: EXYNOS4: Limit usage of pl330 device instance to non-dt build
