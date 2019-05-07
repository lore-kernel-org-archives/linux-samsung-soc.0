From: =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>
Subject: Re: [PATCH] usb: core: verify devicetree nodes for disabled interfaces
Date: Tue, 07 May 2019 14:24:49 +0100
Message-ID: <yw1xy33iv1lq.fsf@mansr.com>
References: <CGME20190507125630eucas1p1c5fd171a8dc2a6b8eb9dd317fe245f0c@eucas1p1.samsung.com>
        <20190507125615.9381-1-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190507125615.9381-1-m.szyprowski@samsung.com> (Marek
        Szyprowski's message of "Tue, 07 May 2019 14:56:15 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Markus Reichl <m.reichl@fivetechno.de>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Marek Szyprowski <m.szyprowski@samsung.com> writes:

> Commit 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
> add support for disabling given USB device interface by adding nodes to
> the USB host controller device. The mentioned commit however identifies
> the given USB interface node only by the 'reg' property in the host
> controller children nodes and then checks for their the 'status'. The USB
> device interface nodes however also has to have a 'compatible' property as
> described in Documentation/devicetree/bindings/usb/usb-device.txt. This is
> important, because USB host controller might have child-nodes for other
> purposes. For example, Exynos EHCI and OHCI drivers already define
> child-nodes for each physical root hub port and assigns respective PHY
> controller and parameters for them. This conflicts with the proposed
> approach and verifying for the presence of the compatible property fixes
> this issue without changing the devicetree bindings and the way the PHY
> controllers are handled by Exynos EHCI/OHCI drivers.
>
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Fixes: 01fdf179f4b0 ("usb: core: skip interfaces disabled in devicetree")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/usb/core/message.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index 82239f27c4cc..cd455c4add25 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2007,6 +2007,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  		struct usb_interface *intf = cp->interface[i];
>
>  		if (intf->dev.of_node &&
> +		    of_device_is_compatible(intf->dev.of_node, NULL) &&
>  		    !of_device_is_available(intf->dev.of_node)) {
>  			dev_info(&dev->dev, "skipping disabled interface %d\n",
>  				 intf->cur_altsetting->desc.bInterfaceNumber);
> -- 

This doesn't look right.  of_device_is_compatible() with a NULL compat
argument always returns zero.

There also seems to be a broader incompatibility between the generic USB
bindings and the use of child nodes in the Exynos bindings.

-- 
Måns Rullgård
