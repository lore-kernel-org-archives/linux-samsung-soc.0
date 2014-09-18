From: "Li.Xiubo@freescale.com" <Li.Xiubo@freescale.com>
Subject: RE: [PATCH v3] mfd: syscon: Decouple syscon interface from platform
 devices
Date: Thu, 18 Sep 2014 07:58:17 +0000
Message-ID: <7154374a11f94c868e551bfe8bb8ecb6@BY2PR0301MB0613.namprd03.prod.outlook.com>
References: <1410935510-1567-1-git-send-email-pankaj.dubey@samsung.com>
 <20140917085818.GA10285@shlinux1.ap.freescale.net>
 <000401cfd269$922dfc40$b689f4c0$@samsung.com>
 <20140918030552.GA26661@shlinux1.ap.freescale.net>
 <000701cfd306$4d3e8080$e7bb8180$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <000701cfd306$4d3e8080$e7bb8180$@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>, "Aisheng.Dong@freescale.com" <Aisheng.Dong@freescale.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "arnd@arndb.de" <arnd@arndb.de>, "naushad@samsung.com" <naushad@samsung.com>, "tomasz.figa@gmail.com" <tomasz.figa@gmail.com>, "joshi@samsung.com" <joshi@samsung.com>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "vikas.sajjan@samsung.com" <vikas.sajjan@samsung.com>, "chow.kim@samsung.com" <chow.kim@samsung.com>, "lee.jones@linaro.org" <lee.jones@linaro.org>, 'Boris BREZILLON' <boris.brezillon@free-electrons.com>, 'Geert Uytterhoeven' <geert+renesas@glider.be>, 'Stephen Warren' <swarren@nvidia.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

[...]
> > please see regmap_get_val_endian called in regmap_init function.
> > static enum regmap_endian regmap_get_val_endian(struct device *dev,
> >                                         const struct regmap_bus *bus,
> >                                         const struct regmap_config
> *config) {
> >         struct device_node *np = dev->of_node;
> >         enum regmap_endian endian;
> > ...
> > }
> > It will crash at the first line of dev->of_node if dev is NULL.
> >
> > Can you check if you're using the same code as mine?
> 
> No, it's not same.
> My bad that I was not using linux-next for testing this patch.
> We tested on kgene/for-next where these changes still have not come.
> Just now I checked linux-next and found that it will crash at first line of
> "regmap_get_val_endian" as there is no check for NULL on dev.
> 
> I checked git history of regmap.c file and found recently this file has been
> modified
> for adding DT endianness binding support. Following are set of patches gone
> for this
> 
> cf673fb regmap: Split regmap_get_endian() in two functions
> 5844a8b regmap: Fix handling of volatile registers for format_write() chips
> 45e1a27 regmap: of_regmap_get_endian() cleanup
> ba1b53f regmap: Fix DT endianess parsing logic
> d647c19 regmap: add DT endianness binding support.
> 
> I think there should have been a check for NULL on "dev" in
> "regmap_get_val_endian", so that if dev pointer exist then only it makes
> sense to get
> endianness property from DT.
> 
> I will suggest following fix in regmap.c for this. With following fix I
> tested it and it works well
> on linux-next also. So if you can confirm following fix is working for you
> then I can post this
> patch.
> 
> --------------------------------------------
> Subject: [PATCH] regmap: fix NULL pointer dereference in
>  regmap_get_val_endian
> 
> Recent commits for getting reg endianess causing NULL pointer
> dereference if dev is passed NULL in regmap_init_mmio. This patch
> fixes this issue, and allows to parse reg endianess only if dev
> and dev->of_node exist.
> 

Another question:

Then the regmap core cannot deal with the following issue:
Like the patch adding the endianness support for syscon:
    [PATCH] mfd: syscon: binding: Add syscon endianness support.

So here just register one dummy syscon device is a good choice I do
think.
:)


Thanks,

BRs
Xiubo



> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  drivers/base/regmap/regmap.c |   23 ++++++++++++++---------
>  1 file changed, 14 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index f2281af..455a877 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -477,7 +477,7 @@ static enum regmap_endian regmap_get_val_endian(struct
> device *dev,
>  					const struct regmap_bus *bus,
>  					const struct regmap_config *config)
>  {
> -	struct device_node *np = dev->of_node;
> +	struct device_node *np;
>  	enum regmap_endian endian;
> 
>  	/* Retrieve the endianness specification from the regmap config */
> @@ -487,15 +487,20 @@ static enum regmap_endian regmap_get_val_endian(struct
> device *dev,
>  	if (endian != REGMAP_ENDIAN_DEFAULT)
>  		return endian;
> 
> -	/* Parse the device's DT node for an endianness specification */
> -	if (of_property_read_bool(np, "big-endian"))
> -		endian = REGMAP_ENDIAN_BIG;
> -	else if (of_property_read_bool(np, "little-endian"))
> -		endian = REGMAP_ENDIAN_LITTLE;
> +	/* If the dev and dev->of_node exist try to get endianness from DT
> */
> +	if (dev && dev->of_node) {
> +		np = dev->of_node;
> 
> -	/* If the endianness was specified in DT, use that */
> -	if (endian != REGMAP_ENDIAN_DEFAULT)
> -		return endian;
> +		/* Parse the device's DT node for an endianness
> specification */
> +		if (of_property_read_bool(np, "big-endian"))
> +			endian = REGMAP_ENDIAN_BIG;
> +		else if (of_property_read_bool(np, "little-endian"))
> +			endian = REGMAP_ENDIAN_LITTLE;
> +
> +		/* If the endianness was specified in DT, use that */
> +		if (endian != REGMAP_ENDIAN_DEFAULT)
> +			return endian;
> +	}
> 
>  	/* Retrieve the endianness specification from the bus config */
>  	if (bus && bus->val_format_endian_default)
> --
> 
> Thanks,
> Pankaj Dubey
> 
> > Regards
> > Dong Aisheng
> >
> > >
> > > Thanks,
> > > Pankaj Dubey
> > >
> > > > Regards
> > > > Dong Aisheng
> > > >
> > > > >
> > > > >
> > > > > _______________________________________________
> > > > > linux-arm-kernel mailing list
> > > > > linux-arm-kernel@lists.infradead.org
> > > > > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> > >
