From: Gustavo Padovan <gustavo@padovan.org>
Subject: Re: [PATCH v2 00/23] drm/exynos: atomic improvements +
 exynos_encoder removal
Date: Thu, 16 Jul 2015 12:26:31 -0300
Message-ID: <20150716152631.GB2096@joana>
References: <1436192424-18194-1-git-send-email-gustavo@padovan.org>
 <55A4BB9E.8040706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f174.google.com ([209.85.220.174]:35249 "EHLO
	mail-qk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbbGPP0g convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jul 2015 11:26:36 -0400
Received: by qkbp125 with SMTP id p125so52394693qkb.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jul 2015 08:26:36 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <55A4BB9E.8040706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

2015-07-14 Joonyoung Shim <jy0922.shim@samsung.com>:

> On 07/06/2015 11:20 PM, Gustavo Padovan wrote:
> > From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
> >
> > Hi,
> >
> > This set improves exynos in a number of ways. The first five patche=
s are
> > general clean up/fixes.
> >
> > Patches 06 to 12 are improvements on top of the newly added atomic =
modesetting
> > support.
> >
> > Patches 13-23 are a big journey to completely remove the internal
> > exynos_drm_encoder struct. Now exynos encoders register themselves =
directly
> > with the drm core.
>=20
> I got compile error with 13-23 patches.
>=20
> drivers/gpu/drm/exynos/exynos_drm_dsi.c: In function =E2=80=98exynos_=
dsi_bind=E2=80=99:
> drivers/gpu/drm/exynos/exynos_drm_dsi.c:1839:3: error: =E2=80=98displ=
ay=E2=80=99 undeclared (first use in this function)
>    display->encoder->bridge =3D bridge;
>    ^
> drivers/gpu/drm/exynos/exynos_drm_dsi.c:1839:3: note: each undeclared=
 identifier is reported only once for each function it appears in
> make[4]: *** [drivers/gpu/drm/exynos/exynos_drm_dsi.o] Error 1
>=20
>=20
> If you post the stuff that only be related, it will be reviewed and
> merged easier.
>=20
> 01-04 and 06-11 patches look good to me, about them,
> Reviewed-by: Joonyoung Shim <jy0922.shim@samsung.com>

Sure, I've resent only the patch with your Reviewed-by in a separate
patchset. The others will come in another patcheset.

	Gustavo
