From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 01/23] mtd: kill the ecclayout->oobavail field
Date: Tue, 8 Dec 2015 09:14:51 +0100
Message-ID: <20151208091451.4eef0b50@bbrezillon>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
	<1449527178-5930-2-git-send-email-boris.brezillon@free-electrons.com>
	<1449556985.25438.8.camel@plaes.org>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBAVDTKZQKGQEJAO4U4I-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1449556985.25438.8.camel-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Priit,

On Tue, 08 Dec 2015 08:43:05 +0200
Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org> wrote:

> On Mon, 2015-12-07 at 23:25 +0100, Boris Brezillon wrote:
> > ecclayout->oobavail is just redundant with the mtd->oobavail field.
> > Moreover, it prevents static const definition of ecc layouts since
> > the
> > NAND framework is calculating this value based on the ecclayout-
> > >oobfree
> > field.
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> > =C2=A0drivers/mtd/devices/docg3.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0|=C2=A0=C2=A05 ++-
> > =C2=A0drivers/mtd/mtdswap.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 16 ++++-----
> > =C2=A0drivers/mtd/nand/brcmnand/brcmnand.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A03 --
> > =C2=A0drivers/mtd/nand/docg4.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> > =C2=A0drivers/mtd/nand/hisi504_nand.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> > =C2=A0drivers/mtd/nand/nand_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 1=
2 +++----
> > =C2=A0drivers/mtd/onenand/onenand_base.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| 16 ++++-----
> > =C2=A0drivers/mtd/tests/oobtest.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0| 49 +++++++++++++--
> > ------------
> > =C2=A0drivers/staging/mt29f_spinand/mt29f_spinand.c |=C2=A0=C2=A01 -
> > =C2=A0fs/jffs2/wbuf.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=
=A06 ++--
> > =C2=A0include/linux/mtd/mtd.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0|=C2=A0=C2=A01 -
> > =C2=A011 files changed, 48 insertions(+), 63 deletions(-)
> >=20
> [..]
> > =C2=A0
> > diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c
> > b/drivers/mtd/nand/brcmnand/brcmnand.c
> > index 35d78f7..a906ec2 100644
> > --- a/drivers/mtd/nand/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/brcmnand/brcmnand.c
> > @@ -845,9 +845,6 @@ static struct nand_ecclayout *brcmnand_create_layou=
t(int ecc_level,
> > =C2=A0			break;
> > =C2=A0	}
> > =C2=A0out:
> > -	/* Sum available OOB */
> > -	for (i =3D 0; i < MTD_MAX_OOBFREE_ENTRIES_LARGE; i++)
> > -		layout->oobavail +=3D layout->oobfree[i].length;
> > =C2=A0	return layout;
> > =C2=A0}
>=20
> You can get rid of the 'out' label and replace the single goto in this
> function with 'return layout'.

Yep, I'll fix that.

>=20
> [...]
> > =C2=A0
> > diff --git a/drivers/mtd/nand/nand_base.c
> > b/drivers/mtd/nand/nand_base.c
> > index 0748a13..1107f5c1 100644
> > --- a/drivers/mtd/nand/nand_base.c
> > +++ b/drivers/mtd/nand/nand_base.c
> > @@ -2037,7 +2037,7 @@ static int nand_do_read_oob(struct mtd_info
> > *mtd, loff_t from,
> > =C2=A0	stats =3D mtd->ecc_stats;
> > =C2=A0
> > =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		len =3D chip->ecc.layout->oobavail;
> > +		len =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		len =3D mtd->oobsize;
> > =C2=A0
> > @@ -2728,7 +2728,7 @@ static int nand_do_write_oob(struct mtd_info
> > *mtd, loff_t to,
> > =C2=A0			=C2=A0__func__, (unsigned int)to, (int)ops-
> > >ooblen);
> > =C2=A0
> > =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		len =3D chip->ecc.layout->oobavail;
> > +		len =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		len =3D mtd->oobsize;
> > =C2=A0
> [...]
> > diff --git a/drivers/mtd/onenand/onenand_base.c
> > b/drivers/mtd/onenand/onenand_base.c
> > index 43b3392..d70bbfd 100644
> > --- a/drivers/mtd/onenand/onenand_base.c
> > +++ b/drivers/mtd/onenand/onenand_base.c
> > @@ -1125,7 +1125,7 @@ static int onenand_mlc_read_ops_nolock(struct
> > mtd_info *mtd, loff_t from,
> > =C2=A0			(int)len);
> > =C2=A0
> > =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		oobsize =3D this->ecclayout->oobavail;
> > +		oobsize =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		oobsize =3D mtd->oobsize;
> > =C2=A0
> > @@ -1230,7 +1230,7 @@ static int onenand_read_ops_nolock(struct
> > mtd_info *mtd, loff_t from,
> > =C2=A0			(int)len);
> > =C2=A0
> > =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		oobsize =3D this->ecclayout->oobavail;
> > +		oobsize =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		oobsize =3D mtd->oobsize;
> > =C2=A0
> > @@ -1365,7 +1365,7 @@ static int onenand_read_oob_nolock(struct
> > mtd_info *mtd, loff_t from,
> > =C2=A0	ops->oobretlen =3D 0;
> > =C2=A0
> > =C2=A0	if (mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		oobsize =3D this->ecclayout->oobavail;
> > +		oobsize =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		oobsize =3D mtd->oobsize;
> > =C2=A0
> > @@ -1887,7 +1887,7 @@ static int onenand_write_ops_nolock(struct
> > mtd_info *mtd, loff_t to,
> > =C2=A0		return 0;
> > =C2=A0
> > =C2=A0	if (ops->mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		oobsize =3D this->ecclayout->oobavail;
> > +		oobsize =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		oobsize =3D mtd->oobsize;
> > =C2=A0
> > @@ -2063,7 +2063,7 @@ static int onenand_write_oob_nolock(struct
> > mtd_info *mtd, loff_t to,
> > =C2=A0	ops->oobretlen =3D 0;
> > =C2=A0
> > =C2=A0	if (mode =3D=3D MTD_OPS_AUTO_OOB)
> > -		oobsize =3D this->ecclayout->oobavail;
> > +		oobsize =3D mtd->oobavail;
> > =C2=A0	else
> > =C2=A0		oobsize =3D mtd->oobsize;
>=20
> This identical construction seems to occur multiple times in multiple
> files. Would it make sense to create a macro for it?

Right, I'll make another patch move this logic into an inline function.

Thanks for the review.

Boris


--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--=20
You received this message because you are subscribed to the Google Groups "=
linux-sunxi" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to linux-sunxi+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
