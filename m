From: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v2 07/51] mtd: nand: core: use mtd_ooblayout_xxx()
 helpers where appropriate
Date: Fri, 5 Feb 2016 10:31:06 +0100
Message-ID: <20160205103106.53710c48@bbrezillon>
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
	<1454580434-32078-8-git-send-email-boris.brezillon@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:51227 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752324AbcBEJbK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Feb 2016 04:31:10 -0500
In-Reply-To: <1454580434-32078-8-git-send-email-boris.brezillon@free-electrons.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: David Woodhouse <dwmw2@infradead.org>, Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org
Cc: Daniel Mack <daniel@zonque.org>, Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org, Josh Wu <josh.wu@atmel.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, linux-sunxi@googlegroups.com, Stefan Agner <stefan@agner.ch>, Kyungmin Park <kyungmin.park@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org, punnaiah choudary kalluri <punnaia@xilinx.com>, Priit Laes <plaes@plaes.org>

On Thu,  4 Feb 2016 11:06:30 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> The mtd_ooblayout_xxx() helper functions have been added to avoid direct
> accesses to the ecclayout field, and thus ease for future reworks.
> Use these helpers in all places where the oobfree[] and eccpos[] arrays
> where directly accessed.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/nand/nand_base.c | 169 ++++++++++++++++++-------------------------
>  drivers/mtd/nand/nand_bch.c  |   3 +-
>  2 files changed, 74 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 572369d..e01a9b5 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c

[...]

> @@ -4116,7 +4092,6 @@ static bool nand_ecc_strength_good(struct mtd_info *mtd)
>   */
>  int nand_scan_tail(struct mtd_info *mtd)
>  {
> -	int i;
>  	struct nand_chip *chip = mtd_to_nand(mtd);
>  	struct nand_ecc_ctrl *ecc = &chip->ecc;
>  	struct nand_buffers *nbuf;
> @@ -4315,9 +4290,9 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	 * The number of bytes available for a client to place data into
>  	 * the out of band area.
>  	 */
> -	mtd->oobavail = 0;
> -	for (i = 0; ecc->layout->oobfree[i].length; i++)
> -		mtd->oobavail += ecc->layout->oobfree[i].length;
> +	mtd->oobavail = mtd_ooblayout_count_freebytes(mtd);

We should call that after setting the mtd->ecclayout field.

> +	if (mtd->oobavail < 0)
> +		mtd->oobavail = 0;
>  
>  	/* ECC sanity check: warn if it's too weak */
>  	if (!nand_ecc_strength_good(mtd))



-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
