From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Mon, 1 Sep 2014 12:25:49 +0100
Message-ID: <20140901112549.GM7374@lee--X1>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com>
 <20140901074918.GB6226@lee--X1>
 <4121644.3haxjiIdIo@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <4121644.3haxjiIdIo@wuerfel>
Sender: linux-kernel-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, Tomasz Figa <t.figa@samsung.com>, broonie@kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 01 Sep 2014, Arnd Bergmann wrote:
> On Monday 01 September 2014 08:49:18 Lee Jones wrote:
> > On Fri, 22 Aug 2014, Pankaj Dubey wrote:
> >=20
> > > From: Tomasz Figa <t.figa@samsung.com>
> > >=20
> > > Currently a syscon entity can be only registered directly through=
 a
> > > platform device that binds to a dedicated driver. However in cert=
ain use
> > > cases it is desirable to make a device used with another driver a=
 syscon
> > > interface provider. For example, certain SoCs (e.g. Exynos) conta=
in
> > > system controller blocks which perform various functions such as =
power
> > > domain control, CPU power management, low power mode control, but=
 in
> > > addition contain certain IP integration glue, such as various sig=
nal
> > > masks, coprocessor power control, etc. In such case, there is a n=
eed to
> > > have a dedicated driver for such system controller but also share
> > > registers with other drivers. The latter is where the syscon inte=
rface
> > > is helpful.
> > >=20
> > > This patch decouples syscon object from syscon driver, so that it=
 can be
> > > registered from any driver in addition to the original "syscon" p=
latform
> > > driver.
> > >=20
> > > Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > > ---
> > >=20
> > > RFC patch [1] was posted by Tomasz Figa. This patch addresses som=
e of
> > > comments given by Arnd to RFC patch, and further decouples syscon=
 from
> > > device model. It also gives flexibility of registering with sysco=
n at
> > > early stage using device_node object.
> >=20
> > It would be helpful if Arnd gave this revision his blessing (Ack).
>=20
> I never saw a reason why we don't take this all the way as discussed
> a few times: Completely remove the dependency of syscon on having
> a platform driver for it, and make it possible to just call
> syscon_regmap_lookup_by_phandle() without having to register
> it first.

I think this sounds like a good end-state.  Migrating over by
supporting both methods in this way does sound like the correct thing
to do though.  Doing so is likely to dramatically reduce the effect on
current users.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
