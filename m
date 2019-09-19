From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 8/9] ASoC: samsung: arndale: Add missing OF node
 dereferencing
Date: Thu, 19 Sep 2019 10:22:11 +0200
Message-ID: <20190919082211.GF13195@pi3>
References: <20190918104634.15216-1-s.nawrocki@samsung.com>
 <CGME20190918104713eucas1p2ccfa8e9dff2cda9e8f88ac42dda2b680@eucas1p2.samsung.com>
 <20190918104634.15216-9-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190918104634.15216-9-s.nawrocki@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, ckeepax@opensource.cirrus.com, b.zolnierkie@samsung.com, sbkim73@samsung.com, patches@opensource.cirrus.com, lgirdwood@gmail.com, robh+dt@kernel.org, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, m.szyprowski@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Sep 18, 2019 at 12:46:33PM +0200, Sylwester Nawrocki wrote:
> Ensure there is no OF node references kept when the driver is removed/unbound.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/arndale_rt5631.c | 31 ++++++++++++++++++++++++++++--
>  1 file changed, 29 insertions(+), 2 deletions(-)

Wasn't this issue introduced in 5/9? It looks weird to fix it here...

Best regards,
Krzysztof

> 
> diff --git a/sound/soc/samsung/arndale_rt5631.c b/sound/soc/samsung/arndale_rt5631.c
> index 3744c47742b8..d8da313e898a 100644
> --- a/sound/soc/samsung/arndale_rt5631.c
> +++ b/sound/soc/samsung/arndale_rt5631.c
> @@ -132,6 +132,17 @@ static struct snd_soc_card arndale_wm1811 = {
>  	.num_links = ARRAY_SIZE(arndale_wm1811_dai),
>  };
>  
> +static void arndale_put_of_nodes(struct snd_soc_card *card)
> +{
> +	struct snd_soc_dai_link *dai_link;
> +	int i;
> +
> +	for_each_card_prelinks(card, i, dai_link) {
> +		of_node_put(dai_link->cpus->of_node);
> +		of_node_put(dai_link->codecs->of_node);
> +	}
> +}
> +
>  static int arndale_audio_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -156,16 +167,31 @@ static int arndale_audio_probe(struct platform_device *pdev)
>  	if (!dai_link->codecs->of_node) {
>  		dev_err(&pdev->dev,
>  			"Property 'samsung,audio-codec' missing or invalid\n");
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto err_put_of_nodes;
>  	}
>  
>  	ret = devm_snd_soc_register_card(card->dev, card);
> -	if (ret)
> +	if (ret) {
>  		dev_err(&pdev->dev, "snd_soc_register_card() failed: %d\n", ret);
> +		goto err_put_of_nodes;
> +	}
>  
> +	return 0;
> +
> +err_put_of_nodes:
> +	arndale_put_of_nodes(card);
>  	return ret;
>  }
>  
> +static int arndale_audio_remove(struct platform_device *pdev)
> +{
> +	struct snd_soc_card *card = platform_get_drvdata(pdev);
> +
> +	arndale_put_of_nodes(card);
> +	return 0;
> +}
> +
>  static const struct of_device_id arndale_audio_of_match[] __maybe_unused = {
>  	{ .compatible = "samsung,arndale-rt5631",  .data = &arndale_rt5631 },
>  	{ .compatible = "samsung,arndale-alc5631", .data = &arndale_rt5631 },
> @@ -181,6 +207,7 @@ static struct platform_driver arndale_audio_driver = {
>  		.of_match_table = arndale_audio_of_match,
>  	},
>  	.probe = arndale_audio_probe,
> +	.remove = arndale_audio_remove,
>  };
>  
>  module_platform_driver(arndale_audio_driver);
> -- 
> 2.17.1
> 
