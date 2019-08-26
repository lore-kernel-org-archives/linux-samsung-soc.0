From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v2 1/2 RESEND] usb: core: phy: add support for PHY
 calibration
Date: Mon, 26 Aug 2019 10:55:33 +0200
Message-ID: <a380a635-e036-1a18-bc0f-947931f8735c@samsung.com>
References: <20190808094128.27213-1-m.szyprowski@samsung.com>
        <CGME20190808094146eucas1p2a5a88ce5e7a87d47c4bcececab4df9a5@eucas1p2.samsung.com>
        <20190808094128.27213-2-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190808094128.27213-2-m.szyprowski@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Mathias Nyman <mathias.nyman@intel.com>, Felipe Balbi <balbi@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jochen Sprickerhof <jochen@sprickerhof.de>, Anand Moon <linux.amoon@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Greg

On 2019-08-08 11:41, Marek Szyprowski wrote:
> Some PHYs (for example Exynos5 USB3.0 DRD PHY) require calibration to be
> done after every USB HCD reset. Generic PHY framework has been already
> extended with phy_calibrate() function in commit 36914111e682 ("drivers:
> phy: add calibrate method"). This patch adds support for it to generic
> PHY handling code in USB HCD core.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Tested-by: Jochen Sprickerhof <jochen@sprickerhof.de>

Greg: any chance to give it this a try in -next? If not, maybe You can 
point someone whose review will help?


> ---
>   drivers/usb/core/hcd.c |  7 +++++++
>   drivers/usb/core/phy.c | 21 +++++++++++++++++++++
>   drivers/usb/core/phy.h |  1 +
>   3 files changed, 29 insertions(+)
>
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index 88533938ce19..b89936c1df23 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2291,6 +2291,9 @@ int hcd_bus_resume(struct usb_device *rhdev, pm_message_t msg)
>   	hcd->state = HC_STATE_RESUMING;
>   	status = hcd->driver->bus_resume(hcd);
>   	clear_bit(HCD_FLAG_WAKEUP_PENDING, &hcd->flags);
> +	if (status == 0)
> +		status = usb_phy_roothub_calibrate(hcd->phy_roothub);
> +
>   	if (status == 0) {
>   		struct usb_device *udev;
>   		int port1;
> @@ -2864,6 +2867,10 @@ int usb_add_hcd(struct usb_hcd *hcd,
>   	}
>   	hcd->rh_pollable = 1;
>   
> +	retval = usb_phy_roothub_calibrate(hcd->phy_roothub);
> +	if (retval)
> +		goto err_hcd_driver_setup;
> +
>   	/* NOTE: root hub and controller capabilities may not be the same */
>   	if (device_can_wakeup(hcd->self.controller)
>   			&& device_can_wakeup(&hcd->self.root_hub->dev))
> diff --git a/drivers/usb/core/phy.c b/drivers/usb/core/phy.c
> index 7580493b867a..fb1588e7c282 100644
> --- a/drivers/usb/core/phy.c
> +++ b/drivers/usb/core/phy.c
> @@ -151,6 +151,27 @@ int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
>   }
>   EXPORT_SYMBOL_GPL(usb_phy_roothub_set_mode);
>   
> +int usb_phy_roothub_calibrate(struct usb_phy_roothub *phy_roothub)
> +{
> +	struct usb_phy_roothub *roothub_entry;
> +	struct list_head *head;
> +	int err;
> +
> +	if (!phy_roothub)
> +		return 0;
> +
> +	head = &phy_roothub->list;
> +
> +	list_for_each_entry(roothub_entry, head, list) {
> +		err = phy_calibrate(roothub_entry->phy);
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(usb_phy_roothub_calibrate);
> +
>   int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub)
>   {
>   	struct usb_phy_roothub *roothub_entry;
> diff --git a/drivers/usb/core/phy.h b/drivers/usb/core/phy.h
> index dad564e2d2d4..20a267cd986b 100644
> --- a/drivers/usb/core/phy.h
> +++ b/drivers/usb/core/phy.h
> @@ -18,6 +18,7 @@ int usb_phy_roothub_exit(struct usb_phy_roothub *phy_roothub);
>   
>   int usb_phy_roothub_set_mode(struct usb_phy_roothub *phy_roothub,
>   			     enum phy_mode mode);
> +int usb_phy_roothub_calibrate(struct usb_phy_roothub *phy_roothub);
>   int usb_phy_roothub_power_on(struct usb_phy_roothub *phy_roothub);
>   void usb_phy_roothub_power_off(struct usb_phy_roothub *phy_roothub);
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
