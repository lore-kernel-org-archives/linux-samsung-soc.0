From: Inki Dae <inki.dae@samsung.com>
Subject: RE: [PATCH 2/3] drm/exynos: add dt-binding documentation for rotator
Date: Mon, 22 Jul 2013 21:37:00 +0900
Message-ID: <026001ce86d8$2963d730$7c2b8590$%dae@samsung.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
 <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
 <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54313 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752273Ab3GVMhD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 08:37:03 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQC00JLR8DPDRF0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 21:37:01 +0900 (KST)
In-reply-to: <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Rutland' <mark.rutland@arm.com>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, devicetree-discuss@lists.ozlabs.org, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org



> -----Original Message-----
> From: Mark Rutland [mailto:mark.rutland@arm.com]
> Sent: Monday, July 22, 2013 5:48 PM
> To: Chanho Park
> Cc: inki.dae@samsung.com; kgene.kim@samsung.com; linux-samsung-
> soc@vger.kernel.org; jy0922.shim@samsung.com; devicetree-
> discuss@lists.ozlabs.org; sw0312.kim@samsung.com; dri-
> devel@lists.freedesktop.org; kyungmin.park@samsung.com; linux-arm-
> kernel@lists.infradead.org
> Subject: Re: [PATCH 2/3] drm/exynos: add dt-binding documentation for
> rotator
> 
> On Mon, Jul 22, 2013 at 07:49:26AM +0100, Chanho Park wrote:
> > This patch adds a dt-binding document for exynos rotator. It describes
> which
> > nodes should be defined to use the rotator.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  .../bindings/drm/exynos/samsung-rotator.txt        |   35
> ++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> >
> > diff --git a/Documentation/devicetree/bindings/drm/exynos/samsung-
> rotator.txt b/Documentation/devicetree/bindings/drm/exynos/samsung-
> rotator.txt
> > new file mode 100644
> > index 0000000..6b1d704
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> > @@ -0,0 +1,35 @@
> > +* Samsung Image Rotator
> > +
> > +Required properties:
> > +  - compatible : value should be the "samsung,exynos4210".

Please, add more compatible strings for other SoC.

> > +  - reg : Physical base address of the IP registers and length of
> memory
> > +	  mapped region.
> > +  - interrupts : interrupt number to the CPU.
> > +  - clocks : clock number of exynos4 rotator clock.
> > +  - clocks : clock name of rotator
> 
> clock-names?
> 
> > +  - status : "okay" or "disabled"
> > +  - limit table for image formats : min_w/min_h/max_w/max_h for min/max
> of image
> 
> Limit table? This doesn't seem to be a well-defined binding, and it
> seems like a relatively generic thing to describe.
> 
> > +
> > +Example:
> > +	rotator: rotator@12810000 {
> > +		compatible = "samsung,exynos4210-rotator";
> > +		reg = <0x12810000 0x1000>;
> > +		interrupts = <0 83 0>;
> > +		clocks = <&clock 278>;
> > +		clock-names = "rotator";
> > +		status = "disabled";
> > +		ycbcr420_2p {
> 
> Which names are allowed for these subnodes?
> 
> > +			min_w = <32>;
> > +			min_h = <32>;
> > +			max_w = <32768>;
> > +			max_h = <32768>;
> > +			align = <3>;
> 
> min-width, min-height, max-width, max-height? What units are they in?
> 
> What does alignment specify exactly?
> 
> Are these a configurable part of the rotator hardware, or are these
> values always the same?

Right, that seems like configurable part. At least, min_w/h and max_w/h can
be different values according to SoC and pixel formats so they should be
described enough in this dt-binding document file.

Thanks,
Inki Dae

> If thery're always the same, there's no need to
> describe in in the devicetree.
> 
> Thanks,
> Mark.
> 
> > +		};
> > +		rgb888 {
> > +			min_w = <8>;
> > +			min_h = <8>;
> > +			max_w = <8192>;
> > +			max_h = <8192>;
> > +			align = <2>;
> > +		};
> > +	};
> > --
> > 1.7.9.5
> >
> >
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> >
