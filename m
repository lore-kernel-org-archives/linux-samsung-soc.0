From: Chanho Park <chanho61.park@samsusng.com>
Subject: RE: [PATCH 2/3] drm/exynos: add dt-binding documentation for rotator
Date: Tue, 23 Jul 2013 11:47:00 +0900
Message-ID: <00fb01ce874e$e7807f40$b6817dc0$@samsusng.com>
References: <1374475767-30085-1-git-send-email-chanho61.park@samsung.com>
 <1374475767-30085-3-git-send-email-chanho61.park@samsung.com>
 <20130722084817.GA18731@e106331-lin.cambridge.arm.com>
 <00f701ce8742$fa8c67e0$efa537a0$@samsusng.com>
 <007f01ce8744$f3d1c560$db755020$%dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:62940 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753536Ab3GWCrF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 22:47:05 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQD0046XBQCQLE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 23 Jul 2013 11:47:00 +0900 (KST)
In-reply-to: <007f01ce8744$f3d1c560$db755020$%dae@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Inki Dae' <inki.dae@samsung.com>, 'Mark Rutland' <mark.rutland@arm.com>
Cc: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, sw0312.kim@samsung.com, dri-devel@lists.freedesktop.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org

> -----Original Message-----
> From: Inki Dae [mailto:inki.dae@samsung.com]
> Sent: Tuesday, July 23, 2013 10:36 AM
> To: 'Chanho Park'; 'Mark Rutland'; 'Chanho Park'
> Cc: kgene.kim@samsung.com; linux-samsung-soc@vger.kernel.org;
> jy0922.shim@samsung.com; sw0312.kim@samsung.com; dri-
> devel@lists.freedesktop.org; kyungmin.park@samsung.com; linux-arm-
> kernel@lists.infradead.org
> Subject: RE: [PATCH 2/3] drm/exynos: add dt-binding documentation for
> rotator
>=20
>=20
>=20
> > -----Original Message-----
> > From: Chanho Park [mailto:chanho61.park@samsusng.com]
> > Sent: Tuesday, July 23, 2013 10:22 AM
> > To: 'Mark Rutland'; 'Chanho Park'
> > Cc: inki.dae@samsung.com; kgene.kim@samsung.com; linux-samsung-
> > soc@vger.kernel.org; jy0922.shim@samsung.com; sw0312.kim@samsung.co=
m;
> > dri- devel@lists.freedesktop.org; kyungmin.park@samsung.com;
> > linux-arm- kernel@lists.infradead.org
> > Subject: RE: [PATCH 2/3] drm/exynos: add dt-binding documentation f=
or
> > rotator
> >
> > Hi Mark,
> > Thank you for your review.
> >
> > > -----Original Message-----
> > > From: Mark Rutland [mailto:mark.rutland@arm.com]
> > > Sent: Monday, July 22, 2013 5:48 PM
> > > To: Chanho Park
> > > Cc: inki.dae@samsung.com; kgene.kim@samsung.com; linux-samsung-
> > > soc@vger.kernel.org; jy0922.shim@samsung.com; devicetree-
> > > discuss@lists.ozlabs.org; sw0312.kim@samsung.com; dri-
> > > devel@lists.freedesktop.org; kyungmin.park@samsung.com; linux-arm=
-
> > > kernel@lists.infradead.org
> > > Subject: Re: [PATCH 2/3] drm/exynos: add dt-binding documentation
> > > for rotator
> > >
> > > On Mon, Jul 22, 2013 at 07:49:26AM +0100, Chanho Park wrote:
> > > > This patch adds a dt-binding document for exynos rotator. It
> > > > describes which nodes should be defined to use the rotator.
> > > >
> > > > Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> > > > Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> > > > ---
> > > >  .../bindings/drm/exynos/samsung-rotator.txt        |   35
> > > ++++++++++++++++++++
> > > >  1 file changed, 35 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/drm/exynos/samsung-rotator.tx=
t
> > > >
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.=
txt
> > > > b/Documentation/devicetree/bindings/drm/exynos/samsung-rotator.=
txt
> > > > new file mode 100644
> > > > index 0000000..6b1d704
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/drm/exynos/samsung-rota=
tor
> > > > +++ .txt
> > > > @@ -0,0 +1,35 @@
> > > > +* Samsung Image Rotator
> > > > +
> > > > +Required properties:
> > > > +  - compatible : value should be the "samsung,exynos4210".
> > > > +  - reg : Physical base address of the IP registers and length=
 of
> > > memory
> > > > +	  mapped region.
> > > > +  - interrupts : interrupt number to the CPU.
> > > > +  - clocks : clock number of exynos4 rotator clock.
> > > > +  - clocks : clock name of rotator
> > >
> > > clock-names?
> >
> > Yes. It seems to have =E2=80=8B=E2=80=8Ba mistake during copy and p=
aste.
> > I'll modify it next patch.
> >
> > >
> > > > +  - status : "okay" or "disabled"
> > > > +  - limit table for image formats : min_w/min_h/max_w/max_h fo=
r
> > > > + min/max of image
> > >
> > > Limit table? This doesn't seem to be a well-defined binding, and =
it
> > > seems like a relatively generic thing to describe.
> > >
> > > > +
> > > > +Example:
> > > > +	rotator: rotator@12810000 {
> > > > +		compatible =3D "samsung,exynos4210-rotator";
> > > > +		reg =3D <0x12810000 0x1000>;
> > > > +		interrupts =3D <0 83 0>;
> > > > +		clocks =3D <&clock 278>;
> > > > +		clock-names =3D "rotator";
> > > > +		status =3D "disabled";
> > > > +		ycbcr420_2p {
> > >
> > > Which names are allowed for these subnodes?
> > >
> > > > +			min_w =3D <32>;
> > > > +			min_h =3D <32>;
> > > > +			max_w =3D <32768>;
> > > > +			max_h =3D <32768>;
> > > > +			align =3D <3>;
> > >
> > > min-width, min-height, max-width, max-height? What units are they=
 in?
> > >
> > > What does alignment specify exactly?
> > >
> > > Are these a configurable part of the rotator hardware, or are the=
se
> > > values always the same? If thery're always the same, there's no n=
eed
> > > to describe in in the devicetree.
> >
> > I've checked the rotator limitation for all of exynos4 chipsets and
> > exynos5250.
> > As a result, these have same value.
>=20
> Not true. See the Exynos4210 user manual again. At least, the manual
> says maximum size is 64k x 64k in case of Y components.

Yes. The exynos4210 has different maximum limits of RGB888/YCbCr420 2p
compared with any other  SoCs(exynos4x12/exynos5250).
I'll make a next patch with considering it.

Thanks

Best Regards,
Chanho Park.

>=20
> > I think it seems to be better leave on static value.
> > I'll prepare next patches including your suggestion.
> >
>=20
> So, you should consider such a little bit difference.
>=20
> > Thanks
> >
> > Best Regards,
> > Chanho Park
> >
> > >
> > > Thanks,
> > > Mark.
> > >
> > > > +		};
> > > > +		rgb888 {
> > > > +			min_w =3D <8>;
> > > > +			min_h =3D <8>;
> > > > +			max_w =3D <8192>;
> > > > +			max_h =3D <8192>;
> > > > +			align =3D <2>;
> > > > +		};
> > > > +	};
> > > > --
> > > > 1.7.9.5
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-arm-kernel mailing list
> > > > linux-arm-kernel@lists.infradead.org
> > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > > >
