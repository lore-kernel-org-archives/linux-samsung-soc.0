From: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: gpu: samsung-rotator: Document s5pv210 support
Date: Thu, 27 Dec 2018 12:57:35 +0100
Message-ID: <4331572.iOIAVLAcOa@acerlaptop>
References: <20181219155704.15264-1-pawel.mikolaj.chmiel@gmail.com> <20181219155704.15264-3-pawel.mikolaj.chmiel@gmail.com> <CAJKOXPfHHNUzQZu62btspC+6SwgoGPdAzusfSixXM7U9u3QP7A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfHHNUzQZu62btspC+6SwgoGPdAzusfSixXM7U9u3QP7A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Inki Dae <inki.dae@samsung.com>, airlied@linux.ie, jy0922.shim@samsung.com, Seung Woo Kim <sw0312.kim@samsung.com>, kyungmin.park@samsung.com, kgene@kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Dnia =C5=9Broda, 19 grudnia 2018 17:22:51 CET Krzysztof Kozlowski pisze:
> On Wed, 19 Dec 2018 at 17:04, Pawe=C5=82 Chmiel
> <pawel.mikolaj.chmiel@gmail.com> wrote:
> >
> > This commit documents new compatible for s5pv210 soc,
> > which will be also supported by this driver.
> >
> > Signed-off-by: Pawe=C5=82 Chmiel <pawel.mikolaj.chmiel@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/gpu/samsung-rotator.txt | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt =
b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > index 82cd1ed0be93..78658dec6941 100644
> > --- a/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > +++ b/Documentation/devicetree/bindings/gpu/samsung-rotator.txt
> > @@ -5,6 +5,7 @@ Required properties:
> >         (a) "samsung,exynos4210-rotator" for Rotator IP in Exynos4210
> >         (b) "samsung,exynos4212-rotator" for Rotator IP in Exynos4212/4=
412
> >         (c) "samsung,exynos5250-rotator" for Rotator IP in Exynos5250
> > +       (d) "samsung,s5pv210-rotator" for Rotator IP in S5PV210
>=20
> How about putting it at beginning as the oldest chipset? This would
> require reordering the list so maybe let's remove the a/b/c list
> enumerations? They are kind of useless.
Ok, i'll send v2 of patchset with this change.
>=20
> Best regards,
> Krzysztof
