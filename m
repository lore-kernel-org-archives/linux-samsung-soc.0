From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V3 6/7] ASoC: Samsung: wm8994: Register the osc clock.
Date: Wed, 07 Aug 2013 17:18:10 +0200
Message-ID: <1445367.zmBep3Ocuo@amdc1227>
References: <1375866616-5541-1-git-send-email-padma.v@samsung.com>
 <1375866616-5541-7-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41323 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223Ab3HGPSN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Aug 2013 11:18:13 -0400
In-reply-to: <1375866616-5541-7-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.kvr@gmail.com, broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

On Wednesday 07 of August 2013 14:40:15 Padmavathi Venna wrote:
> This patch registers the 16MHz oscillator clock as fixed clk.
> 
> Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
> ---
>  sound/soc/samsung/smdk_wm8994.c |   12 ++++++++++++
>  1 files changed, 12 insertions(+), 0 deletions(-)
> 
> diff --git a/sound/soc/samsung/smdk_wm8994.c
> b/sound/soc/samsung/smdk_wm8994.c index 581ea4a..a6edded 100644
> --- a/sound/soc/samsung/smdk_wm8994.c
> +++ b/sound/soc/samsung/smdk_wm8994.c
> @@ -9,6 +9,7 @@
> 
>  #include "../codecs/wm8994.h"
>  #include <sound/pcm_params.h>
> +#include <linux/clk-provider.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> 
> @@ -37,6 +38,15 @@
>  /* SMDK has a 16.934MHZ crystal attached to WM8994 */
>  #define SMDK_WM8994_FREQ 16934000
> 
> +/* 16.9MHz fixed oscillator clock */
> +static void init_osc_clock(void)
> +{
> +	struct device_node *np;
> +
> +	np = of_find_compatible_node(NULL, NULL, "osc3_clk16mhz");
> +	of_fixed_clk_setup(np);
> +}
> +
>  static int smdk_hw_params(struct snd_pcm_substream *substream,
>  	struct snd_pcm_hw_params *params)
>  {
> @@ -173,6 +183,8 @@ static int smdk_audio_probe(struct platform_device
> *pdev) smdk_dai[0].platform_of_node = smdk_dai[0].cpu_of_node;
>  	}
> 
> +	init_osc_clock();
> +
>  	ret = snd_soc_register_card(card);
> 
>  	if (ret)

I don't think this patch is needed at all. You can use generic fixed rate 
clock bindings[1] to define a fixed rate clock using device tree.

Best regards,
Tomasz

[1] - Documentation/devicetree/bindings/clock/fixed-clock.txt
