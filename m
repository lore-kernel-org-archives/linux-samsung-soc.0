From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add sound card driver for Snow board
Date: Tue, 22 Apr 2014 19:17:54 +0530
Message-ID: <CAHbNUh3G5HLaGXddPgjthWTu_VQ95xo=2Lii2BM6iSc-ipnm=w@mail.gmail.com>
References: <1398153834-16199-1-git-send-email-tushar.behera@linaro.org>
	<20140422104447.GK12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <20140422104447.GK12304@sirena.org.uk>
Sender: linux-doc-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-doc@vger.kernel.org, devicetree <devicetree@vger.kernel.org>, rdunlap@infradead.org, "robh+dt@kernel.org" <robh+dt@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 22 April 2014 16:14, Mark Brown <broonie@kernel.org> wrote:
> On Tue, Apr 22, 2014 at 01:33:54PM +0530, Tushar Behera wrote:
>
>> Added machine driver to instantiate I2S based sound card on Snow
>> board. It has MAX98095 audio codec on board.
>
> In general this isn't up to modern standards, please do try to check
> that new code is following best practices.  Did the support for setting
> the clocking up in the device tree get merged already?
>

I didn't get this point. Would you please elaborate?

> Please do also pay attention to the CC lists when posting patches, this
> seems to have been sent to a fairly random selection of people and
> lists.
>

Okay, I will update the CC list as per get_maintainer script during
next revision.

>> +     switch (params_format(params)) {
>
> params_width().
>
>> +     ret = snd_soc_dai_set_fmt(codec_dai, SND_SOC_DAIFMT_I2S |
>> +                                          SND_SOC_DAIFMT_NB_NF |
>> +                                          SND_SOC_DAIFMT_CBS_CFS);
>
> Set this in the dai_link.
>

Ok.

However, setting this in dai_link is not working if I2S is running is
master mode. The bug is with I2S driver as it is setting rclk_srcrate
as 0 during startup. I will fix that in another patch.

>> +     ret = snd_soc_dai_set_sysclk(codec_dai, 0,
>> +                                     FIN_PLL_RATE, SND_SOC_CLOCK_IN);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = snd_soc_dai_set_sysclk(cpu_dai, SAMSUNG_I2S_CDCLK,
>> +                                     0, SND_SOC_CLOCK_OUT);
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = snd_soc_dai_set_clkdiv(cpu_dai, SAMSUNG_I2S_DIV_BCLK, bfs);
>> +     if (ret < 0)
>> +             return ret;
>
> Set this stuff up on probe.  I'm surprised that you need to set BCLK at
> all...
>

Should I create a late_probe call for this (in line with tobermory.c)?

Setting BCLK was an oversight, that is not required. I will remove that.

>> +static int snow_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +     struct snd_soc_codec *codec = rtd->codec;
>> +     struct snd_soc_dapm_context *dapm = &codec->dapm;
>> +
>> +     snd_soc_dapm_sync(dapm);
>> +
>> +     return 0;
>> +}
>
> This does nothing, remove it.
>

Sure.

>> +     if (!pdev->dev.platform_data && !pdev->dev.of_node) {
>> +             dev_err(&pdev->dev, "No platform data supplied\n");
>> +             return -EINVAL;
>> +     }
>> +
>> +     name = of_get_property(pdev->dev.of_node, "card-name", NULL);
>> +     if (name)
>> +             card->name = name;
>> +
>> +     i2s_node = of_parse_phandle(pdev->dev.of_node,
>> +                                 "samsung,i2s-controller", 0);
>> +     if (!i2s_node) {
>> +             dev_err(&pdev->dev,
>> +                     "Property 'i2s-controller' missing or invalid\n");
>> +             return -EINVAL;
>> +     }
>
> You're allowing platform data above but I see DT is mandatory here.
>

I will keep this as DT only, will remove the above check for platform data.

>> +     ret = snd_soc_register_card(card);
>> +     if (ret) {
>> +             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
>> +             return ret;
>> +     }
>
> devm_snd_soc_register_card().

Ok.

Thanks for reviewing.

-- 
Tushar Behera
