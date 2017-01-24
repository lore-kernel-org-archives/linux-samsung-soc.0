From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: dts: Odroid XU4: fix USB3.0 ports
Date: Tue, 24 Jan 2017 20:22:37 +0200
Message-ID: <20170124182237.kwixpqc3wkutxbsj@kozik-lap>
References: <20170124134809.23315-1-richard.genoud@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170124134809.23315-1-richard.genoud@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Felipe Balbi <balbi@kernel.org>, Huang Rui <ray.huang@amd.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, #@vger.kernel.org, 4.4+@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Jan 24, 2017 at 02:48:09PM +0100, Richard Genoud wrote:
> Since commit 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores"),
> the USB ports on odroid-XU4 don't work anymore.

Hi,

Thanks for the patch. Please:
1. Use recent kernel to test it, which could be one of: mainline
   (Linus'), recent linux-next or my for-next branch. Why am I thinking
   that you did not test it on thse? Because you sent the patch to
   k.kozlowski@samsung.com. The guy disappeared four months ago and
   recent kernel has all addresses updated (including mailmap).
2. Fix the title to match subsystem (git log --oneline arch/arm/boot/dts/exynos*).


> 
> Inserting an usb key (USB2.0) on the USB3.0 port result in:
> [   64.488264] xhci-hcd xhci-hcd.2.auto: Port resume took longer than 20000 msec, port status = 0xc400fe3
> [   74.568156] xhci-hcd xhci-hcd.2.auto: xHCI host not responding to stop endpoint command.
> [   74.574806] xhci-hcd xhci-hcd.2.auto: Assuming host is dying, halting host.
> [   74.601970] xhci-hcd xhci-hcd.2.auto: HC died; cleaning up
> [   74.606276] usb 3-1: USB disconnect, device number 2
> [   74.613565] usb 4-1: USB disconnect, device number 2
> [   74.621208] usb usb3-port1: couldn't allocate usb_device
> NB: it's not related to USB2.0 devices, I get the same result with an USB3.0 device (SATA to USB3 for instance).
> NB2: it doesn't happen on an odriod-XU3 board, that doesn't have the realtek RTL8153 chip.

Odroid-XU3
s/realtek/Realtek/

However I do not think that Realtek matters here. The USB3 ports are
directly accessible on XU3. On XU4 on the other hand, the port USB3-0 is
connected to USB hub. I think the sentence about Realtek is then
misleading, so just mention the XU3.

> 
> If the lines:
> 	if (dwc->revision > DWC3_REVISION_194A)
> 		reg |= DWC3_GUSB3PIPECTL_SUSPHY;
> are commented out, the USB3.0 start working.

s/start/starts/

> 
> For a full analyse: https://lkml.org/lkml/2017/1/18/678

Documentation/process/submitting-patches.rst
Instead of this above (lkml.org is highly discouraged) use proper
https://lkml.kernel.org/ in "Link:" put next to other tags (look at
recent commits), however I do not find this link as necessary.  Just
describe here what is wrong and how you are going to fix it.

> 
> Felipe suggested that suspend should be disabled temporarily while
> what's wrong with DCW3 is figured out.
> 
> Tested on Odroid XU4
> 
> Suggested-by: Felipe Balbi <felipe.balbi@linux.intel.com>
> Tested-by: Richard Genoud <richard.genoud@gmail.com>

Being an author implies testing. Please remove the tag.

> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> Cc: stable@vger.kernel.org # 4.4+

Malformed tag - missing <>.

> Fixes: 2164a476205ccc ("usb: dwc3: set SUSPHY bit for all cores")

No need for such long hash (2164a476205c).

I wonder about pointing the commit which introduced the issue. Usually
the fixes directly indicates how far we want the patch to be backported.
In this case this should be backported to kernel bringing XU4 DTS. The
commit which was not valid, was the commit adding DTS without this
property. 2164a476205c was innocent for XU4 because XU4 did not exist
that time.

Definitely something is wrong if Fixes tag does not match indicated
backport version.

> ---
>  arch/arm/boot/dts/exynos5422-odroidxu4.dts | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/exynos5422-odroidxu4.dts b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> index 2faf88627a48..f62dbd9b5ad3 100644
> --- a/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> +++ b/arch/arm/boot/dts/exynos5422-odroidxu4.dts
> @@ -43,6 +43,15 @@
>  	status = "okay";
>  };
>  
> +&usbdrd_dwc3_0 {
> +	/*
> +	 * without that, usb devices are not recognized when
> +	 * they are plugged.

s/without/Without/
s/usb/USB.

> +	 * cf: https://lkml.org/lkml/2017/1/18/678

No external resources. You can extend a little bit the sentence above to
two sentences. Combined with "git log" this would be sufficient.

Best regards,
Krzysztof

> +	 */
> +	snps,dis_u3_susphy_quirk;
> +};
> +
>  &usbdrd_dwc3_1 {
>  	dr_mode = "host";
>  };
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
