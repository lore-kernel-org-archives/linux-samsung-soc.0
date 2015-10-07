From: John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Subject: Re: [PATCH v5 2/2] usb: dwc2: refactor common low-level hw code to
 platform.c
Date: Wed, 7 Oct 2015 02:37:13 +0000
Message-ID: <2B3535C5ECE8B5419E3ECBE30077290901DC38A41D@US01WEMBX2.internal.synopsys.com>
References: <874mi4gale.fsf@saruman.tx.rr.com>
 <1444121749-22494-1-git-send-email-m.szyprowski@samsung.com>
 <1444121749-22494-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Cc: Robert Baldyga <r.baldyga-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, John Youn <John.Youn-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10/6/2015 1:56 AM, Marek Szyprowski wrote:
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
> Signed-off-by: Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
> Changelog:
> v5:
> - added separate patch removing init_mutex, which is no longer needed
> 
> v4:
> - fixed broken conditional compilation and adjusted comments in dwc2_hsotg
>   structure documentation
> 
> v3:
> - rebased onto latest 'testing/next' from Felipe Balbi (includes
>   s3c_hsotg -> dwc2 rename)
> 
> v2:
> - moved setting of ll_hw_enabled flag to enable/disable functions,
>   as suggested by John Youn
> - moved setting of phy width to dwc2_lowlevel_init function
> ---
>  drivers/usb/dwc2/core.h     |  24 +++--
>  drivers/usb/dwc2/gadget.c   | 186 ++++----------------------------------
>  drivers/usb/dwc2/platform.c | 216 ++++++++++++++++++++++++++++++++++++--------
>  3 files changed, 210 insertions(+), 216 deletions(-)
> 
> diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
> index 89091db..7e79976 100644
> --- a/drivers/usb/dwc2/core.h
> +++ b/drivers/usb/dwc2/core.h
> @@ -579,6 +579,15 @@ struct dwc2_hregs_backup {
>   *                      - USB_DR_MODE_PERIPHERAL
>   *                      - USB_DR_MODE_HOST
>   *                      - USB_DR_MODE_OTG
> + * @hcd_enabled		Host mode sub-driver initialization indicator.
> + * @gadget_enabled	Peripheral mode sub-driver initialization indicator.
> + * l@l_hw_enabled	Status of low-level hardware resources.

Typo here.


Otherwise for this series:

Acked-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>
Tested-by: John Youn <johnyoun-HKixBCOQz3hWk0Htik3J/w@public.gmane.org>

Tested on IP v3.20a host/gadget/DRD mode.

Regards,
John

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
