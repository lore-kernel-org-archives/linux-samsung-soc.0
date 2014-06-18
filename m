From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH RFC] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Wed, 18 Jun 2014 09:26:53 +0100
Message-ID: <20140618082653.GN21030@lee--X1>
References: <53A05E2D.6020702@samsung.com>
 <1403019164-12514-1-git-send-email-t.figa@samsung.com>
 <5027740.B7iVUcUX2T@wuerfel>
 <53A0B27E.5010708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <53A0B27E.5010708@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, mark.brown@linaro.org, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Samuel Ortiz <sameo@linux.intel.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org, joshi@samsung.com, vikas.sajjan@samsung.com, chow.kim@samsung.com, michal.simek@xilinx.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 17 Jun 2014, Tomasz Figa wrote:
> On 17.06.2014 17:42, Arnd Bergmann wrote:
> > On Tuesday 17 June 2014 17:32:44 Tomasz Figa wrote:
> >> Currently a syscon entity can be only registered directly through =
a
> >> platform device that binds to a dedicated driver. However in certa=
in use
> >> cases it is desirable to make a device used with another driver a =
syscon
> >> interface provider. For example, certain SoCs (e.g. Exynos) contai=
n
> >> system controller blocks which perform various functions such as p=
ower
> >> domain control, CPU power management, low power mode control, but =
in
> >> addition contain certain IP integration glue, such as various sign=
al
> >> masks, coprocessor power control, etc. In such case, there is a ne=
ed to
> >> have a dedicated driver for such system controller but also share
> >> registers with other drivers. The latter is where the syscon inter=
face
> >> is helpful.
> >>
> >> This patch decouples syscon object from syscon driver, so that it =
can be
> >> registered from any driver in addition to the original "syscon" pl=
atform
> >> driver.

+1 for this approach.

Michal, Pankay,
  Does it also suit your needs?

> >> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> >=20
> > Hi Tomasz,
> >=20
> > This seems like a reasonable way of solving the problem, but I thin=
k
> > there is an even better one that we have about in the past: if we
> > promote syscon from a platform driver into a a drivers/base/ helper
> > that is independent of the platform device matching, we can use
> > call syscon_regmap_lookup_* for any device node, whether it's alrea=
dy
> > bound to a driver or not, which do what you need. It would also mak=
e
> > it easier to call the syscon code before the platform_device
> > infrastructure gets initialized, which is something a number of
> > people have asked for, e.g. for using regmap to do SMP bringup
> > or for clock registration.
>=20
> Basically, unless I'm missing your point, this is what my patch does,
> except that I don't move it to drivers/base/ and the registration
> function I added require a pointer to struct device. Indeed, decoupli=
ng
> it further from the driver model, by adding of_syscon_register() shou=
ld
> be useful for early users.

If agreed by Arnd, I think this work can be completed as a subsequent
patch.

> Should I move this to drivers/base/, even though from current locatio=
n
> it can be used outside the platform driver anyway?

If I'm being honest with myself, I'd say that Syscon wasn't really an
MFD driver.  I'm happy to keep it in there any continue maintaining
it, but wouldn't block a move either.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
