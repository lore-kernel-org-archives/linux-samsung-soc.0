From: Priit Laes <plaes@plaes.org>
Subject: Re: [linux-sunxi] [PATCH 01/23] mtd: kill the ecclayout->oobavail
 field
Date: Tue, 08 Dec 2015 08:43:05 +0200
Message-ID: <1449556985.25438.8.camel@plaes.org>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
	 <1449527178-5930-2-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1449527178-5930-2-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-kernel-owner@vger.kernel.org
To: boris.brezillon@free-electrons.com, David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Josh Wu <josh.wu@atmel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 2015-12-07 at 23:25 +0100, Boris Brezillon wrote:
> ecclayout->oobavail is just redundant with the mtd->oobavail field.
> Moreover, it prevents static const definition of ecc layouts since
> the
> NAND framework is calculating this value based on the ecclayout-
> >oobfree
> field.
>=20
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> =C2=A0drivers/mtd/devices/docg3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0|=C2=A0=C2=A05 ++-
> =C2=A0drivers/mtd/mtdswap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 16 ++++-----
> =C2=A0drivers/mtd/nand/brcmnand/brcmnand.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A03 --
> =C2=A0drivers/mtd/nand/docg4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> =C2=A0drivers/mtd/nand/hisi504_nand.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01=
 -
> =C2=A0drivers/mtd/nand/nand_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
| 12 +++----
> =C2=A0drivers/mtd/onenand/onenand_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 16 ++++-----
> =C2=A0drivers/mtd/tests/oobtest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0| 49 +++++++++++++--
> ------------
> =C2=A0drivers/staging/mt29f_spinand/mt29f_spinand.c |=C2=A0=C2=A01 -
> =C2=A0fs/jffs2/wbuf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=
=C2=A06 ++--
> =C2=A0include/linux/mtd/mtd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> =C2=A011 files changed, 48 insertions(+), 63 deletions(-)
>=20
[..]
> =C2=A0
> diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> b/drivers/mtd/nand/brcmnand/brcmnand.c
> index 35d78f7..a906ec2 100644
> --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> @@ -845,9 +845,6 @@ static struct nand_ecclayout *brcmnand_create_lay=
out(int ecc_level,
> =C2=A0			break;
> =C2=A0	}
> =C2=A0out:
> -	/* Sum available OOB */
> -	for (i =3D 0; i < MTD_MAX_OOBFREE_ENTRIES_LARGE; i++)
> -		layout->oobavail +=3D layout->oobfree[i].length;
> =C2=A0	return layout;
> =C2=A0}

You can get rid of the 'out' label and replace the single goto in this
function with 'return layout'.

[...]
> =C2=A0
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c
> index 0748a13..1107f5c1 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2037,7 +2037,7 @@ static int nand_do_read_oob(struct mtd_info
> *mtd, loff_t from,
> =C2=A0	stats =3D mtd->ecc_stats;
> =C2=A0
> =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> -		len =3D chip->ecc.layout->oobavail;
> +		len =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		len =3D mtd->oobsize;
> =C2=A0
> @@ -2728,7 +2728,7 @@ static int nand_do_write_oob(struct mtd_info
> *mtd, loff_t to,
> =C2=A0			=C2=A0__func__, (unsigned int)to, (int)ops-
> >ooblen);
> =C2=A0
> =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> -		len =3D chip->ecc.layout->oobavail;
> +		len =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		len =3D mtd->oobsize;
> =C2=A0
[...]
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c
> index 43b3392..d70bbfd 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1125,7 +1125,7 @@ static int onenand_mlc_read_ops_nolock(struct
> mtd_info *mtd, loff_t from,
> =C2=A0			(int)len);
> =C2=A0
> =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> -		oobsize =3D this->ecclayout->oobavail;
> +		oobsize =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		oobsize =3D mtd->oobsize;
> =C2=A0
> @@ -1230,7 +1230,7 @@ static int onenand_read_ops_nolock(struct
> mtd_info *mtd, loff_t from,
> =C2=A0			(int)len);
> =C2=A0
> =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> -		oobsize =3D this->ecclayout->oobavail;
> +		oobsize =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		oobsize =3D mtd->oobsize;
> =C2=A0
> @@ -1365,7 +1365,7 @@ static int onenand_read_oob_nolock(struct
> mtd_info *mtd, loff_t from,
> =C2=A0	ops->oobretlen =3D 0;
> =C2=A0
> =C2=A0	if (mode =3D=3D MTD_OPS_AUTO_OOB)
> -		oobsize =3D this->ecclayout->oobavail;
> +		oobsize =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		oobsize =3D mtd->oobsize;
> =C2=A0
> @@ -1887,7 +1887,7 @@ static int onenand_write_ops_nolock(struct
> mtd_info *mtd, loff_t to,
> =C2=A0		return 0;
> =C2=A0
> =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> -		oobsize =3D this->ecclayout->oobavail;
> +		oobsize =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		oobsize =3D mtd->oobsize;
> =C2=A0
> @@ -2063,7 +2063,7 @@ static int onenand_write_oob_nolock(struct
> mtd_info *mtd, loff_t to,
> =C2=A0	ops->oobretlen =3D 0;
> =C2=A0
> =C2=A0	if (mode =3D=3D MTD_OPS_AUTO_OOB)
> -		oobsize =3D this->ecclayout->oobavail;
> +		oobsize =3D mtd->oobavail;
> =C2=A0	else
> =C2=A0		oobsize =3D mtd->oobsize;

This identical construction seems to occur multiple times in multiple
files. Would it make sense to create a macro for it?


P=C3=A4ikest,
Priit Laes :)
