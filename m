From: John Youn <John.Youn@synopsys.com>
Subject: Re: [PATCH v3 0/4] Exynos4412-based Trats2 USB gadget (DWC2) fixes
Date: Mon, 28 Sep 2015 18:21:23 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC37F2EC@US01WEMBX2.internal.synopsys.com>
References: <1442830572-6765-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "balbi@ti.com" <balbi@ti.com>
Cc: Robert Baldyga <r.baldyga@samsung.com>, John Youn <John.Youn@synopsys.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 9/21/2015 3:16 AM, Marek Szyprowski wrote:
> Hello,
> 
> This is an updated DWC2 related part of initial patchset posted here:
> https://lkml.org/lkml/2015/8/21/306 
> Only DWC2 related patches have been modified since the initial
> submission.
> 
> Changelog:
> v3:
> - rebased onto latest 'testing/next' from Felipe Balbi (includes
>   s3c_hsotg -> dwc2 rename)
> 
> v2:
> - moved setting of ll_hw_enabled flag to enable/disable functions,
>   as suggested by John Youn
> - moved setting of phy width to dwc2_lowlevel_init function
> 
> 
> Marek Szyprowski (4):
>   usb: dwc2: remove double call to dwc2_hsotg_of_probe
>   usb: dwc2: remove non-functional clock gating
>   usb: dwc2: fix unbalanced phy control
>   usb: dwc2: refactor common low-level hw code to platform.c
> 
>  drivers/usb/dwc2/core.h     |   4 +-
>  drivers/usb/dwc2/gadget.c   | 201 ++++---------------------------------
>  drivers/usb/dwc2/platform.c | 236 ++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 217 insertions(+), 224 deletions(-)
> 


Tested-by: John Youn <johnyoun@synopsys.com>
Acked-by: John Youn <johnyoun@synopsys.com>

Could you queue this Felipe?

Regards,
John
