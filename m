From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ASoC: samsung: odroid: Drop requirement of clocks in the
 sound node
Date: Mon, 7 Aug 2017 20:56:23 +0200
Message-ID: <20170807185623.jwitnpcaay4wrv6a@kozik-lap>
References: <CGME20170804105854epcas2p30ed120bc4bcb51979a880f44ffe3aca6@epcas2p3.samsung.com>
 <1501844297-22842-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38719 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751505AbdHGS41 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Aug 2017 14:56:27 -0400
Content-Disposition: inline
In-Reply-To: <1501844297-22842-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, devicetree@vger.kernel.org, robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, alsa-devel@alsa-project.org

On Fri, Aug 04, 2017 at 12:58:17PM +0200, Sylwester Nawrocki wrote:
> As suggested in reviews the requirement of clocks in the 'sound' node
> is dropped and instead a leaf clock is used to configure frequency
> of the audio root clock PLL. This can work now after the clock tree
> definitions have been updated to allow clock rate setting propagation
> on the path from the I2S controller up to the EPLL.
> 
> This patch also lowers the CODEC master clock frequency so as
> to not exceed the maximum allowed 60 MHz at maximum audio sampling
> rates.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/sound/samsung,odroid.txt   |  6 ---
>  sound/soc/samsung/odroid.c                         | 44 +++++++++++++++-------
>  2 files changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/samsung,odroid.txt b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> index c30934d..625b1b1 100644
> --- a/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> +++ b/Documentation/devicetree/bindings/sound/samsung,odroid.txt
> @@ -7,9 +7,6 @@ Required properties:
>   - model - the user-visible name of this sound complex
>   - clocks - should contain entries matching clock names in the clock-names
>      property
> - - clock-names - should contain following entries:
> -    - "epll" - indicating the EPLL output clock
> -    - "i2s_rclk" - indicating the RCLK (root) clock of the I2S0 controller
>   - samsung,audio-widgets - this property specifies off-codec audio elements
>     like headphones or speakers, for details see widgets.txt
>   - samsung,audio-routing - a list of the connections between audio
> @@ -46,9 +43,6 @@ sound {
>  		"IN1", "Mic Jack",
>  		"Mic Jack", "MICBIAS";
>  
> -	clocks = <&clock CLK_FOUT_EPLL>, <&i2s0 CLK_I2S_RCLK_SRC>;
> -	clock-names = "epll", "sclk_i2s";
> -
>  	cpu {
>  		sound-dai = <&i2s0 0>;
>  	};
> diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
> index 0834319..44b6de5 100644
> --- a/sound/soc/samsung/odroid.c
> +++ b/sound/soc/samsung/odroid.c
> @@ -19,8 +19,8 @@ struct odroid_priv {
>  	struct snd_soc_card card;
>  	struct snd_soc_dai_link dai_link;
>  
> -	struct clk *pll;
> -	struct clk *rclk;
> +	struct clk *clk_i2s_bus;
> +	struct clk *sclk_i2s;
>  };
>  
>  static int odroid_card_startup(struct snd_pcm_substream *substream)
> @@ -58,13 +58,18 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
>  		return -EINVAL;
>  	}
>  
> -	ret = clk_set_rate(priv->pll, pll_freq + 1);
> +	ret = clk_set_rate(priv->clk_i2s_bus, pll_freq / 2 + 1);
>  	if (ret < 0)
>  		return ret;
>  
> -	rclk_freq = params_rate(params) * 256 * 4;
> +	/*
> +	 *  We add 1 to the rclk_freq value in order to avoid too low clock
> +	 *  frequency values due to the EPLL output frequency not being exact
> +	 *  multiple of the audio sampling rate.
> +	 */
> +	rclk_freq = params_rate(params) * 256 + 1;
>  
> -	ret = clk_set_rate(priv->rclk, rclk_freq);
> +	ret = clk_set_rate(priv->sclk_i2s, rclk_freq);
>  	if (ret < 0)
>  		return ret;
>  
> @@ -118,14 +123,6 @@ static int odroid_audio_probe(struct platform_device *pdev)
>  
>  	snd_soc_card_set_drvdata(card, priv);
>  
> -	priv->pll = devm_clk_get(dev, "epll");
> -	if (IS_ERR(priv->pll))
> -		return PTR_ERR(priv->pll);
> -
> -	priv->rclk = devm_clk_get(dev, "i2s_rclk");
> -	if (IS_ERR(priv->rclk))
> -		return PTR_ERR(priv->rclk);
> -
>  	ret = snd_soc_of_parse_card_name(card, "model");
>  	if (ret < 0)
>  		return ret;
> @@ -171,14 +168,31 @@ static int odroid_audio_probe(struct platform_device *pdev)
>  	link->name = "Primary";
>  	link->stream_name = link->name;
>  
> +

One blank line too much but beside that:

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

> +	priv->sclk_i2s = of_clk_get_by_name(link->cpu_of_node, "i2s_opclk1");
> +	if (IS_ERR(priv->sclk_i2s)) {
> +		ret = PTR_ERR(priv->sclk_i2s);
> +		goto err_put_i2s_n;
> +	}
> +
> +	priv->clk_i2s_bus = of_clk_get_by_name(link->cpu_of_node, "iis");
> +	if (IS_ERR(priv->clk_i2s_bus)) {
> +		ret = PTR_ERR(priv->clk_i2s_bus);
> +		goto err_put_sclk;
> +	}
> +
>  	ret = devm_snd_soc_register_card(dev, card);
>  	if (ret < 0) {
>  		dev_err(dev, "snd_soc_register_card() failed: %d\n", ret);
> -		goto err_put_i2s_n;
> +		goto err_put_clk_i2s;
>  	}
>  
>  	return 0;
>  
> +err_put_clk_i2s:
> +	clk_put(priv->clk_i2s_bus);
> +err_put_sclk:
> +	clk_put(priv->sclk_i2s);
>  err_put_i2s_n:
>  	of_node_put(link->cpu_of_node);
>  err_put_codec_n:
> @@ -192,6 +206,8 @@ static int odroid_audio_remove(struct platform_device *pdev)
>  
>  	of_node_put(priv->dai_link.cpu_of_node);
>  	odroid_put_codec_of_nodes(&priv->dai_link);
> +	clk_put(priv->sclk_i2s);
> +	clk_put(priv->clk_i2s_bus);
>  
>  	return 0;
>  }
> -- 
> 1.9.1
> 
