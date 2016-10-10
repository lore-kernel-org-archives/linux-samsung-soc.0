From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: Minor simplification in i2s_set_fmt()
Date: Mon, 10 Oct 2016 20:05:28 +0300
Message-ID: <20161010170528.GB3352@kozik-lap>
References: <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34348 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752245AbcJJRFl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Oct 2016 13:05:41 -0400
Received: by mail-lf0-f68.google.com with SMTP id p80so11119780lfp.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Oct 2016 10:05:40 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1476065045-13865-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Cc: linux-samsung-soc@vger.kernel.org, krzk@kernel.org, s.nawrocki@samsung.com, Michael McConville <mmcco@mykolab.com>

On Mon, Oct 10, 2016 at 04:04:05AM +0200, Tobias Jakobi wrote:
> From: Michael McConville <mmcco@mykolab.com>
> 
> We can replace the if-statement with the simpler bit
> toggle operation.
> 
> Changes in v2:
> - add proper commit header and description
> 
> Signed-off-by: Michael McConville <mmcco@mykolab.com>
> Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
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

It is late, full day of work... so I might be thinking slowly... but
this does not look like proper replacement. Unless for specific values
used in the driver this works? From mathematical point of view, imagine
tmp=6 abd lrp_rlow=3.

This is not equal...

But... maybe it is late... :)

Krzysztof
