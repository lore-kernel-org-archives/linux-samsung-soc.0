From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/2] usb: exynos: Fix compatible strings used for device
Date: Fri, 25 Jan 2013 10:01:32 -0800
Message-ID: <010e01cdfb26$04adcb00$0e096100$@samsung.com>
References: <1359035130-22667-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:25889 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756793Ab3AYSB4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Jan 2013 13:01:56 -0500
In-reply-to: <1359035130-22667-1-git-send-email-gautam.vivek@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vivek Gautam' <gautam.vivek@samsung.com>, linux-usb@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, gregkh@linuxfoundation.org, balbi@ti.com, stern@rowland.harvard.edu, thomas.abraham@linaro.org, rob.herring@calxeda.com, grant.likely@secretlab.ca, sylvester.nawrocki@gmail.com, dianders@chromium.org, jg1.han@samsung.com, cpgs@samsung.com

Vivek Gautam wrote:
> 
> Using chip specific compatible string as it should be.
> So fixing this for ehci-s5p, ohci-exynos and dwc3-exynos
> which till now used a generic 'exynos' in their compatible strings.
> 
> Changes from v1:
> 	- Changing compatible string from "samsung,exynos5250-dwc3" to
> 	  "samsung,exynos5250-dwusb3" as per discussion happened in
> thread:
> 	  [PATCH 0/2] usb: exynos: Fix compatible strings used for device.
> 
> Vivek Gautam (2):
>   usb: ehci-s5p/ohci-exynos: Fix compatible strings for the device
>   usb: dwc3-exynos: Fix compatible strings for the device
> 
>  drivers/usb/dwc3/dwc3-exynos.c |    2 +-
>  drivers/usb/host/ehci-s5p.c    |    2 +-
>  drivers/usb/host/ohci-exynos.c |    2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
For now, I'm fine on this series, I'm still thinking we need to sort out the
chip name in compatible for IP though.

Felipe, please go ahead, if you want my ack, feel free to add:

Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks.

- Kukjin
