From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: samsung: ASoC: samsung: Fix IISMOD
 setting in i2s_set_sysclk()
Date: Thu, 20 Nov 2014 11:44:33 +0100
Message-ID: <546DC611.8090806@samsung.com>
References: <1416477797-27332-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:28692 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750979AbaKTKoh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Nov 2014 05:44:37 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFC00ALZ3AY2Q10@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 20 Nov 2014 10:47:22 +0000 (GMT)
In-reply-to: <1416477797-27332-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, alsa-devel@alsa-project.org
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, kgene.kim@samsung.com, broonie@kernel.org

On 20/11/14 11:03, Padmavathi Venna wrote:
> In the i2s_set_sysclk() callback we are currently clearing all bits
> of the IISMOD register in i2s_set_sysclk. It's due to an incorrect
> mask used for the AND operation which is introduced in commit
> a5a56871f804edac93a53b5e871c0e9818fb9033 (ASoC: samsung:
> add support for exynos7 I2S controller) and also adds the missing

The patch looks good to me, I'd just write about the missing break
in a separate sentence, i.e. s/and also adds/. Also add/

> break statement.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  sound/soc/samsung/i2s.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 0df6547..e1ace52 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -494,7 +494,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  		if (dir == SND_SOC_CLOCK_IN)
>  			mod |= 1 << i2s_regs->cdclkcon_off;
>  		else
> -			mod &= 0 << i2s_regs->cdclkcon_off;
> +			mod &= ~(1 << i2s_regs->cdclkcon_off);
>  
>  		i2s->rfs = rfs;
>  		break;
> @@ -551,10 +551,11 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai,
>  		}
>  
>  		if (clk_id == 0)
> -			mod &= 0 << i2s_regs->rclksrc_off;
> +			mod &= ~(1 << i2s_regs->rclksrc_off);
>  		else
>  			mod |= 1 << i2s_regs->rclksrc_off;
>  
> +		break;
>  	default:
>  		dev_err(&i2s->pdev->dev, "We don't serve that!\n");
>  		return -EINVAL;

--
Regards,
Sylwester
