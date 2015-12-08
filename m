From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH 05/23] mtd: nand: jz4770: kill the
 ->ecc_layout field
Date: Tue, 8 Dec 2015 11:33:43 +0100
Message-ID: <20151208113343.2b049993@bbrezillon>
References: <1449527178-5930-1-git-send-email-boris.brezillon@free-electrons.com>
	<1449527178-5930-6-git-send-email-boris.brezillon@free-electrons.com>
	<5666B150.2030406@imgtec.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBBCPETKZQKGQEHH6QZCI-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <5666B150.2030406-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
List-Post: <http://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <http://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <http://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <http://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <http://groups.google.com/group/linux-sunxi/subscribe>
To: Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org>
Cc: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaiah choudary kalluri <punnaia-gjFFaj9aHVdhl2p70BpVqQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 8 Dec 2015 10:30:40 +0000
Harvey Hunt <harvey.hunt-1AXoQHu6uovQT0dZR+AlfA@public.gmane.org> wrote:

> Hi Boris,
> 
> On 07/12/15 22:26, Boris Brezillon wrote:
> > ->ecc_layout is not used by any board file. Kill this field to avoid any
> > confusion. New boards are encouraged to use the default ECC layout defined
> > in NAND core.
> >
> > Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> > ---
> >   arch/mips/include/asm/mach-jz4740/jz4740_nand.h | 2 --
> >   drivers/mtd/nand/jz4740_nand.c                  | 3 ---
> >   2 files changed, 5 deletions(-)
> >
> > diff --git a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> > index 79cff26..398733e 100644
> > --- a/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> > +++ b/arch/mips/include/asm/mach-jz4740/jz4740_nand.h
> > @@ -25,8 +25,6 @@ struct jz_nand_platform_data {
> >   	int			num_partitions;
> >   	struct mtd_partition	*partitions;
> >
> > -	struct nand_ecclayout	*ecc_layout;
> > -
> >   	unsigned char banks[JZ_NAND_NUM_BANKS];
> >
> >   	void (*ident_callback)(struct platform_device *, struct nand_chip *,
> > diff --git a/drivers/mtd/nand/jz4740_nand.c b/drivers/mtd/nand/jz4740_nand.c
> > index 5a99a93..c4fe446 100644
> > --- a/drivers/mtd/nand/jz4740_nand.c
> > +++ b/drivers/mtd/nand/jz4740_nand.c
> > @@ -446,9 +446,6 @@ static int jz_nand_probe(struct platform_device *pdev)
> >   	chip->ecc.bytes		= 9;
> >   	chip->ecc.strength	= 4;
> >
> > -	if (pdata)
> > -		chip->ecc.layout = pdata->ecc_layout;
> > -
> >   	chip->chip_delay = 50;
> >   	chip->cmd_ctrl = jz_nand_cmd_ctrl;
> >   	chip->select_chip = jz_nand_select_chip;
> >
> 
> Is there a typo in this commit title? The JZ4740 and JZ4770 have quite 
> different NAND controller interfaces, so I don't think that the JZ4740 
> driver will support the JZ4770.

Yes, it's a typo, I meant jz4740, I'll fix my commit message
accordingly.

Thanks,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
