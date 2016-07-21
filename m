From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v4 4/4] ASoC: samsung: Add machine driver
 for Exynos5433 based TM2 board
Date: Thu, 21 Jul 2016 17:12:16 +0200
Message-ID: <5790E650.609@samsung.com>
References: <CGME20160705171538epcas1p14f034567982b67aad091c50e5adcec9c@epcas1p1.samsung.com>
 <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
 <5788721B.7010602@samsung.com> <578CB261.60507@samsung.com>
 <5790A3D0.4070500@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <alsa-devel-bounces@alsa-project.org>
In-reply-to: <5790A3D0.4070500@samsung.com>
List-Unsubscribe: <http://mailman.alsa-project.org/mailman/options/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <http://mailman.alsa-project.org/mailman/listinfo/alsa-devel>,
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: alsa-devel-bounces@alsa-project.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: robh@kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org, inki.dae@samsung.com, devicetree@vger.kernel.org, broonie@kernel.org, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On 07/21/2016 12:28 PM, Chanwoo Choi wrote:
> When I test it, I can get the clock pointer by devm_clk_get() as following:
> 
> diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5110.c
> index 9728b3c5927f..5de4fc554aec 100644
> --- a/sound/soc/samsung/tm2_wm5110.c
> +++ b/sound/soc/samsung/tm2_wm5110.c
> @@ -500,7 +500,7 @@ static int tm2_probe(struct platform_device *pdev)
>                 card->dai_link[i].platform_of_node = cpu_dai_node;
>         }
> 
> -       priv->codec_mclk1 = of_clk_get_by_name(codec_dai_node, "mclk1");
> +       priv->codec_mclk1 = devm_clk_get(dev, "mclk1");

I guess you have and old dts where clock/clock-names are in the sound
node.  Instead the clock/clock-names properties should be specified
in the CODEC's node, the related binding's documentation can be found
in Documentation/devicetree/bindings/mfd/arizona.txt. Also please see
patch 3/4, there is no clock properties in the sound card's DT binding.

--
Thanks,
Sylwester
