From: Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 3/4] Documentation: devicetree: Fix tps65090 typos
Date: Wed, 25 Jun 2014 11:47:32 +0100
Message-ID: <20140625104732.GE14495@leverpostej>
References: <1403486483-4063-1-git-send-email-afaerber@suse.de>
 <1403486483-4063-4-git-send-email-afaerber@suse.de>
 <CAD=FV=UUGQ_ULm+juj0hMxCKhhcXTa2aJT50Y=WrePy9g8u-zA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=UUGQ_ULm+juj0hMxCKhhcXTa2aJT50Y=WrePy9g8u-zA@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Stephan van Schaik <stephan@synkhronix.com>, Vincent Palatin <vpalatin@chromium.org>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <Pawel.Moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Randy Dunlap <rdunlap@infradead.org>, Mark Brown <broonie@linaro.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, "open list:OPEN FIRMWARE AND..." <devicetree@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jun 23, 2014 at 06:27:04PM +0100, Doug Anderson wrote:
> Andreas,
>=20
> On Sun, Jun 22, 2014 at 6:21 PM, Andreas F=C3=A4rber <afaerber@suse.d=
e> wrote:
> > It's vsys-l{1,2}-supply, not vsys_l{1,2}-supply.
> >
> > Signed-off-by: Andreas F=C3=A4rber <afaerber@suse.de>
> > ---
> >  Documentation/devicetree/bindings/regulator/tps65090.txt | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/regulator/tps65090.t=
xt b/Documentation/devicetree/bindings/regulator/tps65090.txt
> > index 34098023..ca69f5e 100644
> > --- a/Documentation/devicetree/bindings/regulator/tps65090.txt
> > +++ b/Documentation/devicetree/bindings/regulator/tps65090.txt
> > @@ -45,8 +45,8 @@ Example:
> >                 infet5-supply =3D <&some_reg>;
> >                 infet6-supply =3D <&some_reg>;
> >                 infet7-supply =3D <&some_reg>;
> > -               vsys_l1-supply =3D <&some_reg>;
> > -               vsys_l2-supply =3D <&some_reg>;
> > +               vsys-l1-supply =3D <&some_reg>;
> > +               vsys-l2-supply =3D <&some_reg>;
>=20
> Your change matches the code and all existing device trees in the
> Linux kernel.

Could this fact please be mentioned in the commit message?

Given that:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> I also see plenty of other bindings with dashes, so this seems
> reasonable.

Dashes rather than underscores are preferred/correct for property names
and compatible strings. Given no-one can possibly be using the
bad/incorrect form with underscores, fixing the documentation to use
dashes makes sense.

Thanks,
Mark.
