From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH RFC] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Tue, 24 Jun 2014 16:33:28 +0530
Message-ID: <007901cf8f9b$fe27ae70$fa770b50$@samsung.com>
References: <53A05E2D.6020702@samsung.com>
 <1403019164-12514-1-git-send-email-t.figa@samsung.com>
 <5027740.B7iVUcUX2T@wuerfel> <53A0B27E.5010708@gmail.com>
 <20140618082653.GN21030@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20140618082653.GN21030@lee--X1>
Content-language: en-us
Sender: linux-kernel-owner@vger.kernel.org
To: 'Lee Jones' <lee.jones@linaro.org>, 'Tomasz Figa' <tomasz.figa@gmail.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, mark.brown@linaro.org, 'Tomasz Figa' <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Kukjin Kim' <kgene.kim@samsung.com>, 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Samuel Ortiz' <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, michal.simek@xilinx.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On Wednesday, June 18 2014, Lee Jones wrote:
> On Tue, 17 Jun 2014, Tomasz Figa wrote:
> > On 17.06.2014 17:42, Arnd Bergmann wrote:
> > > On Tuesday 17 June 2014 17:32:44 Tomasz Figa wrote:
> > >> Currently a syscon entity can be only registered directly throug=
h a
> > >> platform device that binds to a dedicated driver. However in
> > >> certain use cases it is desirable to make a device used with
> > >> another driver a syscon interface provider. For example, certain
> > >> SoCs (e.g. Exynos) contain system controller blocks which perfor=
m
> > >> various functions such as power domain control, CPU power
> > >> management, low power mode control, but in addition contain cert=
ain
> > >> IP integration glue, such as various signal masks, coprocessor
> > >> power control, etc. In such case, there is a need to have a
> > >> dedicated driver for such system controller but also share
> > >> registers with other drivers. The latter is where the syscon int=
erface is helpful.
> > >>
> > >> This patch decouples syscon object from syscon driver, so that i=
t
> > >> can be registered from any driver in addition to the original
> > >> "syscon" platform driver.
>=20
> +1 for this approach.
>=20
> Michal, Pankay,
>   Does it also suit your needs?
>=20

Sorry for late reply.=20
I tested this patch after changing exynos PMU to be a syscon provider a=
nd it's working well.
So if we can address Arnd's comments, this patch will be helpful in mak=
ing exynos PMU a=20
complete platform driver.

Thanks,
Pankaj Dubey

> > >> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > >
> > > Hi Tomasz,
> > >
> > > This seems like a reasonable way of solving the problem, but I th=
ink
> > > there is an even better one that we have about in the past: if we
> > > promote syscon from a platform driver into a a drivers/base/ help=
er
> > > that is independent of the platform device matching, we can use c=
all
> > > syscon_regmap_lookup_* for any device node, whether it's already
> > > bound to a driver or not, which do what you need. It would also m=
ake
> > > it easier to call the syscon code before the platform_device
> > > infrastructure gets initialized, which is something a number of
> > > people have asked for, e.g. for using regmap to do SMP bringup or
> > > for clock registration.
> >
> > Basically, unless I'm missing your point, this is what my patch doe=
s,
> > except that I don't move it to drivers/base/ and the registration
> > function I added require a pointer to struct device. Indeed,
> > decoupling it further from the driver model, by adding
> > of_syscon_register() should be useful for early users.
>=20
> If agreed by Arnd, I think this work can be completed as a subsequent=
 patch.
>=20
> > Should I move this to drivers/base/, even though from current locat=
ion
> > it can be used outside the platform driver anyway?
>=20
> If I'm being honest with myself, I'd say that Syscon wasn't really an=
 MFD driver.  I'm
> happy to keep it in there any continue maintaining it, but wouldn't b=
lock a move
> either.
>=20
> --
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead Linaro.org =E2=94=82 Open=
 source software
> for ARM SoCs Follow Linaro: Facebook | Twitter | Blog
