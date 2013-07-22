From: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [PATCH 2/3] drm/exynos: add dt-binding documentation for rotator
Date: Mon, 22 Jul 2013 14:46:52 +0200
Message-ID: <1374497212.4456.4.camel@weser.hi.pengutronix.de>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
	 <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
	 <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
	 <026001ce86d8$2963d730$7c2b8590$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from metis.ext.pengutronix.de ([92.198.50.35]:33125 "EHLO
	metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752885Ab3GVMth (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 08:49:37 -0400
In-Reply-To: <026001ce86d8$2963d730$7c2b8590$%dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: 'Mark Rutland' <mark.rutland@arm.com>, 'Chanho Park' <chanho61.park@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org

Am Montag, den 22.07.2013, 21:37 +0900 schrieb Inki Dae:
> 
> > -----Original Message-----
> > From: Mark Rutland [mailto:mark.rutland@arm.com]
> > Sent: Monday, July 22, 2013 5:48 PM
> > To: Chanho Park
> > Cc: inki.dae@samsung.com; kgene.kim@samsung.com; linux-samsung-
> > soc@vger.kernel.org; jy0922.shim@samsung.com; devicetree-
> > discuss@lists.ozlabs.org; sw0312.kim@samsung.com; dri-
> > devel@lists.freedesktop.org; kyungmin.park@samsung.com; linux-arm-
> > kernel@lists.infradead.org
> > Subject: Re: [PATCH 2/3] drm/exynos: add dt-binding documentation for
> > rotator
> > 
> > On Mon, Jul 22, 2013 at 07:49:26AM +0100, Chanho Park wrote:
> > > This patch adds a dt-binding document for exynos rotator. It describes
> > which
> > > nodes should be defined to use the rotator.
> > >
> > > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > ---
> > >  .../bindings/drm/exynos/samsung-rotator.txt        |   35
> > ++++++++++++++++++++
> > >  1 file changed, 35 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> > >
> > > diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-
> > rotator.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-
> > rotator.txt
> > > new file mode 100644
> > > index 0000000..6b1d704
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> > > @@ -0,0 +1,35 @@
> > > +* Samsung Image Rotator
> > > +
> > > +Required properties:
> > > +  - compatible : value should be the "samsung,exynos4210".
> 
> Please, add more compatible strings for other SoC.
> 
> > > +  - reg : Physical base address of the IP registers and length of
> > memory
> > > +	  mapped region.
> > > +  - interrupts : interrupt number to the CPU.
> > > +  - clocks : clock number of exynos4 rotator clock.
> > > +  - clocks : clock name of rotator
> > 
> > clock-names?
> > 
> > > +  - status : "okay" or "disabled"
> > > +  - limit table for image formats : min_w/min_h/max_w/max_h for min/max
> > of image
> > 
> > Limit table? This doesn't seem to be a well-defined binding, and it
> > seems like a relatively generic thing to describe.
> > 
> > > +
> > > +Example:
> > > +	rotator: rotator@12810000 {
> > > +		compatible = "samsung,exynos4210-rotator";
> > > +		reg = <0x12810000 0x1000>;
> > > +		interrupts = <0 83 0>;
> > > +		clocks = <&clock 278>;
> > > +		clock-names = "rotator";
> > > +		status = "disabled";
> > > +		ycbcr420_2p {
> > 
> > Which names are allowed for these subnodes?
> > 
> > > +			min_w = <32>;
> > > +			min_h = <32>;
> > > +			max_w = <32768>;
> > > +			max_h = <32768>;
> > > +			align = <3>;
> > 
> > min-width, min-height, max-width, max-height? What units are they in?
> > 
> > What does alignment specify exactly?
> > 
> > Are these a configurable part of the rotator hardware, or are these
> > values always the same?
> 
> Right, that seems like configurable part. At least, min_w/h and max_w/h can
> be different values according to SoC and pixel formats so they should be
> described enough in this dt-binding document file.
> 
Is there really this much configurability? Could each of those values be
a different on different SoCs, or could you just extract those values
from the SoC/rotator hardware version and thus the DT compatible string?

> 
> > If thery're always the same, there's no need to
> > describe in in the devicetree.
> > 
> > Thanks,
> > Mark.
> > 
> > > +		};
> > > +		rgb888 {
> > > +			min_w = <8>;
> > > +			min_h = <8>;
> > > +			max_w = <8192>;
> > > +			max_h = <8192>;
> > > +			align = <2>;
> > > +		};
> > > +	};
> > > --
> > > 1.7.9.5
> > >
> > >
> > > _______________________________________________
> > > linux-arm-kernel mailing list
> > > linux-arm-kernel@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > >
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Pengutronix e.K.                           | Lucas Stach                 |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-5076 |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
