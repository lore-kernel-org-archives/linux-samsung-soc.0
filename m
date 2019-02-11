From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 17/22] ASoC: samsung: odroid: Add support for secondary
 CPU DAI
Date: Mon, 11 Feb 2019 14:57:50 +0100
Message-ID: <CAJKOXPehfWHW+Mj=xZ_N+LA7nLUnOvHAwqEmBECquzVSx1ppPQ@mail.gmail.com>
References: <CGME20190207170145epcas1p465da0715aa629b525c17d263c1b49a68@epcas1p4.samsung.com>
 <20190207170028.720-1-s.nawrocki@samsung.com> <20190207170028.720-18-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190207170028.720-18-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, sbkim73@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 7 Feb 2019 at 18:01, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> This patch adds DPCM links in order to support the secondary I2S interface.
> For the secondary PCM interface to be actually available one more entry
> should be added to the sound-dai property in sound/cpu node in DT.
> The changes in driver are done in a way so we are backwards compatible with
> existing DTS/DTB, i.e. if the cpu sound-dai property contains only one entry
> only one PCM will be registered.
>
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  sound/soc/samsung/odroid.c | 132 +++++++++++++++++++++++++++----------
>  1 file changed, 96 insertions(+), 36 deletions(-)
>
> diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
> index e7b371b07230..bab61e8278a0 100644
> --- a/sound/soc/samsung/odroid.c
> +++ b/sound/soc/samsung/odroid.c
> @@ -7,6 +7,7 @@
>   */
>
>  #include <linux/clk.h>
> +#include <linux/clk-provider.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/module.h>
> @@ -17,21 +18,24 @@
>
>  struct odroid_priv {
>         struct snd_soc_card card;
> -       struct snd_soc_dai_link dai_link;
> -
>         struct clk *clk_i2s_bus;
>         struct clk *sclk_i2s;
>  };
>
> -static int odroid_card_startup(struct snd_pcm_substream *substream)
> +static int odroid_card_fe_startup(struct snd_pcm_substream *substream)
>  {
>         struct snd_pcm_runtime *runtime = substream->runtime;
>
>         snd_pcm_hw_constraint_single(runtime, SNDRV_PCM_HW_PARAM_CHANNELS, 2);
> +
>         return 0;
>  }
>
> -static int odroid_card_hw_params(struct snd_pcm_substream *substream,
> +static const struct snd_soc_ops odroid_card_fe_ops = {
> +       .startup = odroid_card_fe_startup,
> +};
> +
> +static int odroid_card_be_hw_params(struct snd_pcm_substream *substream,
>                                       struct snd_pcm_hw_params *params)
>  {
>         struct snd_soc_pcm_runtime *rtd = substream->private_data;
> @@ -86,19 +90,56 @@ static int odroid_card_hw_params(struct snd_pcm_substream *substream,
>         return 0;
>  }
>
> -static const struct snd_soc_ops odroid_card_ops = {
> -       .startup = odroid_card_startup,
> -       .hw_params = odroid_card_hw_params,
> +static const struct snd_soc_ops odroid_card_be_ops = {
> +       .hw_params = odroid_card_be_hw_params,
> +};
> +
> +static struct snd_soc_dai_link odroid_card_dais[] = {
> +       {
> +               /* Primary FE <-> BE link */
> +               .codec_name = "snd-soc-dummy",
> +               .codec_dai_name = "snd-soc-dummy-dai",
> +               .ops = &odroid_card_fe_ops,
> +               .name = "Primary",
> +               .stream_name = "Primary",
> +               .platform_name = "3830000.i2s",

Why exposing address as platform_name? I think it is not used so how
about some friendlier name?

> +               .dynamic = 1,
> +               .dpcm_playback = 1,
> +       }, {
> +               /* BE <-> CODECs link */
> +               .name = "I2S Mixer",
> +               .cpu_name = "snd-soc-dummy",
> +               .cpu_dai_name = "snd-soc-dummy-dai",
> +               .platform_name = "snd-soc-dummy",
> +               .ops = &odroid_card_be_ops,
> +               .no_pcm = 1,
> +               .dpcm_playback = 1,
> +               .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> +                               SND_SOC_DAIFMT_CBS_CFS,
> +       }, {
> +               /* Secondary FE <-> BE link */
> +               .playback_only = 1,
> +               .codec_name = "snd-soc-dummy",
> +               .codec_dai_name = "snd-soc-dummy-dai",
> +               .ops = &odroid_card_fe_ops,
> +               .name = "Secondary",
> +               .stream_name = "Secondary",
> +               .platform_name = "samsung-i2s-sec",
> +               .dynamic = 1,
> +               .dpcm_playback = 1,
> +       }
>  };
>
> +

Unneeded new line.

Best regards,
Krzysztof
