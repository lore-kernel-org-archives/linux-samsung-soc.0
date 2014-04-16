From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/3] mfd: tps65090: Allow charger module to be used when
 no irq
Date: Wed, 16 Apr 2014 20:03:36 +0100
Message-ID: <20140416190336.GB28725@lee--X1>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
 <1397592876-5741-2-git-send-email-dianders@chromium.org>
 <20140416095229.GF4754@lee--X1>
 <CAD=FV=VjmXGjDHTcm=E2eEPtkOa5DxKG70jXj22RbbN1VfeGjw@mail.gmail.com>
 <20140416162621.GA28725@lee--X1>
 <CAD=FV=Vh=Ej3znMmQDfWyLbhhzZh424Kx8BA=86qcwp+AmMqBw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAD=FV=Vh=Ej3znMmQDfWyLbhhzZh424Kx8BA=86qcwp+AmMqBw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Samuel Ortiz <sameo@linux.intel.com>, Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>, David Woodhouse <dwmw2@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


> >> >> On the ARM Chromebook tps65090 has two masters: the AP (the mai=
n
> >> >> processor running linux) and the EC (the embedded controller). =
 The AP
> >> >> is allowed to mess with FETs but the EC is in charge of charge =
control.
> >> >>
> >> >> The tps65090 interupt line is routed to both the AP and the EC,=
 which
> >> >> can cause quite a headache.  Having two people adjusting masks =
and
> >> >> acking interrupts is a recipe for disaster.
> >> >>
> >> >> In the shipping kernel we had a hack to have the AP pay attenti=
on to
> >> >> the IRQ but not to ack it.  It also wasn't supposed to configur=
e the
> >> >> IRQ in any way.  That hack allowed us to detect when the device=
 was
> >> >> charging without messing with the EC's state.
> >> >>
> >> >> The current tps65090 infrastructure makes the above difficult, =
and it
> >> >> was a bit of a hack to begin with.  Rather than uglify the driv=
er to
> >> >> support it, just extend the driver's existing notion of "no irq=
" to
> >> >> the charger.  This makes the charger code poll every 2 seconds =
for AC
> >> >> detect, which is sufficient.
> >> >>
> >> >> Signed-off-by: Doug Anderson <dianders@chromium.org>
> >> >> ---
> >> >>  drivers/mfd/tps65090.c           | 14 ++++++--
> >> >>  drivers/power/tps65090-charger.c | 76 ++++++++++++++++++++++++=
+++++++---------
> >> >>  2 files changed, 70 insertions(+), 20 deletions(-)
> >> >
> >> > For the MFD part:
> >> >   Acked-by: Lee Jones <lee.jones@linaro.org>
> >> >
> >> > Anton,
> >> >   If you are okay with this patch I'd be happy to create an immu=
table
> >> > branch for you to pull from?
> >> >
> >> > Doug,
> >> >   What is the relationship (dependencies) between this and the o=
ther
> >> > patches in the set?
> >>
> >> This patch can be applied irrespective of other others in the seri=
es.
> >
> > What about the files in the patch? Could you make two separate patc=
hes
> > from this one patch and it would still compile okay? I'm _guessing_
> > the answer is yes?
>=20
> Yes, they'll compile and even boot on their own.  I just tested it.
>=20
> If I put only the MFD part in, then at boot I see:
>   tps65090-charger tps65090-charger: Unable to get charger irq =3D -6
> ...but otherwise the system functions.
>=20
> If I put only the charger part in, then at boot:
>   tps65090-charger tps65090-charger: Unable to register irq 1 err -22
>   tps65090-charger: probe of tps65090-charger failed with error -22
>=20
> ...so you need both patches in order to make things function, but the=
y
> can be applied separately.  I'll assume it will make your life easier
> if I split this into two patches so I'll do that.

Yes please.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
