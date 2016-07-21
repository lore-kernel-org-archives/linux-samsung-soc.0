From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 4/4] ASoC: samsung: Add machine driver for Exynos5433
 based TM2 board
Date: Thu, 21 Jul 2016 19:28:32 +0900
Message-ID: <5790A3D0.4070500@samsung.com>
References: <CGME20160705171538epcas1p14f034567982b67aad091c50e5adcec9c@epcas1p1.samsung.com>
 <1467738877-31555-1-git-send-email-s.nawrocki@samsung.com>
 <5788721B.7010602@samsung.com> <578CB261.60507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <578CB261.60507@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, robh@kernel.org, alsa-devel@alsa-project.org, devicetree@vger.kernel.org, ideal.song@samsung.com, inki.dae@samsung.com, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Sylwester,

On 2016=EB=85=84 07=EC=9B=94 18=EC=9D=BC 19:41, Sylwester Nawrocki wrot=
e:
> Hi Chanwoo,
>=20
> On 07/15/2016 07:18 AM, Chanwoo Choi wrote:
>>> +static int tm2_probe(struct platform_device *pdev)
>>> +{
>>> +	struct device *dev =3D &pdev->dev;
>=20
>>> +	codec_dai_node =3D of_parse_phandle(dev->of_node, "audio-codec", =
0);
>>> +	if (!codec_dai_node) {
>>> +		dev_err(dev, "audio-codec property invalid or missing\n");
>>> +		ret =3D -EINVAL;
>>> +		goto err_put_cpu_dai;
>>> +	}
>=20
>>> +	priv->codec_mclk1 =3D of_clk_get_by_name(codec_dai_node, "mclk1")=
;
>>> +	if (IS_ERR(priv->codec_mclk1)) {
>>> +		dev_err(dev, "Failed to get mclk1 clock\n");
>>> +		ret =3D PTR_ERR(priv->codec_mclk1);
>>> +		goto err_put_codec_dai;
>>> +	}
>>
>> I think that you better to use the devm_clk_get() instead of of_clk_=
get_by_name()
>> because you don't need to handle the clk_put() when error happen and=
 remove the=20
>> this driver.
>>
>> 	priv->codec_mclk1 =3D devm_clk_get(dev, "mclk1");
>=20
> The clocks are from the CODEC DT node, for which we don't have struct
> device pointer here, that's why I used of_clk_get_by_name().

When I test it, I can get the clock pointer by devm_clk_get() as follow=
ing:

diff --git a/sound/soc/samsung/tm2_wm5110.c b/sound/soc/samsung/tm2_wm5=
110.c
index 9728b3c5927f..5de4fc554aec 100644
--- a/sound/soc/samsung/tm2_wm5110.c
+++ b/sound/soc/samsung/tm2_wm5110.c
@@ -500,7 +500,7 @@ static int tm2_probe(struct platform_device *pdev)
                card->dai_link[i].platform_of_node =3D cpu_dai_node;
        }

-       priv->codec_mclk1 =3D of_clk_get_by_name(codec_dai_node, "mclk1=
");
+       priv->codec_mclk1 =3D devm_clk_get(dev, "mclk1");
        if (IS_ERR(priv->codec_mclk1)) {
                dev_err(dev, "Failed to get mclk1 clock\n");
                ret =3D PTR_ERR(priv->codec_mclk1);
@@ -508,7 +508,7 @@ static int tm2_probe(struct platform_device *pdev)
        }

        /* mclk2 is optional */
-       priv->codec_mclk2 =3D of_clk_get_by_name(codec_dai_node, "mclk2=
");
+       priv->codec_mclk2 =3D devm_clk_get(dev, "mclk2");
        if (IS_ERR(priv->codec_mclk2))
                dev_info(dev, "Not using mclk2 clock\n");

@@ -516,21 +516,17 @@ static int tm2_probe(struct platform_device *pdev=
)
                                tm2_ext_dai, ARRAY_SIZE(tm2_ext_dai));
        if (ret < 0) {
                dev_err(dev, "Failed to register component: %d\n", ret)=
;
-               goto err_put_mclk;
+               goto err_put_codec_dai;
        }

        ret =3D devm_snd_soc_register_card(dev, card);
        if (ret < 0) {
                dev_err(dev, "Failed to register card: %d\n", ret);
-               goto err_put_mclk;
+               goto err_put_codec_dai;
        }

        return 0;

-err_put_mclk:
-       clk_put(priv->codec_mclk1);
-       if (!IS_ERR(priv->codec_mclk2))
-               clk_put(priv->codec_mclk2);
 err_put_codec_dai:
        of_node_put(codec_dai_node);
 err_put_cpu_dai:
@@ -543,11 +539,6 @@ err_put_amp:
 static int tm2_remove(struct platform_device *pdev)
 {
        struct snd_soc_card *card =3D &tm2_card;
-       struct tm2_machine_priv *priv =3D snd_soc_card_get_drvdata(card=
);
-
-       clk_put(priv->codec_mclk1);
-       if (!IS_ERR(priv->codec_mclk2))
-               clk_put(priv->codec_mclk2);


Regards,
Chanwoo Choi
