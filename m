From: kgene@kernel.org
Subject: RE: [PATCH v5 0/2] Adding USB 3.0 DRD-phy support for exynos5250
Date: Tue, 12 Feb 2013 22:31:00 -0800
Message-ID: <1e3101ce09b3$b2e178c0$18a46a40$@kernel.org>
References: <1360068256-19602-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:14859 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752504Ab3BMGbY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Feb 2013 01:31:24 -0500
In-reply-to: <1360068256-19602-1-git-send-email-gautam.vivek@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, gregkh@linuxfoundation.org, balbi@ti.com, grant.likely@secretlab.ca, rob.herring@calxeda.com, sylvester.nawrocki@gmail.com, tomasz.figa@gmail.com, av.tikhomirov@samsung.com, dianders@chromium.org, p.paneri@samsung.com

Vivek Gautam wrote:
> 
> Based on 'usb-next'
> 
> Changes from v4:
>  - Modifying function names and driver names to follow a common
>    naming convention.
>         "usb2phy" for samsung-usb2phy driver
>         "usb3phy" for samsung-usb3phy driver
>  - Changing file names "samsung-usb2.c" to "samsung-usb2phy.c" and,
>    "samsung-usb3.c" to "samsung-usb3phy.c"
>  - Removing dependencies for SAMSUNG_USB2PHY and
> SAMSUNG_USB3PHY.
>  - Arranging SAMSUNG_USB2PHY and SAMSUNG_USB3PHY to select
> SAMSUNG_USBPHY,
>    which is the usb-phy helper driver.
> 
> Vivek Gautam (2):
>   usb: phy: samsung: Common out the generic stuff
>   usb: phy: samsung: Add PHY support for USB 3.0 controller
> 
>  drivers/usb/phy/Kconfig           |   25 +-
>  drivers/usb/phy/Makefile          |    2 +
>  drivers/usb/phy/samsung-usb2phy.c |  511
> ++++++++++++++++++++++++++
>  drivers/usb/phy/samsung-usb3phy.c |  349 ++++++++++++++++++
>  drivers/usb/phy/samsung-usbphy.c  |  717
+------------------------------------
>  drivers/usb/phy/samsung-usbphy.h  |  328 +++++++++++++++++
>  6 files changed, 1219 insertions(+), 713 deletions(-)
>  create mode 100644 drivers/usb/phy/samsung-usb2phy.c
>  create mode 100644 drivers/usb/phy/samsung-usb3phy.c
>  create mode 100644 drivers/usb/phy/samsung-usbphy.h
> 
> --
> 1.7.6.5

For now, looks good to me, and if any enhancement is required, it can be
done next time.

Felipe, please go ahead with my ack :-)
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin
