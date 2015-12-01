From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 0/3] Exynos4210: fix power domain for MDMA1 device
Date: Tue, 01 Dec 2015 14:34:23 +0100
Message-ID: <1448976866-7892-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Ulf Hansson <ulf.hansson@linaro.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patchset fixes mysterious boot hang on Exynos 4210 SoCs, when IOMMU
is enabled. There is no direct dependency between IOMMU devices and
MDMA1. However enabling IOMMU changes the device probe order, what
results in LCD0 power domain being turned off for some time. During that
time the registration of MDMA1 device happens, what results in system
hangs, because the common bus code tries to read PID/CID registers from
turned-off device.

Changes since v2 include some code refactoring done to fix issues
pointed by Ulf Hansson.

Best regards
Marek Szyprowski
Samsung R&D Institute Poland

Changelog:
v3:
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

 Documentation/driver-model/porting.txt |  6 ++-
 drivers/amba/bus.c                     | 83 +++++++++++++++++++---------------
 drivers/base/dd.c                      | 24 +++++++++-
 include/linux/device.h                 |  2 +-
 4 files changed, 74 insertions(+), 41 deletions(-)

-- 
1.9.2
