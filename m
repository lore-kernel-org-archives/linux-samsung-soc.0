From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH 0/2] add ehci-s5p AHB burst function
Date: Wed, 29 Feb 2012 12:41:21 +0000
Message-ID: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f174.google.com ([74.125.82.174]:55981 "EHLO
	mail-we0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752272Ab2B2Mn3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 07:43:29 -0500
Received: by wejx9 with SMTP id x9so1663118wej.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 04:43:27 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jg1.han@samsung.com, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk, Sangwook Lee <sangwook.lee@linaro.org>

Enable burst transfer from AHB for EHCI.
This fixes data transfer issue of USB Ethernet with EHCI.
Without this patch, ping works and network utilities such as scp hardly works.

It was tested on Origen board with the following configs.
root@linaro-alip:~# lsusb -t
/:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=exynos-ohci/3p, 12M
/:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=s5p-ehci/3p, 480M
   |__ Port 1: Dev 2, If 0, Class=vend., Driver=MOSCHIP usb-ethernet driver, 480M


Sangwook Lee (2):
  ARM: EXYNOS: Add EHCI AHB burst function
  USB: ehci-s5p: add function for burst

 arch/arm/mach-exynos/setup-usb-phy.c      |    6 ++++++
 arch/arm/plat-samsung/devs.c              |    2 ++
 arch/arm/plat-samsung/include/plat/ehci.h |   19 +++++++++++++++++++
 drivers/usb/host/ehci-s5p.c               |    3 +++
 4 files changed, 30 insertions(+), 0 deletions(-)

-- 
1.7.4.1
