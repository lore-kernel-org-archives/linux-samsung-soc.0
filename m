From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFC PATCH 01/11] devfreq: exynos-bus: Extract exynos_bus_profile_init()
Date: Mon, 5 Aug 2019 11:56:12 +0200
Message-ID: <CAJKOXPdAhyAE96LmzV7TB1YTyNcN7Eh65Xb9caanXA-52Gskvg@mail.gmail.com>
References: <20190723122016.30279-1-a.swigon@partner.samsung.com>
 <CGME20190723122022eucas1p1266d90873d564894bd852c20140f8474@eucas1p1.samsung.com>
 <20190723122016.30279-2-a.swigon@partner.samsung.com> <20190724190741.GD14346@kozik-lap>
 <bda10bcc66aae96355e74c4739229d72bcc95b0d.camel@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <bda10bcc66aae96355e74c4739229d72bcc95b0d.camel@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, Inki Dae <inki.dae@samsung.com>, Seung Woo Kim <sw0312.kim@samsung.com>, georgi.djakov@linaro.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 31 Jul 2019 at 15:00, Artur =C5=9Awigo=C5=84 <a.swigon@partner.sams=
ung.com> wrote:
>
> Hi,
>
> On Wed, 2019-07-24 at 21:07 +0200, Krzysztof Kozlowski wrote:
> > On Tue, Jul 23, 2019 at 02:20:06PM +0200, Artur =C5=9Awigo=C5=84 wrote:
> > > This patch adds a new static function, exynos_bus_profile_init(), ext=
racted
> > > from exynos_bus_probe().
> > >
> > > Signed-off-by: Artur =C5=9Awigo=C5=84 <a.swigon@partner.samsung.com>
> > > ---
> > >  drivers/devfreq/exynos-bus.c | 106 ++++++++++++++++++++-------------=
--
> > >  1 file changed, 60 insertions(+), 46 deletions(-)
> > >
> > > diff --git a/drivers/devfreq/exynos-bus.c b/drivers/devfreq/exynos-bu=
s.c
> > > index d9f377912c10..d8f1efaf2d49 100644
> > > --- a/drivers/devfreq/exynos-bus.c
> > > +++ b/drivers/devfreq/exynos-bus.c
> > > @@ -372,12 +372,69 @@ static int exynos_bus_parse_of(struct device_no=
de *np,
> > >     return ret;
> > >  }
> > >
> > > +static int exynos_bus_profile_init(struct exynos_bus *bus,
> > > +                              struct devfreq_dev_profile *profile)
> > > +{
> > > +   struct device *dev =3D bus->dev;
> > > +   struct devfreq_simple_ondemand_data *ondemand_data;
> > > +   int ret;
> > > +
> > > +   /* Initialize the struct profile and governor data for parent dev=
ice */
> > > +   profile->polling_ms =3D 50;
> > > +   profile->target =3D exynos_bus_target;
> > > +   profile->get_dev_status =3D exynos_bus_get_dev_status;
> > > +   profile->exit =3D exynos_bus_exit;
> > > +
> > > +   ondemand_data =3D devm_kzalloc(dev, sizeof(*ondemand_data), GFP_K=
ERNEL);
> > > +   if (!ondemand_data) {
> > > +           ret =3D -ENOMEM;
> > > +           goto err;
> >
> > Just return proper error code. Less lines, obvious code since you do no=
t
> > have any cleanup in error path.
>
> I was advised to avoid modifying code being moved (in one patch). I do ma=
ke
> changes in these places in patch 04/11, i.e. change the original label 'e=
rr' to
> 'out'. What's your opinion on making the proposed changes to patches 01 a=
nd 02
> (s/goto err/return ret/) in patch 04 instead?

Yes, you're right. I also prefer not to touch moved code.

Best regards,
Krzysztof
