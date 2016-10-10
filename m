From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ASoC: samsung: Minor simplification in i2s_set_fmt()
Date: Mon, 10 Oct 2016 11:05:04 +0200
Message-ID: <8e01225b-3418-cb53-4bf4-8ef15f553577@samsung.com>
References: <CGME20161010020438eucas1p2f24f4419a03de8df4bbd1156d859e1d0@eucas1p2.samsung.com>
 <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:41553 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750919AbcJJJFL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 05:05:11 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OET00K6KQKJ6460@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 10 Oct 2016 10:05:07 +0100 (BST)
In-reply-to: <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, krzk@kernel.org, Michael McConville <mmcco@mykolab.com>

On 10/10/2016 04:04 AM, Tobias Jakobi wrote:
> From: Michael McConville <mmcco@mykolab.com>
> 
> We can replace the if-statement with the simpler bit
> toggle operation.

> Changes in v2:
> - add proper commit header and description

Thanks for the patch. The above 2 lines should be moved past the
scissors "---" line below.

> Signed-off-by: Michael McConville <mmcco@mykolab.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---

>  sound/soc/samsung/i2s.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 50635ee..1c484ac 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -627,10 +627,7 @@ static int i2s_set_fmt(struct snd_soc_dai *dai,
>  	case SND_SOC_DAIFMT_NB_NF:
>  		break;
>  	case SND_SOC_DAIFMT_NB_IF:
> -		if (tmp & lrp_rlow)
> -			tmp &= ~lrp_rlow;
> -		else
> -			tmp |= lrp_rlow;
> +		tmp ^= lrp_rlow;
>  		break;
>  	default:
>  		dev_err(&i2s->pdev->dev, "Polarity not supported\n");
