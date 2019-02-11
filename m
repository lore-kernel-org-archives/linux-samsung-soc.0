From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 06/22] ASoC: samsung: i2s: Restore support for the
 secondary PCM
Date: Mon, 11 Feb 2019 14:41:04 +0100
Message-ID: <CAJKOXPfTZ1EGUpL_Zg20iWYJFkoCvEhoQSM=f92N-NJwo1LsNg@mail.gmail.com>
References: <CGME20190207170105epcas1p3d4a1da9ae268f8e95b32fb499e5a1dad@epcas1p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-7-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-7-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch introduces again registration of additional platform device as
> we still need it for registering the secondary dmaengine PCM component.
>
> This patch in most part is a revert of changes done in commit
> be2c92eb64023e ("ASoC: samsung: i2s: Remove virtual device for secondary DAI")
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 52 +++++++++++++++++++++++++++++++++++++----
>  1 file changed, 48 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 4bc3b181f1c2..994dcd4b01fb 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -109,6 +109,7 @@ static DEFINE_SPINLOCK(lock);
>
>  struct samsung_i2s_priv {
>         struct platform_device *pdev;
> +       struct platform_device *pdev_sec;
>
>         /* Spinlock protecting access to the device's registers */
>         spinlock_t spinlock;
> @@ -1312,6 +1313,34 @@ static int i2s_register_clock_provider(struct platform_device *pdev)
>         return ret;
>  }
>
> +/* Create platform device for the secondary PCM */
> +static int i2s_create_secondary_device(struct samsung_i2s_priv *priv)
> +{
> +       struct platform_device *pdev;
> +       int ret;
> +
> +       pdev = platform_device_register_simple("samsung-i2s-sec", -1, NULL, 0);
> +       if (!pdev)
> +               return -ENOMEM;
> +
> +       ret = device_attach(&pdev->dev);
> +       if (ret < 0) {
> +               dev_info(&pdev->dev, "device_attach() failed\n");
> +               return ret;
> +       }
> +
> +       priv->pdev_sec = pdev;
> +
> +       return 0;
> +}
> +
> +static void i2s_delete_secondary_device(struct samsung_i2s_priv *priv)
> +{
> +       if (priv->pdev_sec) {
> +               platform_device_del(priv->pdev_sec);
> +               priv->pdev_sec = NULL;
> +       }
> +}
>  static int samsung_i2s_probe(struct platform_device *pdev)
>  {
>         struct i2s_dai *pri_dai, *sec_dai = NULL;
> @@ -1329,13 +1358,15 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>                 i2s_dai_data = (struct samsung_i2s_dai_data *)
>                                 platform_get_device_id(pdev)->driver_data;
>
> +       /* Nothing to do if it is the secondary device probing */
> +       if (!i2s_dai_data)
> +               return 0;
> +
>         priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
>         quirks = np ? i2s_dai_data->quirks : i2s_pdata->type.quirks;
> -       quirks &= ~(QUIRK_SEC_DAI | QUIRK_SUPPORTS_IDMA);
> -
>         num_dais = (quirks & QUIRK_SEC_DAI) ? 2 : 1;
>         priv->pdev = pdev;
>
> @@ -1425,8 +1456,13 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>                 sec_dai->pri_dai = pri_dai;
>                 pri_dai->sec_dai = sec_dai;
>
> -               ret = samsung_asoc_dma_platform_register(&pdev->dev,
> -                                       sec_dai->filter, "tx-sec", NULL, NULL);
> +               ret = i2s_create_secondary_device(priv);
> +               if (ret < 0)
> +                       goto err_disable_clk;
> +
> +               ret = samsung_asoc_dma_platform_register(&priv->pdev_sec->dev,
> +                                               sec_dai->filter, "tx-sec", NULL,
> +                                               &pdev->dev);
>                 if (ret < 0)
>                         goto err_disable_clk;
>
> @@ -1461,6 +1497,7 @@ static int samsung_i2s_probe(struct platform_device *pdev)
>         pm_runtime_disable(&pdev->dev);
>  err_disable_clk:
>         clk_disable_unprepare(pri_dai->clk);
> +       i2s_delete_secondary_device(priv);
>         return ret;
>  }
>
> @@ -1469,12 +1506,16 @@ static int samsung_i2s_remove(struct platform_device *pdev)
>         struct samsung_i2s_priv *priv = dev_get_drvdata(&pdev->dev);
>         struct i2s_dai *pri_dai = samsung_i2s_get_pri_dai(&pdev->dev);
>
> +       if (!priv)

This is not obvious. Maybe comment that it is secondary device remove()?

> +               return 0;
> +
>         pm_runtime_get_sync(&pdev->dev);
>         pm_runtime_disable(&pdev->dev);
>
>         i2s_unregister_clock_provider(pdev);
>         clk_disable_unprepare(pri_dai->clk);
>         pm_runtime_put_noidle(&pdev->dev);
> +       i2s_delete_secondary_device(priv);
>
>         return 0;
>  }
> @@ -1573,6 +1614,9 @@ static const struct platform_device_id samsung_i2s_driver_ids[] = {
>                 .name           = "samsung-i2s",
>                 .driver_data    = (kernel_ulong_t)&i2sv3_dai_type,
>         },
> +       {

Nit - squash with previous line.

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
