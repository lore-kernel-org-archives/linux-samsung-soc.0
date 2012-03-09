From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: Subject: [PATCH] MAINTAINERS: add maintainer entry for SAMSUNG EXYNOS DeviceTree
Date: Fri, 09 Mar 2012 09:30:30 -0700
Message-ID: <20120309163030.661F93E0880@localhost>
References: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com> <CAJuYYwSqGDmuXrtBscCSFoQEOpWCQ-1H+2dHxeUYny7KwUPLOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:40432 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757906Ab2CIQad (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:30:33 -0500
Received: by iagz16 with SMTP id z16so2453361iag.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:30:33 -0800 (PST)
In-Reply-To: <CAJuYYwSqGDmuXrtBscCSFoQEOpWCQ-1H+2dHxeUYny7KwUPLOg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de

On Wed, 22 Feb 2012 07:49:18 +0530, Thomas Abraham <thomas.abraham@lina=
ro.org> wrote:
> On 22 February 2012 05:46, Kukjin Kim <kgene.kim@samsung.com> wrote:
> > Add Samsung EXYNOS DT maintainer
> >
> > Cc: Thomas Abraham <thomas.abraham@linaro.org>
> > Cc: Grant Likely <grant.likely@secretlab.ca>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =C2=A0MAINTAINERS | =C2=A0 10 ++++++++++
> > =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 9a648eb..5ac5aaf 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1065,6 +1065,16 @@ S: =C2=A0 =C2=A0 =C2=A0 Maintained
> > =C2=A0F: =C2=A0 =C2=A0 arch/arm/mach-s5p*/
> > =C2=A0F: =C2=A0 =C2=A0 arch/arm/mach-exynos*/
> >
> > +ARM/SAMSUNG EXYNOS DEVICE TREE
> > +M: =C2=A0 =C2=A0 Thomas Abraham <thomas.abraham@linaro.org>
> > +M: =C2=A0 =C2=A0 Kukjin Kim <kgene.kim@samsung.com>
> > +L: =C2=A0 =C2=A0 devicetree-discuss@lists.ozlabs.org (moderated fo=
r non-subscribers)
> > +L: =C2=A0 =C2=A0 linux-samsung-soc@vger.kernel.org (moderated for =
non-subscribers)
> > +S: =C2=A0 =C2=A0 Maintained
> > +F: =C2=A0 =C2=A0 arch/arm/boot/dts/exynos*
> > +F: =C2=A0 =C2=A0 arch/arm/mach-exynos/*dt.c
> > +F: =C2=A0 =C2=A0 Documentation/devicetree/*/*/*samsung*
> > +
>=20
> Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

Acked-by: Grant Likely <grant.likely@secretlab.ca>
