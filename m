From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 0/5] USB: host: Remove non-DT support for Exynos EHCI and OHCI
Date: Thu, 10 Oct 2013 15:29:01 +0900
Message-ID: <000001cec582$02a6cfb0$07f46f10$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:16766 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751125Ab3JJG3G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Oct 2013 02:29:06 -0400
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Greg Kroah-Hartman' <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Alan Stern' <stern@rowland.harvard.edu>, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Tomasz Figa' <t.figa@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

This patchset removes non-DT support for Exynos EHCI and OHCI
from arch and driver directories, because the non-DT for EXYNOS SoCs
is not supported from v3.11.

In order to keep the consistency, ehci-s5p.c is changed to
ehci-exynos.c. So, the name of Exynos EHCI and OHCI driver is
as below:
 - ehci-exynos.c
 - ohci-exynos.c

Also, missing usb_put_hcd() is added to prevent memory leak.

In order to prevent build error issues or merge conflict,
this patchset includes the following patches that were
previously submitted.
 - [PATCH] ARM: SAMSUNG: Remove unused s5p_device_ehci
   (http://www.spinics.net/lists/linux-samsung-soc/msg23397.html)
 - [PATCH] USB: ohci-exynos: Add missing usb_put_hcd() to prevent memory leak
   (http://www.spinics.net/lists/linux-usb/msg95282.html)

These patches were tested on Exynos5250.

---
 arch/arm/plat-samsung/Kconfig                  |    5 -
 arch/arm/plat-samsung/devs.c                   |   34 -----
 arch/arm/plat-samsung/include/plat/devs.h      |    1 -
 drivers/usb/host/Kconfig                       |    5 +-
 drivers/usb/host/Makefile                      |    2 +-
 drivers/usb/host/{ehci-s5p.c => ehci-exynos.c} |  165 ++++++++++--------------
 drivers/usb/host/ohci-exynos.c                 |   17 +--
 include/linux/platform_data/usb-ehci-s5p.h     |   21 ---
 include/linux/platform_data/usb-ohci-exynos.h  |   21 ---
 9 files changed, 76 insertions(+), 195 deletions(-)
 rename drivers/usb/host/{ehci-s5p.c => ehci-exynos.c} (55%)
 delete mode 100644 include/linux/platform_data/usb-ehci-s5p.h
 delete mode 100644 include/linux/platform_data/usb-ohci-exynos.h
