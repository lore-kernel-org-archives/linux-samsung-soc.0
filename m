From: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [PATCH v2 05/51] mtd: add mtd_ooblayout_xxx()
 helper functions
Date: Fri, 5 Feb 2016 10:27:10 +0100
Message-ID: <20160205102710.39fa4244@bbrezillon>
References: <1454580434-32078-1-git-send-email-boris.brezillon@free-electrons.com>
	<1454580434-32078-6-git-send-email-boris.brezillon@free-electrons.com>
Reply-To: boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-sunxi+bncBCIPJ6FA2QLBB4OV2G2QKGQEEB4VB7A-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
In-Reply-To: <1454580434-32078-6-git-send-email-boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
List-Post: <https://groups.google.com/group/linux-sunxi/post>, <mailto:linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:linux-sunxi+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/linux-sunxi
Sender: linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
List-Subscribe: <https://groups.google.com/group/linux-sunxi/subscribe>, <mailto:linux-sunxi+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+1076902468213+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/linux-sunxi/subscribe>
To: David Woodhouse <dwmw2-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org>, Brian Norris <computersforpeace-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-mtd-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: Daniel Mack <daniel-cYrQPVfZoowdnm+yROfE0A@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Robert Jarzmik <robert.jarzmik-GANU6spQydw@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ralf Baechle <ralf-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org>, linux-mips-6z/3iImG2C8G8FEW9MqTrA@public.gmane.org, Josh Wu <josh.wu-AIFe0yeh4nAAvxtiuMwx3w@public.gmane.org>, Ezequiel Garcia <ezequiel.garcia-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Maxime Ripard <maxime.ripard-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Chen-Yu Tsai <wens-jdAy2FN1RRM@public.gmane.org>, linux-sunxi-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, Kyungmin Park <kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, punnaiah choudary kalluri <punnaia-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Priit Laes <plaes-q/aMd4JkU83YtjvyW6yDsg@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu,  4 Feb 2016 11:06:28 +0100
Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org> wrote:

> In order to make the ecclayout definition completely dynamic we need to
> rework the way the OOB layout are defined and iterated.
> 
> Create a few mtd_ooblayout_xxx() helpers to ease OOB bytes manipulation
> and hide ecclayout internals to their users.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
> ---
>  drivers/mtd/mtdcore.c   | 401 ++++++++++++++++++++++++++++++++++++++++++++++++
>  include/linux/mtd/mtd.h |  33 ++++
>  2 files changed, 434 insertions(+)
> 
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 3096251..14e46ca 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -997,6 +997,407 @@ int mtd_read_oob(struct mtd_info *mtd, loff_t from, struct mtd_oob_ops *ops)
>  }
>  EXPORT_SYMBOL_GPL(mtd_read_oob);
>  
> +/**
> + * mtd_ooblayout_ecc - Get the OOB region definition of a specific ECC section
> + * @mtd: MTD device structure
> + * @section: ECC section. Depending on the layout you may have all the ECC
> + *	     bytes stored in a single contiguous section, or one section
> + *	     per ECC chunk (and sometime several sections for a single ECC
> + *	     ECC chunk)
> + * @oobecc: OOB region struct filled with the appropriate ECC position
> + *	    information
> + *
> + * This functions return ECC section information in the OOB area. I you want
> + * to get all the ECC bytes information, then you should call
> + * mtd_ooblayout_ecc(mtd, section++, oobecc) until it returns -ERANGE.
> + *
> + * Returns zero on success, a negative error code otherwise.
> + */
> +int mtd_ooblayout_ecc(struct mtd_info *mtd, int section,
> +		      struct mtd_oob_region *oobecc)
> +{
> +	int eccbyte = 0, cursection = 0, length = 0, eccpos = 0;
> +
> +	memset(oobecc, 0, sizeof(*oobecc));
> +
> +	if (!mtd || section < 0)
> +		return -EINVAL;
> +
> +	if (!mtd->ecclayout)
> +		return -ENOTSUPP;
> +
> +	if (mtd->ecclayout->eccbytes < 1)
> +		return -ERANGE;
> +
> +	/*
> +	 * This logic allows us to reuse the ->ecclayout information and
> +	 * expose them as ECC regions (as done for the OOB free regions).
> +	 *
> +	 * TODO: this should be dropped as soon as we get rid of the
> +	 * ->ecclayout field.
> +	 */
> +	for (eccbyte = 0; eccbyte < mtd->ecclayout->eccbytes; eccbyte++) {
> +		eccpos = mtd->ecclayout->eccpos[eccbyte];
> +
> +		if (eccbyte < mtd->ecclayout->eccbytes - 1) {
> +			int neccpos = mtd->ecclayout->eccpos[eccbyte + 1];
> +
> +			if (eccpos + 1 == neccpos) {
> +				length++;
> +				continue;
> +			}
> +		}
> +
> +		if (section == cursection)
> +			break;
> +
> +		length = 0;
> +		cursection++;
> +	}
> +
> +	if (cursection != section)

Should be
	if (cursection != section ||
	    eccbyte >= mtd->ecclayout->eccbytes)

Will fix that too.

> +		return -ERANGE;
> +
> +	oobecc->length = length + 1;
> +	oobecc->offset = eccpos - length;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtd_ooblayout_ecc);


-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
