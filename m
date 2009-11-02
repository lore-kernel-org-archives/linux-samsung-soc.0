From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM
	controllers
Date: Mon, 2 Nov 2009 11:17:54 +0000
Message-ID: <20091102111753.GB29351@sirena.org.uk>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com> <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:41066 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754622AbZKBLRu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 06:17:50 -0500
Content-Disposition: inline
In-Reply-To: <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassisinghbrar@gmail.com
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 02, 2009 at 11:09:51AM +0900, jassisinghbrar@gmail.com wrote:

> +static int s3c64xx_dsp_trigger(struct snd_pcm_substream *substream, int cmd,
> +			       struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct s3c_dsp_info *dsp = to_info(rtd->dai->cpu_dai);
> +	unsigned long irqs;
> +
> +	pr_debug("Entered %s\n", __func__);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +		local_irq_save(irqs);

Why local_irq_save()?  On existing uniprocessor systems they should be
equivalent to a regular IRQ save and if there are future multi core
chips using the driver I can't imagine that a local IRQ save will be
enough.

> +	default:
> +		pr_err("Unsupported data format!\n");
> +		return -EINVAL;

Pretty much all the prints in the driver could be dev_ versions.

> +static int s3c64xx_dsp_set_clkdiv(struct snd_soc_dai *cpu_dai,
> +				  int div_id, int div)
> +{
> +	struct s3c_dsp_info *dsp = to_info(cpu_dai);
> +	void __iomem *regs = dsp->regs;
> +	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
> +
> +	pr_debug("%s(%p, %d, %d)\n", __func__, cpu_dai, div_id, div);
> +
> +	switch (div_id) {
> +	case S3C64XX_DSP_SCLK_DIV:
> +		clkctl &= ~(S3C64XX_PCM_CLKCTL_SCLKDIV_MASK
> +				<< S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
> +		clkctl |= ((div & S3C64XX_PCM_CLKCTL_SCLKDIV_MASK)
> +				<< S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
> +		break;
> +
> +	case S3C64XX_DSP_SYNC_DIV:
> +		clkctl &= ~(S3C64XX_PCM_CLKCTL_SYNCDIV_MASK
> +				<< S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
> +		clkctl |= ((div & S3C64XX_PCM_CLKCTL_SYNCDIV_MASK)
> +				<< S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
> +		break;

You should really provide defaults for these - the overwhelming majority
of systems are going to want standard configurations and there's no
point in them all replicating the code to work those out.  Either
provide a function which takes the params and sets things up that
machine drivers can call from their hw_params() or just do that
automatically from the PCM driver hw_params() if the machine driver
didn't explicitly configure anything.

> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
> +
> +	return 0;
> +}
> +
> +static int s3c64xx_dsp_set_sysclk(struct snd_soc_dai *cpu_dai,
> +				  int clk_id, unsigned int freq, int dir)
> +{
> +	struct s3c_dsp_info *dsp = to_info(cpu_dai);
> +	void __iomem *regs = dsp->regs;
> +	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
> +
> +	switch (clk_id) {
> +	case S3C64XX_DSP_CLKSRC_PCLK:
> +		clkctl |= S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK;
> +		break;
> +
> +	case S3C64XX_DSP_CLKSRC_MUX:
> +		clkctl &= ~S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK;
> +
> +		if (clk_get_rate(dsp->pcm_cclk) != freq)
> +			clk_set_rate(dsp->pcm_cclk, freq);
> +
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
> +
> +	return 0;
> +}
> +
> +struct clk *s3c64xx_dsp_get_clock(struct snd_soc_dai *dai)
> +{
> +	struct s3c_dsp_info *dsp = to_info(dai);
> +	void __iomem *regs = dsp->regs;
> +	u32 clkctl = readl(regs + S3C64XX_PCM_CLKCTL);
> +
> +	if (clkctl & S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK)
> +		return dsp->pcm_pclk;
> +	else
> +		return dsp->pcm_cclk;
> +}
> +EXPORT_SYMBOL_GPL(s3c64xx_dsp_get_clock);
> +
> +static int s3c64xx_dsp_probe(struct platform_device *pdev,
> +			     struct snd_soc_dai *dai)
> +{
> +	/* configure GPIO for the PCM controller */
> +	switch (dai->id) {
> +	case 0:
> +		s3c_gpio_cfgpin(S3C64XX_GPD(0), S3C64XX_GPD0_PCM0_SCLK);
> +		s3c_gpio_cfgpin(S3C64XX_GPD(1), S3C64XX_GPD1_PCM0_EXTCLK);
> +		s3c_gpio_cfgpin(S3C64XX_GPD(2), S3C64XX_GPD2_PCM0_FSYNC);
> +		s3c_gpio_cfgpin(S3C64XX_GPD(3), S3C64XX_GPD3_PCM0_SIN);
> +		s3c_gpio_cfgpin(S3C64XX_GPD(4), S3C64XX_GPD4_PCM0_SOUT);
> +		break;
> +	case 1:
> +		s3c_gpio_cfgpin(S3C64XX_GPE(0), S3C64XX_GPE0_PCM1_SCLK);
> +		s3c_gpio_cfgpin(S3C64XX_GPE(1), S3C64XX_GPE1_PCM1_EXTCLK);
> +		s3c_gpio_cfgpin(S3C64XX_GPE(2), S3C64XX_GPE2_PCM1_FSYNC);
> +		s3c_gpio_cfgpin(S3C64XX_GPE(3), S3C64XX_GPE3_PCM1_SIN);
> +		s3c_gpio_cfgpin(S3C64XX_GPE(4), S3C64XX_GPE4_PCM1_SOUT);
> +		break;
> +	default:
> +		printk(KERN_DEBUG "Invalid PCM Controller number!");
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct snd_soc_dai_ops s3c64xx_dsp_dai_ops = {
> +	.set_sysclk	= s3c64xx_dsp_set_sysclk,
> +	.trigger	= s3c64xx_dsp_trigger,
> +	.hw_params	= s3c64xx_dsp_hw_params,
> +	.set_fmt	= s3c64xx_dsp_set_fmt,
> +	.set_clkdiv	= s3c64xx_dsp_set_clkdiv,
> +};
> +
> +#define S3C64XX_DSP_RATES  SNDRV_PCM_RATE_8000_96000
> +
> +#define S3C64XX_DSP_DECLARE(n)			\
> +{								\
> +	.name		 = "s3c64xx-dsp",			\
> +	.id		 = (n),				\
> +	.symmetric_rates = 1,					\
> +	.probe		 = s3c64xx_dsp_probe,			\
> +	.ops = &s3c64xx_dsp_dai_ops,				\
> +	.playback = {						\
> +		.channels_min	= 2,				\
> +		.channels_max	= 2,				\
> +		.rates		= S3C64XX_DSP_RATES,		\
> +		.formats	= SNDRV_PCM_FMTBIT_S16_LE,	\
> +	},							\
> +	.capture = {						\
> +		.channels_min	= 2,				\
> +		.channels_max	= 2,				\
> +		.rates		= S3C64XX_DSP_RATES,		\
> +		.formats	= SNDRV_PCM_FMTBIT_S16_LE,	\
> +	},							\
> +}
> +
> +struct snd_soc_dai s3c64xx_dsp_dai[] = {
> +	S3C64XX_DSP_DECLARE(0),
> +	S3C64XX_DSP_DECLARE(1),
> +};
> +EXPORT_SYMBOL_GPL(s3c64xx_dsp_dai);
> +
> +static int s3c_dsp_probe(struct platform_device *pdev,
> +		    struct snd_soc_dai *dai,
> +		    struct s3c_dsp_info *dsp,
> +		    unsigned long base)
> +{
> +	struct device *dev = &pdev->dev;
> +
> +	dsp->dev = dev;
> +
> +	/* record our dsp structure for later use in the callbacks */
> +	dai->private_data = dsp;
> +
> +	if (!base) {
> +		struct resource *res = platform_get_resource(pdev,
> +							     IORESOURCE_MEM,
> +							     0);
> +		if (!res) {
> +			dev_err(dev, "Unable to get register resource\n");
> +			return -ENXIO;
> +		}
> +
> +		if (!request_mem_region(res->start, resource_size(res),
> +					"s3c64xx-dsp")) {
> +			dev_err(dev, "Unable to request register region\n");
> +			return -EBUSY;
> +		}
> +
> +		base = res->start;
> +	}
> +
> +	dsp->regs = ioremap(base, 0x100);
> +	if (dsp->regs == NULL) {
> +		dev_err(dev, "cannot ioremap registers\n");
> +		return -ENXIO;
> +	}
> +
> +	dsp->pcm_pclk = clk_get(dev, "pcm");
> +	if (IS_ERR(dsp->pcm_pclk)) {
> +		dev_err(dev, "failed to get pcm_clock\n");
> +		iounmap(dsp->regs);
> +		return -ENOENT;
> +	}
> +
> +	clk_enable(dsp->pcm_pclk);
> +
> +	return 0;
> +}
> +
> +static __devinit int s3c64xx_dsp_dev_probe(struct platform_device *pdev)
> +{
> +	struct s3c_dsp_info *dsp;
> +	struct snd_soc_dai *dai;
> +	int ret;
> +
> +	if (pdev->id >= ARRAY_SIZE(s3c64xx_dsp)) {
> +		dev_err(&pdev->dev, "id %d out of range\n", pdev->id);
> +		return -EINVAL;
> +	}
> +
> +	dsp = &s3c64xx_dsp[pdev->id];
> +	dai = &s3c64xx_dsp_dai[pdev->id];
> +	dai->dev = &pdev->dev;
> +
> +	dsp->dma_capture = &s3c64xx_pcm_stereo_in[pdev->id];
> +	dsp->dma_playback = &s3c64xx_pcm_stereo_out[pdev->id];
> +
> +	dsp->pcm_cclk = clk_get(&pdev->dev, "audio-bus");
> +	if (IS_ERR(dsp->pcm_cclk)) {
> +		dev_err(&pdev->dev, "failed to get audio-bus\n");
> +		ret = PTR_ERR(dsp->pcm_cclk);
> +		goto err;
> +	}
> +	clk_enable(dsp->pcm_cclk);
> +
> +	ret = s3c_dsp_probe(pdev, dai, dsp, 0);
> +	if (ret)
> +		goto err_clk;
> +
> +	ret = snd_soc_register_dai(dai);
> +	if (ret != 0)
> +		goto err_dsp;
> +
> +	return 0;
> +
> +err_dsp:
> +	/* Not implemented */
> +err_clk:
> +	clk_put(dsp->pcm_cclk);
> +err:
> +	return ret;
> +}
> +
> +static __devexit int s3c64xx_dsp_dev_remove(struct platform_device *pdev)
> +{
> +	dev_err(&pdev->dev, "Device removal not yet supported\n");
> +	return 0;
> +}
> +
> +static struct platform_driver s3c64xx_dsp_driver = {
> +	.probe  = s3c64xx_dsp_dev_probe,
> +	.remove = s3c64xx_dsp_dev_remove,
> +	.driver = {
> +		.name = "s3c64xx-dsp",
> +		.owner = THIS_MODULE,
> +	},
> +};
> +
> +static int __init s3c64xx_dsp_init(void)
> +{
> +	return platform_driver_register(&s3c64xx_dsp_driver);
> +}
> +module_init(s3c64xx_dsp_init);
> +
> +static void __exit s3c64xx_dsp_exit(void)
> +{
> +	platform_driver_unregister(&s3c64xx_dsp_driver);
> +}
> +module_exit(s3c64xx_dsp_exit);
> +
> +/* Module information */
> +MODULE_AUTHOR("Jaswinder Singh, <jassi.brar@samsung.com>");
> +MODULE_DESCRIPTION("S3C64XX PCM Controller Driver");
> diff --git a/sound/soc/s3c24xx/s3c64xx-dsp.h b/sound/soc/s3c24xx/s3c64xx-dsp.h
> new file mode 100644
> index 0000000..cb92346
> --- /dev/null
> +++ b/sound/soc/s3c24xx/s3c64xx-dsp.h
> @@ -0,0 +1,41 @@
> +/*  sound/soc/s3c24xx/s3c64xx-dsp.h
> + *
> + *  ALSA Soc Audio Layer - S3C64XX PCM Controller driver
> + *
> + *  This program is free software; you can redistribute  it and/or modify it
> + *  under  the terms of  the GNU General  Public License as published by the
> + *  Free Software Foundation;  either version 2 of the  License, or (at your
> + *  option) any later version.
> + */
> +
> +#ifndef __SND_SOC_S3C64XX_PCM_H
> +#define __SND_SOC_S3C64XX_PCM_H __FILE__
> +
> +#define S3C64XX_DSP_CLKSRC_PCLK	0
> +#define S3C64XX_DSP_CLKSRC_MUX	1
> +
> +#define S3C64XX_DSP_SYNC_DIV	0
> +#define S3C64XX_DSP_SCLK_DIV	1
> +
> +/**
> + * struct s3c_dsp_info - S3C PCM Controller information
> + * @dev: The parent device passed to use from the probe.
> + * @regs: The pointer to the device register block.
> + * @dma_playback: DMA information for playback channel.
> + * @dma_capture: DMA information for capture channel.
> + */
> +struct s3c_dsp_info {
> +	struct device	*dev;
> +	void __iomem	*regs;
> +
> +	/* Whether to keep PCMSCLK enabled even when idle(no active xfer) */
> +	unsigned int idleclk;
> +
> +	struct clk	*pcm_pclk;
> +	struct clk	*pcm_cclk;
> +
> +	struct s3c24xx_pcm_dma_params	*dma_playback;
> +	struct s3c24xx_pcm_dma_params	*dma_capture;
> +};
> +
> +#endif /* __SND_SOC_S3C64XX_PCM_H */
> -- 
> 1.6.2.5
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

-- 
"You grabbed my hand and we fell into it, like a daydream - or a fever."
