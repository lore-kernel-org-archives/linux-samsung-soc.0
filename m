From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 1/2] drm/exynos: fimd: Add support for S5PV210 FIMD variant
Date: Sat, 21 Apr 2018 19:30:12 +0200
Message-ID: <4230005.Q0ymWkG0nD@acerlaptop>
References: <1524241936-10295-1-git-send-email-pawel.mikolaj.chmiel@gmail.com> <1524241936-10295-2-git-send-email-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPcv2A8po8-8ZVic8KX2xURPZsRBkS6My3qMhefRQk-fRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcv2A8po8-8ZVic8KX2xURPZsRBkS6My3qMhefRQk-fRQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, jy0922.shim@samsung.com, Seung Woo Kim <sw0312.kim@samsung.com>, kyungmin.park@samsung.com, airlied@linux.ie, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Saturday, April 21, 2018 6:55:17 PM CEST Krzysztof Kozlowski wrote:
> On Fri, Apr 20, 2018 at 6:32 PM, Pawe=C5=82 Chmiel
> <pawel.mikolaj.chmiel@gmail.com> wrote:
> > From: Tomasz Figa <tomasz.figa@gmail.com>
> >
> > This patch adds support for FIMD variant found on S5PV210 SoC.
> > Except CLKSEL bit availability, it is identical to Exynos4210.
> >
> > Tested-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
>=20
> You need to add your Signed-off-by here as well. It is necessary every
> time you touch a patch (and sending it is also a "touch" action).
Hi

Thanks for feedback, i've send a v2 version of this patchset with this issu=
e fixed.

>=20
> Best regards,
> Krzysztof
>=20
> > ---
> >  drivers/gpu/drm/exynos/exynos_drm_fimd.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm=
/exynos/exynos_drm_fimd.c
> > index d42ae2bc3e56..01b1570d0c3a 100644
> > --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> > @@ -121,6 +121,12 @@ static struct fimd_driver_data s3c64xx_fimd_driver=
_data =3D {
> >         .has_limited_fmt =3D 1,
> >  };
> >
> > +static struct fimd_driver_data s5pv210_fimd_driver_data =3D {
> > +       .timing_base =3D 0x0,
> > +       .has_shadowcon =3D 1,
> > +       .has_clksel =3D 1,
> > +};
> > +
> >  static struct fimd_driver_data exynos3_fimd_driver_data =3D {
> >         .timing_base =3D 0x20000,
> >         .lcdblk_offset =3D 0x210,
> > @@ -193,6 +199,8 @@ struct fimd_context {
> >  static const struct of_device_id fimd_driver_dt_match[] =3D {
> >         { .compatible =3D "samsung,s3c6400-fimd",
> >           .data =3D &s3c64xx_fimd_driver_data },
> > +       { .compatible =3D "samsung,s5pv210-fimd",
> > +         .data =3D &s5pv210_fimd_driver_data },
> >         { .compatible =3D "samsung,exynos3250-fimd",
> >           .data =3D &exynos3_fimd_driver_data },
> >         { .compatible =3D "samsung,exynos4210-fimd",
> > --
> > 2.7.4
> >
>=20
