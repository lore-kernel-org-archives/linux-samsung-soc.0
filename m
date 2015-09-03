From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH 7/7] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Thu, 3 Sep 2015 01:12:07 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC354016@US01WEMBX2.internal.synopsys.com>
References: <1440160723-6636-1-git-send-email-m.szyprowski@samsung.com>
 <1440160723-6636-8-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:39343 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752791AbbICBMJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Sep 2015 21:12:09 -0400
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <John.Youn@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>

On 8/21/2015 5:39 AM, Marek Szyprowski wrote:
> DWC2 module on some platforms needs three additional hardware
> resources: phy controller, clock and power supply. All of them must be
> enabled/activated to properly initialize and operate. This was initially
> handled in s3c-hsotg driver, which has been converted to 'gadget' part
> of dwc2 driver. Unfortunately, not all of this code got moved to common
> platform code, what resulted in accessing DWC2 registers without
> enabling low-level hardware resources. This fails for example on Exynos
> SoCs. This patch moves all the code for managing those resources to
> common platform.c file and provides convenient wrappers for controlling
> them.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/dwc2/core.h     |   4 +-
>  drivers/usb/dwc2/gadget.c   | 188 +++++-----------------------------------
>  drivers/usb/dwc2/platform.c | 207 ++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 195 insertions(+), 204 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 0ed87620941b..ec820bdf98c0 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -690,6 +690,7 @@ struct dwc2_hsotg {
>  	enum usb_dr_mode dr_mode;
>  	unsigned int hcd_enabled:1;
>  	unsigned int gadget_enabled:1;
> +	unsigned int ll_hw_enabled:1;

It seems like this flag is used to restore the state of the
lowlevel_hw on suspend/resume?

I think it is clearer to put the setting/clearing of the flag
inside the ll_hw_enable/disable and then check and adjust on
suspend/resume. That way you don't have to manage this flag
everywhere you call enable/disable().

John
