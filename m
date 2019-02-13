From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 18/21] ASoC: samsung: i2s: Comments clean up
Date: Wed, 13 Feb 2019 09:06:25 +0100
Message-ID: <CAJKOXPeSYf8bHNSnpvK1X=cCV=_JxzN_bKdvN9a+RCEqBfK3hQ@mail.gmail.com>
References: <CGME20190212180542epcas2p2f7252babc9b4dc97eaaa214658afe5d0@epcas2p2.samsung.com>
 <20190212180342.32040-1-s.nawrocki@samsung.com> <20190212180342.32040-19-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190212180342.32040-19-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 12 Feb 2019 at 19:05, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> Spelling error fixes, upper/lower case letter changes.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index debeaf51cc7e..77c0f70beab1 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -1,5 +1,4 @@
> -/* sound/soc/samsung/i2s.c
> - *
> +/*
>   * ALSA SoC Audio Layer - Samsung I2S Controller driver
>   *
>   * Copyright (c) 2010 Samsung Electronics Co. Ltd.
> @@ -61,10 +60,10 @@ struct i2s_dai {
>         /* Platform device for this DAI */
>         struct platform_device *pdev;
>
> -       /* Frame Clock */
> +       /* Frame clock */
>         unsigned frmclk;
>         /*
> -        * Specifically requested RCLK,BCLK by MACHINE Driver.
> +        * Specifically requested RCLK, BCLK by machine driver.
>          * 0 indicates CPU driver is free to choose any value.
>          */
>         unsigned rfs, bfs;
> @@ -72,8 +71,9 @@ struct i2s_dai {
>         struct i2s_dai *pri_dai;
>         /* Pointer to the Secondary_Fifo if it has one, NULL otherwise */
>         struct i2s_dai *sec_dai;
> -#define DAI_OPENED     (1 << 0) /* Dai is opened */
> -#define DAI_MANAGER    (1 << 1) /* Dai is the manager */
> +
> +#define DAI_OPENED     (1 << 0) /* DAI is opened */
> +#define DAI_MANAGER    (1 << 1) /* DAI is the manager */
>         unsigned mode;
>
>         /* Driver for this DAI */
> @@ -98,7 +98,7 @@ struct samsung_i2s_priv {
>         /* Spinlock protecting access to the device's registers */
>         spinlock_t lock;
>
> -       /* Lock for cross i/f checks */
> +       /* Lock for cross interface checks */
>         spinlock_t pcm_lock;
>
>         /* CPU DAIs and their corresponding drivers */
> @@ -309,7 +309,7 @@ static inline void set_rfs(struct i2s_dai *i2s, unsigned rfs)
>         writel(mod, priv->addr + I2SMOD);
>  }
>
> -/* Read Bit-Clock of I2S (in multiples of LRCLK) */
> +/* Read bit-clock of I2S (in multiples of LRCLK) */
>  static inline unsigned get_bfs(struct i2s_dai *i2s)
>  {
>         struct samsung_i2s_priv *priv = i2s->priv;
> @@ -331,7 +331,7 @@ static inline unsigned get_bfs(struct i2s_dai *i2s)
>         }
>  }
>
> -/* Write Bit-Clock of I2S (in multiples of LRCLK) */
> +/* Write bit-clock of I2S (in multiples of LRCLK) */
>  static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
>  {
>         struct samsung_i2s_priv *priv = i2s->priv;
> @@ -383,7 +383,7 @@ static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
>         writel(mod, priv->addr + I2SMOD);
>  }
>
> -/* Sample-Size */
> +/* Sample size */
>  static inline int get_blc(struct i2s_dai *i2s)
>  {
>         int blc = readl(i2s->priv->addr + I2SMOD);
> @@ -397,7 +397,7 @@ static inline int get_blc(struct i2s_dai *i2s)
>         }
>  }
>
> -/* TX Channel Control */
> +/* TX channel control */
>  static void i2s_txctrl(struct i2s_dai *i2s, int on)
>  {
>         struct samsung_i2s_priv *priv = i2s->priv;
> @@ -742,7 +742,7 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>         switch (params_channels(params)) {
>         case 6:
>                 val |= MOD_DC2_EN;
> -               /* fall through */
> +               /* Fall through */

Just to be sure - did you check whether this passes GCC
-Wimplicit-fallthrough=3 (you need GCC v7)? It looks correct - like
one of accepted patterns
(https://gcc.gnu.org/onlinedocs/gcc/Warning-Options.html).

Rest looks good so:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
