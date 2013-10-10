From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH V2 0/5] USB: host: Remove non-DT support for Exynos EHCI and
 OHCI
Date: Thu, 10 Oct 2013 16:40:03 +0900
Message-ID: <000101cec58b$ee8bd2f0$cba378d0$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:53532 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750799Ab3JJHkE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 03:40:04 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Sachin Kamat' <sachin.kamat@linaro.org>, 'Jingoo Han' <jg1.han@samsung.com>

This patchset removes non-DT support for Exynos EHCI and OHCI
from arch and driver directories, because the non-DT for EXYNOS SoCs
is not supported from v3.11. Also, missing usb_put_hcd() is added to
prevent memory leak.

In order to keep the consistency, ehci-s5p.c is changed to
ehci-exynos.c. So, the names of Exynos EHCI and OHCI drivers are
as below:
 - ehci-exynos.c
 - ohci-exynos.c

In order to prevent build error issues or merge conflict,
this patchset includes the following patches that were
previously submitted.
 - [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
   (http://www.spinics.net/lists/linux-samsung-soc/msg23397.html)
 - [PATCH] USB: ohci-exynos: Add missing usb_put_hcd() to prevent memory leak
   (http://www.spinics.net/lists/linux-usb/msg95282.html)

These patches were tested on Exynos5250.

Changes from v1:
  * Changed the order of patches in order to avoid unnecessary code churn

Jingoo Han (5)
  ARM: SAMSUNG: Remove unused s5p_device_ehci
  USB: ehci-s5p: Remove non-DT support
  USB: ohci-exynos: Remove non-DT support
  USB: ohci-exynos: Add missing usb_put_hcd()
  USB: host: Rename ehci-s5p to ehci-exynos

---
 arch/arm/plat-samsung/Kconfig                  |    5 -
 arch/arm/plat-samsung/devs.c                   |   34 -----
 arch/arm/plat-samsung/include/plat/devs.h      |    1 -
 drivers/usb/host/Kconfig                       |    5 +-
 drivers/usb/host/Makefile                      |    2 +-
 drivers/usb/host/{ehci-s5p.c => ehci-exynos.c} |  164 ++++++++++--------------
 drivers/usb/host/ohci-exynos.c                 |   17 +--
 include/linux/platform_data/usb-ehci-s5p.h     |   21 ---
 include/linux/platform_data/usb-ohci-exynos.h  |   21 ---
 9 files changed, 76 insertions(+), 194 deletions(-)
 rename drivers/usb/host/{ehci-s5p.c => ehci-exynos.c} (55%)
 delete mode 100644 include/linux/platform_data/usb-ehci-s5p.h
 delete mode 100644 include/linux/platform_data/usb-ohci-exynos.h
