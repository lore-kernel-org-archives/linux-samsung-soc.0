From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 15/22] ASoC: samsung: i2s: Move quirks data to common
 driver data structure
Date: Mon, 11 Feb 2019 14:49:34 +0100
Message-ID: <CAJKOXPf1P3zH6b+uRMWEvcPL0K6Ufsgb4S5ZH6ndAHDiDFyiqQ@mail.gmail.com>
References: <CGME20190207170138epcas2p31134b2beee877922d27fab5c79fdc7b1@epcas2p3.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-16-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-16-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> The quirk flags are common for the primary and the secondary DAI
> so move respective field from struct i2s_dai to common driver data
> structure.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/i2s.c | 36 ++++++++++++++----------------------
>  1 file changed, 14 insertions(+), 22 deletions(-)
>
> diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
> index 6ea0f0050fc8..e11d678e9c1f 100644
> --- a/sound/soc/samsung/i2s.c
> +++ b/sound/soc/samsung/i2s.c
> @@ -84,7 +84,6 @@ struct i2s_dai {
>         struct snd_dmaengine_dai_dma_data dma_capture;
>         struct snd_dmaengine_dai_dma_data idma_playback;
>         dma_filter_fn filter;
> -       u32     quirks;
>
>         struct samsung_i2s_priv *priv;
>  };
> @@ -122,19 +121,13 @@ struct samsung_i2s_priv {
>         u32 suspend_i2spsr;
>
>         const struct samsung_i2s_variant_regs *variant_regs;
> +       u32 quirks;
>
>         /* The clock provider's data */
>         struct clk *clk_table[3];
>         struct clk_onecell_data clk_data;
>  };
>
> -struct i2s_dai *samsung_i2s_get_pri_dai(struct device *dev)
> -{
> -       struct samsung_i2s_priv *priv = dev_get_drvdata(dev);
> -
> -       return &priv->dai[SAMSUNG_I2S_ID_PRIMARY - 1];
> -}
> -
>  /* Returns true if this is the 'overlay' stereo DAI */
>  static inline bool is_secondary(struct i2s_dai *i2s)
>  {
> @@ -343,7 +336,7 @@ static inline void set_bfs(struct i2s_dai *i2s, unsigned bfs)
>  {
>         struct samsung_i2s_priv *priv = i2s->priv;
>         u32 mod = readl(priv->addr + I2SMOD);
> -       int tdm = i2s->quirks & QUIRK_SUPPORTS_TDM;
> +       int tdm = priv->quirks & QUIRK_SUPPORTS_TDM;
>         int bfs_shift = priv->variant_regs->bfs_off;
>
>         /* Non-TDM I2S controllers do not support BCLK > 48 * FS */
> @@ -563,7 +556,7 @@ static int i2s_set_sysclk(struct snd_soc_dai *dai, int clk_id, unsigned int rfs,
>         case SAMSUNG_I2S_RCLKSRC_1: /* clock corrsponding to IISMOD[10] := 1 */
>                 mask = 1 << i2s_regs->rclksrc_off;
>
> -               if ((i2s->quirks & QUIRK_NO_MUXPSR)
> +               if ((priv->quirks & QUIRK_NO_MUXPSR)
>                                 || (clk_id == SAMSUNG_I2S_RCLKSRC_0))
>                         clk_id = 0;
>                 else
> @@ -830,8 +823,9 @@ static int i2s_hw_params(struct snd_pcm_substream *substream,
>
>  /* We set constraints on the substream acc to the version of I2S */
>  static int i2s_startup(struct snd_pcm_substream *substream,
> -         struct snd_soc_dai *dai)
> +       struct snd_soc_dai *dai)

This change looks unrelated.

For the rest:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
