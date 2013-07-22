From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] drm/exynos: add dt-binding documentation for
 rotator
Date: Mon, 22 Jul 2013 09:48:17 +0100
Message-ID: <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
 <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:45498 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756737Ab3GVIs5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 04:48:57 -0400
Content-Disposition: inline
In-Reply-To: <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanho Park <chanho61.park@samsung.com>
Cc: "inki.dae@samsung.com" <inki.dae@samsung.com>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "jy0922.shim@samsung.com" <jy0922.shim@samsung.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "sw0312.kim@samsung.com" <sw0312.kim@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "kyungmin.park@samsung.com" <kyungmin.park@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Jul 22, 2013 at 07:49:26AM +0100, Chanho Park wrote:
> This patch adds a dt-binding document for exynos rotator. It describes which
> nodes should be defined to use the rotator.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../bindings/drm/exynos/samsung-rotator.txt        |   35 ++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> 
> diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> new file mode 100644
> index 0000000..6b1d704
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> @@ -0,0 +1,35 @@
> +* Samsung Image Rotator
> +
> +Required properties:
> +  - compatible : value should be the "samsung,exynos4210".
> +  - reg : Physical base address of the IP registers and length of memory
> +	  mapped region.
> +  - interrupts : interrupt number to the CPU.
> +  - clocks : clock number of exynos4 rotator clock.
> +  - clocks : clock name of rotator

clock-names?

> +  - status : "okay" or "disabled"
> +  - limit table for image formats : min_w/min_h/max_w/max_h for min/max of image

Limit table? This doesn't seem to be a well-defined binding, and it
seems like a relatively generic thing to describe.

> +
> +Example:
> +	rotator: rotator@12810000 {
> +		compatible = "samsung,exynos4210-rotator";
> +		reg = <0x12810000 0x1000>;
> +		interrupts = <0 83 0>;
> +		clocks = <&clock 278>;
> +		clock-names = "rotator";
> +		status = "disabled";
> +		ycbcr420_2p {

Which names are allowed for these subnodes?

> +			min_w = <32>;
> +			min_h = <32>;
> +			max_w = <32768>;
> +			max_h = <32768>;
> +			align = <3>;

min-width, min-height, max-width, max-height? What units are they in?

What does alignment specify exactly?

Are these a configurable part of the rotator hardware, or are these
values always the same? If thery're always the same, there's no need to
describe in in the devicetree.

Thanks,
Mark.

> +		};
> +		rgb888 {
> +			min_w = <8>;
> +			min_h = <8>;
> +			max_w = <8192>;
> +			max_h = <8192>;
> +			align = <2>;
> +		};
> +	};
> -- 
> 1.7.9.5
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
