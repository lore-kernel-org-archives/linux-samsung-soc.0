From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2 0/4] Exynos4210: fix power domain for MDMA1 device
Date: Thu, 26 Nov 2015 13:49:46 +0100
Message-ID: <1448542190-19498-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:54133 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750943AbbKZMuC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Nov 2015 07:50:02 -0500
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

The main change from v1 is reusing patches, which move PID/CIR reading
from amba_device_add() to amba_match() and adding power domain support
there. This way -EPROBE_DEFER error code can be handled properly.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v2:
- added 2 patches from 'On-demand device probing' thread
  (https://lkml.org/lkml/2015/9/29/189), which move PID/CIR reading
  from amba_device_add() to amba_match()
- moved dev_pm_domain_attach() to amba_match(), which is allowed to
  return -EPROBE_DEFER

v1: http://www.spinics.net/lists/arm-kernel/msg463185.html
- initial version


Patch summary:

Marek Szyprowski (2):
  ARM: dts: exynos4210: MDMA1 device belongs to LCD0 power domain
  ARM: amba: Properly handle devices with power domains

Tomeu Vizoso (2):
  driver core: handle -EPROBE_DEFER from bus_type.match()
  ARM: amba: Move reading of periphid to amba_match()

 arch/arm/boot/dts/exynos4210.dtsi |  4 ++
 drivers/amba/bus.c                | 94 ++++++++++++++++++++++-----------------
 drivers/base/dd.c                 | 24 +++++++++-
 include/linux/device.h            |  2 +-
 4 files changed, 79 insertions(+), 45 deletions(-)

-- 
1.9.2
