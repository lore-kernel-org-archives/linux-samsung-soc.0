From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: Samsung SoC: clksrc-clk: wait for the stable
 SRC/DIV status.
Date: Sat, 31 Jul 2010 15:09:57 +0900
Message-ID: <000101cb3077$0272a3a0$0757eae0$%kim@samsung.com>
References: <1280379947-7362-1-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:56430 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754035Ab0GaGJu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 31 Jul 2010 02:09:50 -0400
Received: from epmmp1 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6E006YDRSCXB70@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 31 Jul 2010 15:09:48 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6E00HZURSCSF@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 31 Jul 2010 15:09:48 +0900 (KST)
In-reply-to: <1280379947-7362-1-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

MyungJoo Ham wrote:
> 
> Many MUX and clock dividers have a status bit so that users can wait
> until the status is stable. When corresponding registers are accessed
> while a clock is not stable, we may suffer from unexpected errors.
> 
> Therefore, we introduce a mechanism to let the operations related with
> updating SRC/DIV registers of clksrc-clk wait for the stabilization:
> clk_set_parent, clk_set_rate.
> 
> In order to use this feature, the definition of clksrc_clk should
> include reg_src_stable or reg_div_stable. With effective rec_src_stable
> values, clk_set_parent returns with a stabilized SRC register and
> with effective rec_div_stable values, clk_set_rate returns with a
> stabilized DIV register. If .reg field is null, its (either SRC or DIV)
> register's status is not checked and returned without waiting; i.e.,
> some MUX/DIV may not need this feature.
> 
> When setting reg_*_stable, .size is used to tell the value of "stable".
> If .size = 0, the stable status is 0 and if .size = 1, the stable status
> is 1.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> --
> v2 changes:
> 	- Wait-for-stable loop is described at an inline function.
> 
> ---
>  arch/arm/plat-samsung/clock-clksrc.c              |   13 +++++++++++++
>  arch/arm/plat-samsung/include/plat/clock-clksrc.h |   10 ++++++++++
>  2 files changed, 23 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/clock-clksrc.c
b/arch/arm/plat-samsung/clock-
> clksrc.c
> index 46d204a..eeaf8f4 100644
> --- a/arch/arm/plat-samsung/clock-clksrc.c
> +++ b/arch/arm/plat-samsung/clock-clksrc.c
> @@ -50,6 +50,14 @@ static unsigned long s3c_getrate_clksrc(struct clk
*clk)
>  	return rate;
>  }
> 
> +static inline void s3c_wait_for_stable(struct clksrc_reg *stable)
> +{
> +	if (stable->reg) {

if (stable == NULL )
return;

> +		do { } while (((__raw_readl(stable->reg) >> stable->shift) &
1)
> +				!= stable->size);

> When setting reg_*_stable, .size is used to tell the value of "stable".
> If .size = 0, the stable status is 0 and if .size = 1, the stable status
> is 1.

Really need stable->size and checking in while loop?
Because the meaning of 'size' used number of bit...
It can be confusing to us...later.

> +	}
> +}
> +
>  static int s3c_setrate_clksrc(struct clk *clk, unsigned long rate)
>  {
>  	struct clksrc_clk *sclk = to_clksrc(clk);
> @@ -68,6 +76,8 @@ static int s3c_setrate_clksrc(struct clk *clk, unsigned
long rate)
>  	val |= (div - 1) << sclk->reg_div.shift;
>  	__raw_writel(val, reg);
> 
> +	s3c_wait_for_stable(&sclk->reg_div_stable);
> +
>  	return 0;
>  }
> 
> @@ -93,6 +103,9 @@ static int s3c_setparent_clksrc(struct clk *clk, struct
clk
> *parent)
>  		clksrc |= src_nr << sclk->reg_src.shift;
> 
>  		__raw_writel(clksrc, sclk->reg_src.reg);
> +
> +		s3c_wait_for_stable(&sclk->reg_src_stable);
> +
>  		return 0;
>  	}
> 
> diff --git a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
b/arch/arm/plat-
> samsung/include/plat/clock-clksrc.h
> index 50a8ca7..282821d 100644
> --- a/arch/arm/plat-samsung/include/plat/clock-clksrc.h
> +++ b/arch/arm/plat-samsung/include/plat/clock-clksrc.h
> @@ -45,6 +45,13 @@ struct clksrc_reg {
>   * @sources: the sources for this clock
>   * @reg_src: the register definition for selecting the clock's source
>   * @reg_div: the register definition for the clock's output divisor
> + * @reg_src_stable: the register definition to probe if reg_src is
> + *    stabilized after the update of reg_src. It is "stabilized" if
> + *    reg[shift] == size. If reg == NULL, this stable reg is not looked
> + *    up. Thus, in S5PV210, size is usually 0.
> + * @reg_div_stable: the register definition to probe if reg_div is
> + *    stabilized after the update of reg_div. Same mechanism with
> + *    reg_src_stable.
>   *
>   * This clock implements the features required by the newer SoCs where
>   * the standard clock block provides an input mux and a post-mux divisor
> @@ -61,6 +68,9 @@ struct clksrc_clk {
> 
>  	struct clksrc_reg	reg_src;
>  	struct clksrc_reg	reg_div;
> +
> +	struct clksrc_reg	reg_src_stable;
> +	struct clksrc_reg	reg_div_stable;
>  };
> 
>  /**
> --


Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
