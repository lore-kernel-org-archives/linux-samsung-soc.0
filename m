From: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/2] ARM: S3C2443: Workaround for 2443 EXTINT error
Date: Mon, 26 Nov 2012 10:12:58 +0100
Message-ID: <201211261012.58938.heiko@sntech.de>
References: <1353919481-26074-1-git-send-email-fenixk19@mail.ru> <1353919481-26074-2-git-send-email-fenixk19@mail.ru>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58807 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754587Ab2KZJNC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 04:13:02 -0500
In-Reply-To: <1353919481-26074-2-git-send-email-fenixk19@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexander Varnin <fenixk19@mail.ru>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org

Hi Alexander,

I think this patch needs a bit more love :-) .

Please run scripts/checkpatch.pl on it and fix all the reported problems.

And I'd change the comment to something like:

/*
 * S3C2443 CPU has a problem with EXTINTn registers.
 * Essentially register-reads return transformed data, but the write
 * is done according to the datasheet.
 *
 * Fix this by transforming the read data to the correct format.
 *
 * For details refer to the document "S3C2443 GUIDE TO EXTRA GPIO"
 */

Especially the mail address does not need to be in the code - the git history 
preserves the committer identity quite well.


Heiko 

Am Montag, 26. November 2012, 09:44:41 schrieb Alexander Varnin:
> S3C2443 CPU has a problem with incorrect reading from EXTINTn
> registers. So s3c_irqext_type function wrongly modifies them.
> So add special check to s3c_irqext_type, to handle this case.
> 
> Signed-off-by: Alexander Varnin <fenixk19@mail.ru>
> ---
>  arch/arm/plat-s3c24xx/irq.c |   26 ++++++++++++++++++++++++++
>  1 files changed, 26 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-s3c24xx/irq.c b/arch/arm/plat-s3c24xx/irq.c
> index fe57bbb..ed19996 100644
> --- a/arch/arm/plat-s3c24xx/irq.c
> +++ b/arch/arm/plat-s3c24xx/irq.c
> @@ -219,6 +219,32 @@ s3c_irqext_type(struct irq_data *data, unsigned int
> type) }
> 
>  	value = __raw_readl(extint_reg);
> +
> +	/*
> +	* S3C2443 CPU has a problem with EXTINTn registers.
> +	* Essentially register-reads returned transformed data, but the write
> +	* is done according to the datasheet.
> +	*
> +	* There is hack introduced for 2443 error workaround.
> +	*
> +	* For detais refer to the document "S3C2443 GUIDE TO EXTRA GPIO" found on
> the web. +	*
> +	* A. Varnin <fenixk19@mail.ru>
> +	*/

> +	if(soc_is_s3c2443())
> +	{
> +	    	int i;
> +		int fixed = 0;
> +		if(extint_reg == S3C24XX_EXTINT1 || extint_reg == S3C24XX_EXTINT2)
> +			for(i=0; i<7;i++)
> +		    		fixed |= (((value >> ((7-i)*4+1)) & 7) | ((value >> ((7-
i)*4-3)) &
> 8)) << i*4; +		else
> +			for(i=0; i<7;i++)
> +		    		fixed |= ( (value >> (7-i)*4) & 0xf )  << i*4;
> +		fixed |= (((value>>1) & 7) | ((value<<3) & 8)) << 27;
> +		value = fixed;
> +	}
> +
>  	value = (value & ~(7 << extint_offset)) | (newvalue << extint_offset);
>  	__raw_writel(value, extint_reg);
