From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V3 0/7] drm/exynos: Support DP CLKCON register in FIMD
 driver
Date: Fri, 27 Jun 2014 11:49:40 +0100
Message-ID: <20140627104940.GF7262@leverpostej>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
 <53AD467A.1030005@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:34146 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753130AbaF0Kty (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:49:54 -0400
Content-Disposition: inline
In-Reply-To: <53AD467A.1030005@samsung.com>
Content-Language: en-US
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "seanpaul@google.com" <seanpaul@google.com>, "ajaynumb@gmail.com" <ajaynumb@gmail.com>, "jg1.han@samsung.com" <jg1.han@samsung.com>, "joshi@samsung.com" <joshi@samsung.com>, "prashanth.g@samsung.com" <prashanth.g@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "cpgs@samsung.com" <cpgs@samsung.com>

On Fri, Jun 27, 2014 at 11:24:58AM +0100, Inki Dae wrote:
>=20
> + DT mailing list

Thanks for the Cc.

Can we get the rest of the series? Judging a series based on its
diffstat alone is a little hard...

Or is my mailbox filtering hiding the rest of these from me?

Any reason for not Ccing lakml?

Mark.

> On 2014=EB=85=84 06=EC=9B=94 27=EC=9D=BC 19:12, Ajay Kumar wrote:
> > This series is based on exynos-drm-next branch of Inki Dae's tree a=
t:
> > git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.gi=
t
> >=20
> > Changes since V2:
> > 	Add DT property to know the type of FIMD output interface
> > 	as per Inki's suggestion.
> > 	Add samsung,output-type DT property in FIMD node for all boards
> > 	supporting DP interface.
> >=20
> > Ajay Kumar (7):
> >   [PATCH V3 1/7] drm/exynos: Support DP CLKCON register in FIMD dri=
ver
> >   [PATCH V3 2/7] ARM: dts: Add FIMD output property for snow
> >   [PATCH V3 3/7] ARM: dts: Add FIMD output property for peach_pit
> >   [PATCH V3 4/7] ARM: dts: Add FIMD output property for peach_pi
> >   [PATCH V3 5/7] ARM: dts: Add FIMD output property for smdk5250
> >   [PATCH V3 6/7] ARM: dts: Add FIMD output property for smdk5420
> >   [PATCH V3 7/7] ARM: dts: Add FIMD output property for arndale
> >=20
> >  .../devicetree/bindings/video/samsung-fimd.txt     |    1 +
> >  arch/arm/boot/dts/exynos5250-arndale.dts           |    1 +
> >  arch/arm/boot/dts/exynos5250-smdk5250.dts          |    1 +
> >  arch/arm/boot/dts/exynos5250-snow.dts              |    1 +
> >  arch/arm/boot/dts/exynos5420-peach-pit.dts         |    1 +
> >  arch/arm/boot/dts/exynos5420-smdk5420.dts          |    1 +
> >  arch/arm/boot/dts/exynos5800-peach-pi.dts          |    1 +
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c           |   23 ++++++++=
++++++++++++
> >  include/video/samsung_fimd.h                       |    4 ++++
> >  9 files changed, 34 insertions(+)
> >=20
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
