From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v6] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Tue, 30 Sep 2014 09:27:27 +0200
Message-ID: <20140930092727.12c34f05@bbrezillon>
References: <1411980458-32329-1-git-send-email-pankaj.dubey@samsung.com>
	<1617081.XFKIz4hM4O@phil>
	<000d01cfdc63$99576bb0$cc064310$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000d01cfdc63$99576bb0$cc064310$@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: 'Heiko =?UTF-8?B?U3TDvGJuZXIn?= <heiko@sntech.de>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b29396@freescale.com, lee.jones@linaro.org, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, kgene.kim@samsung.com, Li.Xiubo@freescale.com, geert+renesas@glider.be, swarren@nvidia.com, linux-rockchip@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj,

On Tue, 30 Sep 2014 09:33:38 +0530
Pankaj Dubey <pankaj.dubey@samsung.com> wrote:

> Hi,
>=20
> On Monday, September 29, 2014 9:38 PM, Heiko St=C3=BCbner wrote,
> > Am Montag, 29. September 2014, 14:17:38 schrieb Pankaj Dubey:
> > > Currently a syscon entity can be only registered directly through=
 a
> > > platform device that binds to a dedicated syscon driver. However =
in
> > > certain use cases it is desirable to make a device used with anot=
her
> > > driver a syscon interface provider.
> > >
> > > For example, certain SoCs (e.g. Exynos) contain system controller
> > > blocks which perform various functions such as power domain contr=
ol,
> > > CPU power management, low power mode control, but in addition con=
tain
> > > certain IP integration glue, such as various signal masks, coproc=
essor
> > > power control, etc. In such case, there is a need to have a dedic=
ated
> > > driver for such system controller but also share registers with o=
ther
> > > drivers. The latter is where the syscon interface is helpful.
> > >
> > > In case of DT based platforms, this patch decouples syscon object=
 from
> > > syscon platform driver, and allows to create syscon objects first=
 time
> > > when it is required by calling of syscon_regmap_lookup_by APIs an=
d
> > > keep a list of such syscon objects along with syscon provider
> > > device_nodes and regmap handles.
> > >
> > > For non-DT based platforms, this patch keeps syscon platform driv=
er
> > > structure where is can be probed and such non-DT based drivers ca=
n use
> > > syscon_regmap_lookup_by_pdev API and get access to regmap handles=
=2E
> > > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT b=
ased,
> > > we can completely remove platform driver of syscon, and keep only
> > > helper functions to get regmap handles.
> > >
> > > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co=
=2Euk>
> > > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > > ---
> >=20
> > On Rockchip boards during core clock init (aka before timers)
> > Tested-by: Heiko Stuebner <heiko@sntech.de>
> >=20
>=20
> Thanks for testing.
>=20
> > Except one issue described inline below
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >=20
> >=20
> > And I'm really looking forward to having this in the kernel :-)

Me too :-).

> >=20
> > Thanks for working on this
> > Heiko
> >=20
> >=20
>=20
> [snip]
>=20
> > >
> > >  drivers/mfd/syscon.c |  106
> > > +++++++++++++++++++++++++++++++++++++++----------- 1 file
> > changed, 84
> > > insertions(+), 22 deletions(-)
> > >
> > > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c index
> > > ca15878..00a8410 100644
> > > --- a/drivers/mfd/syscon.c
> > > +++ b/drivers/mfd/syscon.c
> > > @@ -15,6 +15,7 @@
> > >  #include <linux/err.h>
> > >  #include <linux/io.h>
> > >  #include <linux/module.h>
> > > +#include <linux/list.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_address.h>
> > >  #include <linux/of_platform.h>
> > > @@ -22,31 +23,104 @@
> > >  #include <linux/platform_device.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/mfd/syscon.h>
> > > +#include <linux/slab.h>
> > >
> > >  static struct platform_driver syscon_driver;
> > >
> > > +static DEFINE_SPINLOCK(syscon_list_slock);
> > > +static LIST_HEAD(syscon_list);
> > > +
> > >  struct syscon {
> > > +	struct device_node *np;
> > >  	struct regmap *regmap;
> > > +	struct list_head list;
> > > +};
> > > +
> > > +static struct regmap_config syscon_regmap_config =3D {
> > > +	.reg_bits =3D 32,
> > > +	.val_bits =3D 32,
> > > +	.reg_stride =3D 4,
> > >  };
> > >
> > > -static int syscon_match_node(struct device *dev, void *data)
> > > +static struct syscon *of_syscon_register(struct device_node *np)
> > >  {
> > > -	struct device_node *dn =3D data;
> > > +	struct syscon *syscon;
> > > +	struct regmap *regmap;
> > > +	void __iomem *base;
> > > +	int ret;
> > > +	enum regmap_endian endian =3D REGMAP_ENDIAN_DEFAULT;
> > > +
> > > +	if (!of_device_is_compatible(np, "syscon"))
> > > +		return ERR_PTR(-EINVAL);
> > > +
> > > +	syscon =3D kzalloc(sizeof(*syscon), GFP_KERNEL);
> > > +	if (!syscon)
> > > +		return ERR_PTR(-ENOMEM);
> > > +
> > > +	base =3D of_iomap(np, 0);
> > > +	if (!base) {
> > > +		ret =3D -ENOMEM;
> > > +		goto err_map;
> > > +	}
> > > +
> > > +	/* Parse the device's DT node for an endianness specification *=
/
> > > +	if (of_property_read_bool(np, "big-endian"))
> > > +		endian =3D REGMAP_ENDIAN_BIG;
> > > +	 else if (of_property_read_bool(np, "little-endian"))
> > > +		endian =3D REGMAP_ENDIAN_LITTLE;
> > > +
> > > +	/* If the endianness was specified in DT, use that */
> > > +	if (endian !=3D REGMAP_ENDIAN_DEFAULT)
> > > +		syscon_regmap_config.val_format_endian =3D endian;
> > > +
> > > +	regmap =3D regmap_init_mmio(NULL, base, &syscon_regmap_config);
> > > +	if (IS_ERR(regmap)) {
> > > +		pr_err("regmap init failed\n");
> > > +		ret =3D PTR_ERR(regmap);
> > > +		goto err_regmap;
> > > +	}
> > > +
> > > +	syscon->regmap =3D regmap;
> > > +	syscon->np =3D np;
> > > +
> > > +	spin_lock(&syscon_list_slock);
> > > +	list_add_tail(&syscon->list, &syscon_list);
> > > +	spin_unlock(&syscon_list_slock);
> > >
> > > -	return (dev->of_node =3D=3D dn) ? 1 : 0;
> > > +	/* Change back endianness of syscon_regmap_config.
> > > +	 * As this is static config in this file and in one system we m=
ay
> > > +	 * have more than one syscon
> > > +	 */
> > > +	syscon_regmap_config.val_format_endian =3D
> > REGMAP_ENDIAN_DEFAULT;
> >=20
> > This should also be done in the error case. Currently when you goto
> err_regmap the
> > overridden value will be left in the struct.
> >=20
>=20
> Thanks, will handle this in error condition also.
>=20
> > While on this, is there a concurrency issue here, aka of_syscon_reg=
ister
> could be
> > called in parallel and what happens with
> syscon_regmap_config.val_format_endian
> > then?
>=20
> I can think of two approaches to solve this.
>=20
> 1: Updating syscon_regmap_config, under spin_lock "syscon_list_slock"=
=2E
> 2: Creation of local copy of syscon_regmap_config in "of_syscon_regis=
ter"
> and using=20
> it. In this case changing back of endianness in syscon_regmap_config,=
 will
> not be needed
> and code will be a bit cleaner.
>=20
> I would prefer second one, what is your opinion?

I too prefer the second solution, but it's not my call :-).

Best Regards,

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
