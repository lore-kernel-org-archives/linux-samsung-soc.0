From: Inha Song <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [alsa-devel] [PATCH v3 1/4] ASoC: samsung: Add machine driver for
 Trats2
Date: Fri, 23 Jan 2015 09:56:55 +0900
Message-ID: <20150123095655.15779875@songinha-Samsung-DeskTop-System>
References: <1421925482-15861-1-git-send-email-ideal.song@samsung.com>
 <1421925482-15861-2-git-send-email-ideal.song@samsung.com>
 <54C0EA03.703@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <54C0EA03.703-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, pawel.moll-5wv7dgnIgG8@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org, galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, sbkim73-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, perex-/Fr2/VpizcU@public.gmane.org, tiwai-l3A5Bk7waGM@public.gmane.org, grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi,
Thanks for your review.

On Thu, 22 Jan 2015 13:16:03 +0100
Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:

> On 22/01/15 12:17, Inha Song wrote:
> > diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
> > index fc67f97..8031423 100644
> > --- a/sound/soc/samsung/Kconfig
> > +++ b/sound/soc/samsung/Kconfig
> > @@ -245,3 +245,11 @@ config SND_SOC_ARNDALE_RT5631_ALC5631
> >          depends on SND_SOC_SAMSUNG
> >          select SND_SAMSUNG_I2S
> >          select SND_SOC_RT5631
> > +
> > +config SND_SOC_SAMSUNG_TRATS2_WM1811
> > +	tristate "SoC I2S Audio support for WM1811 on Tizen Trats2 board"
> > +	depends on SND_SOC_SAMSUNG
> > +	select SND_SOC_WM8994
> > +	select SND_SAMSUNG_I2S
> 
> Shouldn't you also select the MFD part of WM8994 here ?
Maybe, I will add also "select MFD_WM8994"

> 
> > +++ b/sound/soc/samsung/trats2_wm1811.c
> > @@ -0,0 +1,218 @@
> 
> > +static struct snd_soc_dai_link trats2_dai[] = {
> > +	{
> > +		.name		= "WM1811 AIF1",
> > +		.stream_name	= "Pri_Dai",
> 
> Could we have a less cryptic name here, e.g. "HiFi Primary" ?

Looks like "HiFi Primary", I will fix.

> 
> > +		.codec_dai_name = "wm8994-aif1",
> > +		.codec_name	= "wm8994-codec",
> > +		.ops		= &trats2_aif1_ops,
> > +		.dai_fmt	= SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
> > +				  SND_SOC_DAIFMT_CBM_CFM,
> > +	},
> > +};
> 
> > +static int trats2_audio_probe(struct platform_device *pdev)
> > +{
> > +	struct device_node *np = pdev->dev.of_node;
> > +	struct snd_soc_card *card = &trats2_card;
> > +	struct device_node *codec_node;
> > +	struct snd_soc_dai_link *dai_link = card->dai_link;
> > +	struct trats2_machine_priv *priv = snd_soc_card_get_drvdata(card);
> > +	int ret;
> > +
> > +	if (!np) {
> > +		dev_err(&pdev->dev, "of node is missing.\n");
> > +		return -ENODEV;
> 
> I'd say this whole np test could be dropped, we will fail right below
> at the snd_soc_of_parse_card_name() function call if np is NULL.
> Such a situation seems highly unlikely anyway.
I will remove :)

> 
> > +	}
> > +
> > +	card->dev = &pdev->dev;
> > +
> > +	ret = snd_soc_of_parse_card_name(card, "samsung,model");
> > +	if (ret) {
> > +		dev_err(&pdev->dev,
> > +			"Card name is not provided\n");
> 
> I guess it would fit in a single line.
Oh, Thanks.

> 
> > +		return ret;
> > +	}
> > +
> 
> > +static struct platform_driver trats2_audio_driver = {
> > +	.driver = {
> > +		.name		= "trats2-audio",
> > +		.owner		= THIS_MODULE,
> 
> You can drop this .owner field assignment, it's also done in
> module_platform_driver() macro.
> 
Yes, I will fix based on your comments :)
Thanks,

Best Regards,
Inha Song.

> > +		.pm		= &snd_soc_pm_ops,
> > +		.of_match_table	= trats2_audio_of_match,
> > +	},
> > +	.probe	= trats2_audio_probe,
> > +	.remove	= trats2_audio_remove,
> > +};
> > +
> > +module_platform_driver(trats2_audio_driver);
> 
> --
> Regards,
> Sylwester
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
