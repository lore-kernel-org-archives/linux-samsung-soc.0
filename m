From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: RE: [PATCH v6] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Tue, 30 Sep 2014 09:33:38 +0530
Message-ID: <000d01cfdc63$99576bb0$cc064310$@samsung.com>
References: <1411980458-32329-1-git-send-email-pankaj.dubey@samsung.com>
 <1617081.XFKIz4hM4O@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:48022 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751077AbaI3EEn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 30 Sep 2014 00:04:43 -0400
In-reply-to: <1617081.XFKIz4hM4O@phil>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, arnd@arndb.de, b29396@freescale.com, lee.jones@linaro.org, boris.brezillon@free-electrons.com, tomasz.figa@gmail.com, linux@arm.linux.org.uk, vikas.sajjan@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, kgene.kim@samsung.com, Li.Xiubo@freescale.com, geert+renesas@glider.be, swarren@nvidia.com, linux-rockchip@lists.infradead.org

Hi,

On Monday, September 29, 2014 9:38 PM, Heiko St=FCbner wrote,
> Am Montag, 29. September 2014, 14:17:38 schrieb Pankaj Dubey:
> > Currently a syscon entity can be only registered directly through a
> > platform device that binds to a dedicated syscon driver. However in
> > certain use cases it is desirable to make a device used with anothe=
r
> > driver a syscon interface provider.
> >
> > For example, certain SoCs (e.g. Exynos) contain system controller
> > blocks which perform various functions such as power domain control=
,
> > CPU power management, low power mode control, but in addition conta=
in
> > certain IP integration glue, such as various signal masks, coproces=
sor
> > power control, etc. In such case, there is a need to have a dedicat=
ed
> > driver for such system controller but also share registers with oth=
er
> > drivers. The latter is where the syscon interface is helpful.
> >
> > In case of DT based platforms, this patch decouples syscon object f=
rom
> > syscon platform driver, and allows to create syscon objects first t=
ime
> > when it is required by calling of syscon_regmap_lookup_by APIs and
> > keep a list of such syscon objects along with syscon provider
> > device_nodes and regmap handles.
> >
> > For non-DT based platforms, this patch keeps syscon platform driver
> > structure where is can be probed and such non-DT based drivers can =
use
> > syscon_regmap_lookup_by_pdev API and get access to regmap handles.
> > Once all users of "syscon_regmap_lookup_by_pdev" migrated to DT bas=
ed,
> > we can completely remove platform driver of syscon, and keep only
> > helper functions to get regmap handles.
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> > Tested-by: Vivek Gautam <gautam.vivek@samsung.com>
> > Tested-by: Javier Martinez Canillas <javier.martinez@collabora.co.u=
k>
> > Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> > ---
>=20
> On Rockchip boards during core clock init (aka before timers)
> Tested-by: Heiko Stuebner <heiko@sntech.de>
>=20

Thanks for testing.

> Except one issue described inline below
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>=20
>=20
> And I'm really looking forward to having this in the kernel :-)
>=20
> Thanks for working on this
> Heiko
>=20
>=20

[snip]

> >
> >  drivers/mfd/syscon.c |  106
> > +++++++++++++++++++++++++++++++++++++++----------- 1 file
> changed, 84
> > insertions(+), 22 deletions(-)
> >
> > diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c index
> > ca15878..00a8410 100644
> > --- a/drivers/mfd/syscon.c
> > +++ b/drivers/mfd/syscon.c
> > @@ -15,6 +15,7 @@
> >  #include <linux/err.h>
> >  #include <linux/io.h>
> >  #include <linux/module.h>
> > +#include <linux/list.h>
> >  #include <linux/of.h>
> >  #include <linux/of_address.h>
> >  #include <linux/of_platform.h>
> > @@ -22,31 +23,104 @@
> >  #include <linux/platform_device.h>
> >  #include <linux/regmap.h>
> >  #include <linux/mfd/syscon.h>
> > +#include <linux/slab.h>
> >
> >  static struct platform_driver syscon_driver;
> >
> > +static DEFINE_SPINLOCK(syscon_list_slock);
> > +static LIST_HEAD(syscon_list);
> > +
> >  struct syscon {
> > +	struct device_node *np;
> >  	struct regmap *regmap;
> > +	struct list_head list;
> > +};
> > +
> > +static struct regmap_config syscon_regmap_config =3D {
> > +	.reg_bits =3D 32,
> > +	.val_bits =3D 32,
> > +	.reg_stride =3D 4,
> >  };
> >
> > -static int syscon_match_node(struct device *dev, void *data)
> > +static struct syscon *of_syscon_register(struct device_node *np)
> >  {
> > -	struct device_node *dn =3D data;
> > +	struct syscon *syscon;
> > +	struct regmap *regmap;
> > +	void __iomem *base;
> > +	int ret;
> > +	enum regmap_endian endian =3D REGMAP_ENDIAN_DEFAULT;
> > +
> > +	if (!of_device_is_compatible(np, "syscon"))
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	syscon =3D kzalloc(sizeof(*syscon), GFP_KERNEL);
> > +	if (!syscon)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	base =3D of_iomap(np, 0);
> > +	if (!base) {
> > +		ret =3D -ENOMEM;
> > +		goto err_map;
> > +	}
> > +
> > +	/* Parse the device's DT node for an endianness specification */
> > +	if (of_property_read_bool(np, "big-endian"))
> > +		endian =3D REGMAP_ENDIAN_BIG;
> > +	 else if (of_property_read_bool(np, "little-endian"))
> > +		endian =3D REGMAP_ENDIAN_LITTLE;
> > +
> > +	/* If the endianness was specified in DT, use that */
> > +	if (endian !=3D REGMAP_ENDIAN_DEFAULT)
> > +		syscon_regmap_config.val_format_endian =3D endian;
> > +
> > +	regmap =3D regmap_init_mmio(NULL, base, &syscon_regmap_config);
> > +	if (IS_ERR(regmap)) {
> > +		pr_err("regmap init failed\n");
> > +		ret =3D PTR_ERR(regmap);
> > +		goto err_regmap;
> > +	}
> > +
> > +	syscon->regmap =3D regmap;
> > +	syscon->np =3D np;
> > +
> > +	spin_lock(&syscon_list_slock);
> > +	list_add_tail(&syscon->list, &syscon_list);
> > +	spin_unlock(&syscon_list_slock);
> >
> > -	return (dev->of_node =3D=3D dn) ? 1 : 0;
> > +	/* Change back endianness of syscon_regmap_config.
> > +	 * As this is static config in this file and in one system we may
> > +	 * have more than one syscon
> > +	 */
> > +	syscon_regmap_config.val_format_endian =3D
> REGMAP_ENDIAN_DEFAULT;
>=20
> This should also be done in the error case. Currently when you goto
err_regmap the
> overridden value will be left in the struct.
>=20

Thanks, will handle this in error condition also.

> While on this, is there a concurrency issue here, aka of_syscon_regis=
ter
could be
> called in parallel and what happens with
syscon_regmap_config.val_format_endian
> then?

I can think of two approaches to solve this.

1: Updating syscon_regmap_config, under spin_lock "syscon_list_slock".
2: Creation of local copy of syscon_regmap_config in "of_syscon_registe=
r"
and using=20
it. In this case changing back of endianness in syscon_regmap_config, w=
ill
not be needed
and code will be a bit cleaner.

I would prefer second one, what is your opinion?

Thanks,
Pankaj Dubey

>=20
>=20
> > +
> > +	return syscon;
> > +
> > +err_regmap:
> > +	iounmap(base);
> > +err_map:
> > +	kfree(syscon);
> > +	return ERR_PTR(ret);
> >  }
> >
> >  struct regmap *syscon_node_to_regmap(struct device_node *np)  {
> > -	struct syscon *syscon;
> > -	struct device *dev;
> > +	struct syscon *entry, *syscon =3D NULL;
> >
> > -	dev =3D driver_find_device(&syscon_driver.driver, NULL, np,
> > -				 syscon_match_node);
> > -	if (!dev)
> > -		return ERR_PTR(-EPROBE_DEFER);
> > +	spin_lock(&syscon_list_slock);
> >
> > -	syscon =3D dev_get_drvdata(dev);
> > +	list_for_each_entry(entry, &syscon_list, list)
> > +		if (entry->np =3D=3D np) {
> > +			syscon =3D entry;
> > +			break;
> > +		}
> > +
> > +	spin_unlock(&syscon_list_slock);
> > +
> > +	if (!syscon)
> > +		syscon =3D of_syscon_register(np);
> > +
> > +	if (IS_ERR(syscon))
> > +		return ERR_CAST(syscon);
> >
> >  	return syscon->regmap;
> >  }
> > @@ -110,17 +184,6 @@ struct regmap
> > *syscon_regmap_lookup_by_phandle(struct
> > device_node *np, }
> >  EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_phandle);
> >
> > -static const struct of_device_id of_syscon_match[] =3D {
> > -	{ .compatible =3D "syscon", },
> > -	{ },
> > -};
> > -
> > -static struct regmap_config syscon_regmap_config =3D {
> > -	.reg_bits =3D 32,
> > -	.val_bits =3D 32,
> > -	.reg_stride =3D 4,
> > -};
> > -
> >  static int syscon_probe(struct platform_device *pdev)  {
> >  	struct device *dev =3D &pdev->dev;
> > @@ -167,7 +230,6 @@ static struct platform_driver syscon_driver =3D=
 {
> >  	.driver =3D {
> >  		.name =3D "syscon",
> >  		.owner =3D THIS_MODULE,
> > -		.of_match_table =3D of_syscon_match,
> >  	},
> >  	.probe		=3D syscon_probe,
> >  	.id_table	=3D syscon_ids,
