From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 0/3] Exynos4210: fix power domain for MDMA1 device
Date: Wed, 02 Dec 2015 08:21:40 +0100
Message-ID: <1449040903-26674-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:16044 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754535AbbLBHVx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Dec 2015 02:21:53 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

This patchset fixes mysterious boot hang on Exynos 4210 SoCs, when IOMMU
is enabled. There is no direct dependency between IOMMU devices and
MDMA1. However enabling IOMMU changes the device probe order, what
results in LCD0 power domain being turned off for some time. During that
time the registration of MDMA1 device happens, what results in system
hangs, because the common bus code tries to read PID/CID registers from
turned-off device.

Changes since v3 include some more code refactoring done to fix issues
pointed by Ulf Hansson and Russel King.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:

v4:
- fixed more issues pointed by Ulf Hansson and Russell King

v3: https://lkml.org/lkml/2015/12/1/334
- fixed issues pointed by Ulf Hansson
- dropped patch for exynos4210 dts, because it already got queued for merging

v2: https://lkml.org/lkml/2015/11/26/229
- added 2 patches from 'On-demand device probing' thread
  (https://lkml.org/lkml/2015/9/29/189), which move PID/CIR reading
  from amba_device_add() to amba_match()
- moved dev_pm_domain_attach() to amba_match(), which is allowed to
  return -EPROBE_DEFER

v1: http://www.spinics.net/lists/arm-kernel/msg463185.html
- initial version


Patch summary:

Marek Szyprowski (1):
  ARM: amba: Properly handle devices with power domains

Tomeu Vizoso (2):
  driver core: handle -EPROBE_DEFER from bus_type.match()
  ARM: amba: Move reading of periphid to amba_match()

 Documentation/driver-model/porting.txt |   6 +-
 drivers/amba/bus.c                     | 152 ++++++++++++++++++---------------
 drivers/base/dd.c                      |  24 +++++-
 include/linux/device.h                 |   7 +-
 4 files changed, 112 insertions(+), 77 deletions(-)

-- 
1.9.2
