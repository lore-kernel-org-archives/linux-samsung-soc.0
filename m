From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH] mfd: syscon: Decouple syscon interface from syscon
 devices
Date: Mon, 1 Sep 2014 08:49:18 +0100
Message-ID: <20140901074918.GB6226@lee--X1>
References: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1408694991-21615-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, arnd@arndb.de, vikas.sajjan@samsung.com, joshi@samsung.com, naushad@samsung.com, thomas.ab@samsung.com, chow.kim@samsung.com, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 22 Aug 2014, Pankaj Dubey wrote:

> From: Tomasz Figa <t.figa@samsung.com>
>=20
> Currently a syscon entity can be only registered directly through a
> platform device that binds to a dedicated driver. However in certain =
use
> cases it is desirable to make a device used with another driver a sys=
con
> interface provider. For example, certain SoCs (e.g. Exynos) contain
> system controller blocks which perform various functions such as powe=
r
> domain control, CPU power management, low power mode control, but in
> addition contain certain IP integration glue, such as various signal
> masks, coprocessor power control, etc. In such case, there is a need =
to
> have a dedicated driver for such system controller but also share
> registers with other drivers. The latter is where the syscon interfac=
e
> is helpful.
>=20
> This patch decouples syscon object from syscon driver, so that it can=
 be
> registered from any driver in addition to the original "syscon" platf=
orm
> driver.
>=20
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>=20
> RFC patch [1] was posted by Tomasz Figa. This patch addresses some of
> comments given by Arnd to RFC patch, and further decouples syscon fro=
m
> device model. It also gives flexibility of registering with syscon at
> early stage using device_node object.

It would be helpful if Arnd gave this revision his blessing (Ack).

> [1]: https://lkml.org/lkml/2014/6/17/331
>=20
>  drivers/mfd/syscon.c       |  112 ++++++++++++++++++++++++++++------=
----------
>  include/linux/mfd/syscon.h |   14 ++++++
>  2 files changed, 86 insertions(+), 40 deletions(-)
>=20
> diff --git a/drivers/mfd/syscon.c b/drivers/mfd/syscon.c
> index ca15878..a91db30 100644
> --- a/drivers/mfd/syscon.c
> +++ b/drivers/mfd/syscon.c
> @@ -14,6 +14,7 @@

[...]

>  struct regmap *syscon_regmap_lookup_by_pdevname(const char *s)
>  {
> -	struct device *dev;
> -	struct syscon *syscon;
> -
> -	dev =3D driver_find_device(&syscon_driver.driver, NULL, (void *)s,
> -				 syscon_match_pdevname);
> -	if (!dev)
> -		return ERR_PTR(-EPROBE_DEFER);
> -
> -	syscon =3D dev_get_drvdata(dev);
> +	struct syscon *entry, *syscon =3D NULL;
> +	struct platform_device *pdev =3D NULL;
> +
> +	spin_lock(&syscon_list_slock);
> +	list_for_each_entry(entry, &syscon_list, list) {
> +		 pdev =3D of_find_device_by_node(entry->np);

White space error.

Did you run this through checkpatch.pl?

> +		if (pdev && !strcmp(dev_name(&pdev->dev), s)) {
> +			syscon =3D entry;
> +			break;
> +		}
> +	}
> +	spin_unlock(&syscon_list_slock);
> =20
> -	return syscon->regmap;
> +	return syscon ? syscon->regmap : ERR_PTR(-EPROBE_DEFER);
>  }
>  EXPORT_SYMBOL_GPL(syscon_regmap_lookup_by_pdevname);

[...]

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
