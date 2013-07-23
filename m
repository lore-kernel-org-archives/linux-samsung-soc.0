From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCH 2/3] drm/exynos: add dt-binding documentation for rotator
Date: Tue, 23 Jul 2013 10:21:38 +0900
Message-ID: <00f701ce8742$fa8c67e0$efa537a0$@samsusng.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
 <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
 <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:55574 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752803Ab3GWBVj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 21:21:39 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQD00HZY7RKNQ80@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 10:21:38 +0900 (KST)
In-reply-to: <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Rutland' <mark.rutland@arm.com>, 'Chanho Park' <chanho61.park@samsung.com>
Cc: inki.dae@samsung.com, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Mark,
Thank you for your review.

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
>=20
> On Mon, Jul 22, 2013 at 07:49:26AM +0100, Chanho Park wrote:
> > This patch adds a dt-binding document for exynos rotator. It descri=
bes
> > which nodes should be defined to use the rotator.
> >
> > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > ---
> >  .../bindings/drm/exynos/samsung-rotator.txt        |   35
> ++++++++++++++++++++
> >  1 file changed, 35 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> > b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.txt
> > new file mode 100644
> > index 0000000..6b1d704
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.=
txt
> > @@ -0,0 +1,35 @@
> > +* Samsung Image Rotator
> > +
> > +Required properties:
> > +  - compatible : value should be the "samsung,exynos4210".
> > +  - reg : Physical base address of the IP registers and length of
> memory
> > +	  mapped region.
> > +  - interrupts : interrupt number to the CPU.
> > +  - clocks : clock number of exynos4 rotator clock.
> > +  - clocks : clock name of rotator
>=20
> clock-names?

Yes. It seems to have =E2=80=8B=E2=80=8Ba mistake during copy and paste=
=2E
I'll modify it next patch.

>=20
> > +  - status : "okay" or "disabled"
> > +  - limit table for image formats : min_w/min_h/max_w/max_h for
> > + min/max of image
>=20
> Limit table? This doesn't seem to be a well-defined binding, and it
> seems like a relatively generic thing to describe.
>=20
> > +
> > +Example:
> > +	rotator: rotator@12810000 {
> > +		compatible =3D "samsung,exynos4210-rotator";
> > +		reg =3D <0x12810000 0x1000>;
> > +		interrupts =3D <0 83 0>;
> > +		clocks =3D <&clock 278>;
> > +		clock-names =3D "rotator";
> > +		status =3D "disabled";
> > +		ycbcr420_2p {
>=20
> Which names are allowed for these subnodes?
>=20
> > +			min_w =3D <32>;
> > +			min_h =3D <32>;
> > +			max_w =3D <32768>;
> > +			max_h =3D <32768>;
> > +			align =3D <3>;
>=20
> min-width, min-height, max-width, max-height? What units are they in?
>=20
> What does alignment specify exactly?
>=20
> Are these a configurable part of the rotator hardware, or are these
> values always the same? If thery're always the same, there's no need =
to
> describe in in the devicetree.

I've checked the rotator limitation for all of exynos4 chipsets and exy=
nos5250.
As a result, these have same value.
I think it seems to be better leave on static value.
I'll prepare next patches including your suggestion.

Thanks

Best Regards,
Chanho Park

>=20
> Thanks,
> Mark.
>=20
> > +		};
> > +		rgb888 {
> > +			min_w =3D <8>;
> > +			min_h =3D <8>;
> > +			max_w =3D <8192>;
> > +			max_h =3D <8192>;
> > +			align =3D <2>;
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
