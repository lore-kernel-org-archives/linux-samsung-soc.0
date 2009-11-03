From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 4/4] S3C64XX DSP: Added the CPU driver for PCM controllers
Date: Tue, 3 Nov 2009 11:42:21 +0900
Message-ID: <1b68c6790911021842s47de7fbdtfec7831b837a98dd@mail.gmail.com>
References: <1257127791-5595-1-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-2-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-3-git-send-email-jassisinghbrar@gmail.com>
	 <1257127791-5595-4-git-send-email-jassisinghbrar@gmail.com>
	 <20091102111753.GB29351@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f179.google.com ([209.85.216.179]:42832 "EHLO
	mail-px0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756392AbZKCCmR convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2009 21:42:17 -0500
Received: by pxi9 with SMTP id 9so3600672pxi.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2009 18:42:21 -0800 (PST)
In-Reply-To: <20091102111753.GB29351@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Mon, Nov 2, 2009 at 8:17 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Mon, Nov 02, 2009 at 11:09:51AM +0900, jassisinghbrar@gmail.com wr=
ote:
>
>> +static int s3c64xx_dsp_trigger(struct snd_pcm_substream *substream,=
 int cmd,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_dai *dai)
>> +{
>> + =C2=A0 =C2=A0 struct snd_soc_pcm_runtime *rtd =3D substream->priva=
te_data;
>> + =C2=A0 =C2=A0 struct s3c_dsp_info *dsp =3D to_info(rtd->dai->cpu_d=
ai);
>> + =C2=A0 =C2=A0 unsigned long irqs;
>> +
>> + =C2=A0 =C2=A0 pr_debug("Entered %s\n", __func__);
>> +
>> + =C2=A0 =C2=A0 switch (cmd) {
>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_START:
>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_RESUME:
>> + =C2=A0 =C2=A0 case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 local_irq_save(irqs);
>
> Why local_irq_save()? =C2=A0On existing uniprocessor systems they sho=
uld be
> equivalent to a regular IRQ save and if there are future multi core
> chips using the driver I can't imagine that a local IRQ save will be
> enough.
Don't we need to protect critical mode change in PCM control register?
Since the s3c64xx_dsp_snd_tx/rxctrl is small and non-blocking, I think
protection by simply enabling/disabling IRQs should be fine.

>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pr_err("Unsupported data=
 format!\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>
> Pretty much all the prints in the driver could be dev_ versions.
okay, will change it.

>> +static int s3c64xx_dsp_set_clkdiv(struct snd_soc_dai *cpu_dai,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int div_id, int div)
>> +{
>> + =C2=A0 =C2=A0 struct s3c_dsp_info *dsp =3D to_info(cpu_dai);
>> + =C2=A0 =C2=A0 void __iomem *regs =3D dsp->regs;
>> + =C2=A0 =C2=A0 u32 clkctl =3D readl(regs + S3C64XX_PCM_CLKCTL);
>> +
>> + =C2=A0 =C2=A0 pr_debug("%s(%p, %d, %d)\n", __func__, cpu_dai, div_=
id, div);
>> +
>> + =C2=A0 =C2=A0 switch (div_id) {
>> + =C2=A0 =C2=A0 case S3C64XX_DSP_SCLK_DIV:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl &=3D ~(S3C64XX_PC=
M_CLKCTL_SCLKDIV_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 << S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl |=3D ((div & S3C6=
4XX_PCM_CLKCTL_SCLKDIV_MASK)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 << S3C64XX_PCM_CLKCTL_SCLKDIV_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> +
>> + =C2=A0 =C2=A0 case S3C64XX_DSP_SYNC_DIV:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl &=3D ~(S3C64XX_PC=
M_CLKCTL_SYNCDIV_MASK
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 << S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl |=3D ((div & S3C6=
4XX_PCM_CLKCTL_SYNCDIV_MASK)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 << S3C64XX_PCM_CLKCTL_SYNCDIV_SHIFT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>
> You should really provide defaults for these - the overwhelming major=
ity
> of systems are going to want standard configurations and there's no
> point in them all replicating the code to work those out. =C2=A0Eithe=
r
> provide a function which takes the params and sets things up that
> machine drivers can call from their hw_params() or just do that
> automatically from the PCM driver hw_params() if the machine driver
> didn't explicitly configure anything.
okay, will change it

>> +
>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static int s3c64xx_dsp_set_sysclk(struct snd_soc_dai *cpu_dai,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int clk_id, unsigned int freq, i=
nt dir)
>> +{
>> + =C2=A0 =C2=A0 struct s3c_dsp_info *dsp =3D to_info(cpu_dai);
>> + =C2=A0 =C2=A0 void __iomem *regs =3D dsp->regs;
>> + =C2=A0 =C2=A0 u32 clkctl =3D readl(regs + S3C64XX_PCM_CLKCTL);
>> +
>> + =C2=A0 =C2=A0 switch (clk_id) {
>> + =C2=A0 =C2=A0 case S3C64XX_DSP_CLKSRC_PCLK:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl |=3D S3C64XX_PCM_=
CLKCTL_SERCLKSEL_PCLK;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> +
>> + =C2=A0 =C2=A0 case S3C64XX_DSP_CLKSRC_MUX:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 clkctl &=3D ~S3C64XX_PCM=
_CLKCTL_SERCLKSEL_PCLK;
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (clk_get_rate(dsp->pc=
m_cclk) !=3D freq)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 clk_set_rate(dsp->pcm_cclk, freq);
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> +
>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 writel(clkctl, regs + S3C64XX_PCM_CLKCTL);
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +struct clk *s3c64xx_dsp_get_clock(struct snd_soc_dai *dai)
>> +{
>> + =C2=A0 =C2=A0 struct s3c_dsp_info *dsp =3D to_info(dai);
>> + =C2=A0 =C2=A0 void __iomem *regs =3D dsp->regs;
>> + =C2=A0 =C2=A0 u32 clkctl =3D readl(regs + S3C64XX_PCM_CLKCTL);
>> +
>> + =C2=A0 =C2=A0 if (clkctl & S3C64XX_PCM_CLKCTL_SERCLKSEL_PCLK)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dsp->pcm_pclk;
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dsp->pcm_cclk;
>> +}
>> +EXPORT_SYMBOL_GPL(s3c64xx_dsp_get_clock);
>> +
>> +static int s3c64xx_dsp_probe(struct platform_device *pdev,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0struct snd_soc_dai *dai)
>> +{
>> + =C2=A0 =C2=A0 /* configure GPIO for the PCM controller */
>> + =C2=A0 =C2=A0 switch (dai->id) {
>> + =C2=A0 =C2=A0 case 0:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPD(0), S3C64XX_GPD0_PCM0_SCLK);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPD(1), S3C64XX_GPD1_PCM0_EXTCLK);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPD(2), S3C64XX_GPD2_PCM0_FSYNC);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPD(3), S3C64XX_GPD3_PCM0_SIN);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPD(4), S3C64XX_GPD4_PCM0_SOUT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> + =C2=A0 =C2=A0 case 1:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPE(0), S3C64XX_GPE0_PCM1_SCLK);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPE(1), S3C64XX_GPE1_PCM1_EXTCLK);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPE(2), S3C64XX_GPE2_PCM1_FSYNC);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPE(3), S3C64XX_GPE3_PCM1_SIN);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S3C64XX_=
GPE(4), S3C64XX_GPE4_PCM1_SOUT);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> + =C2=A0 =C2=A0 default:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG "Inval=
id PCM Controller number!");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static struct snd_soc_dai_ops s3c64xx_dsp_dai_ops =3D {
>> + =C2=A0 =C2=A0 .set_sysclk =C2=A0 =C2=A0 =3D s3c64xx_dsp_set_sysclk=
,
>> + =C2=A0 =C2=A0 .trigger =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c64xx_dsp_=
trigger,
>> + =C2=A0 =C2=A0 .hw_params =C2=A0 =C2=A0 =C2=A0=3D s3c64xx_dsp_hw_pa=
rams,
>> + =C2=A0 =C2=A0 .set_fmt =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D s3c64xx_dsp_=
set_fmt,
>> + =C2=A0 =C2=A0 .set_clkdiv =C2=A0 =C2=A0 =3D s3c64xx_dsp_set_clkdiv=
,
>> +};
>> +
>> +#define S3C64XX_DSP_RATES =C2=A0SNDRV_PCM_RATE_8000_96000
>> +
>> +#define S3C64XX_DSP_DECLARE(n) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> +{ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D "=
s3c64xx-dsp", =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D (n), =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 .symmetric_rates =3D 1, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s3c64x=
x_dsp_probe, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \
>> + =C2=A0 =C2=A0 .ops =3D &s3c64xx_dsp_dai_ops, =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\
>> + =C2=A0 =C2=A0 .playback =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_min =C2=A0 =3D=
 2, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_max =C2=A0 =3D=
 2, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rates =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D S3C64XX_DSP_RATES, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D SNDRV_PCM_FMTBIT_S16_LE, =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 .capture =3D { =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_min =C2=A0 =3D=
 2, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .channels_max =C2=A0 =3D=
 2, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .rates =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0=3D S3C64XX_DSP_RATES, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0\
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .formats =C2=A0 =C2=A0 =C2=
=A0 =C2=A0=3D SNDRV_PCM_FMTBIT_S16_LE, =C2=A0 =C2=A0 =C2=A0\
>> + =C2=A0 =C2=A0 }, =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\
>> +}
>> +
>> +struct snd_soc_dai s3c64xx_dsp_dai[] =3D {
>> + =C2=A0 =C2=A0 S3C64XX_DSP_DECLARE(0),
>> + =C2=A0 =C2=A0 S3C64XX_DSP_DECLARE(1),
>> +};
>> +EXPORT_SYMBOL_GPL(s3c64xx_dsp_dai);
>> +
>> +static int s3c_dsp_probe(struct platform_device *pdev,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct snd=
_soc_dai *dai,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct s3c=
_dsp_info *dsp,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned l=
ong base)
>> +{
>> + =C2=A0 =C2=A0 struct device *dev =3D &pdev->dev;
>> +
>> + =C2=A0 =C2=A0 dsp->dev =3D dev;
>> +
>> + =C2=A0 =C2=A0 /* record our dsp structure for later use in the cal=
lbacks */
>> + =C2=A0 =C2=A0 dai->private_data =3D dsp;
>> +
>> + =C2=A0 =C2=A0 if (!base) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource *res =3D=
 platform_get_resource(pdev,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0IORESOUR=
CE_MEM,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!res) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_err(dev, "Unable to get register resource\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -ENXIO;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!request_mem_region(=
res->start, resource_size(res),
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 "s3c64xx-ds=
p")) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 dev_err(dev, "Unable to request register region\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 return -EBUSY;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 base =3D res->start;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 dsp->regs =3D ioremap(base, 0x100);
>> + =C2=A0 =C2=A0 if (dsp->regs =3D=3D NULL) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, "cannot ior=
emap registers\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 dsp->pcm_pclk =3D clk_get(dev, "pcm");
>> + =C2=A0 =C2=A0 if (IS_ERR(dsp->pcm_pclk)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, "failed to =
get pcm_clock\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 iounmap(dsp->regs);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOENT;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 clk_enable(dsp->pcm_pclk);
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static __devinit int s3c64xx_dsp_dev_probe(struct platform_device *=
pdev)
>> +{
>> + =C2=A0 =C2=A0 struct s3c_dsp_info *dsp;
>> + =C2=A0 =C2=A0 struct snd_soc_dai *dai;
>> + =C2=A0 =C2=A0 int ret;
>> +
>> + =C2=A0 =C2=A0 if (pdev->id >=3D ARRAY_SIZE(s3c64xx_dsp)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "id =
%d out of range\n", pdev->id);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 }
>> +
>> + =C2=A0 =C2=A0 dsp =3D &s3c64xx_dsp[pdev->id];
>> + =C2=A0 =C2=A0 dai =3D &s3c64xx_dsp_dai[pdev->id];
>> + =C2=A0 =C2=A0 dai->dev =3D &pdev->dev;
>> +
>> + =C2=A0 =C2=A0 dsp->dma_capture =3D &s3c64xx_pcm_stereo_in[pdev->id=
];
>> + =C2=A0 =C2=A0 dsp->dma_playback =3D &s3c64xx_pcm_stereo_out[pdev->=
id];
>> +
>> + =C2=A0 =C2=A0 dsp->pcm_cclk =3D clk_get(&pdev->dev, "audio-bus");
>> + =C2=A0 =C2=A0 if (IS_ERR(dsp->pcm_cclk)) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev, "fai=
led to get audio-bus\n");
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(dsp->pcm=
_cclk);
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err;
>> + =C2=A0 =C2=A0 }
>> + =C2=A0 =C2=A0 clk_enable(dsp->pcm_cclk);
>> +
>> + =C2=A0 =C2=A0 ret =3D s3c_dsp_probe(pdev, dai, dsp, 0);
>> + =C2=A0 =C2=A0 if (ret)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_clk;
>> +
>> + =C2=A0 =C2=A0 ret =3D snd_soc_register_dai(dai);
>> + =C2=A0 =C2=A0 if (ret !=3D 0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_dsp;
>> +
>> + =C2=A0 =C2=A0 return 0;
>> +
>> +err_dsp:
>> + =C2=A0 =C2=A0 /* Not implemented */
>> +err_clk:
>> + =C2=A0 =C2=A0 clk_put(dsp->pcm_cclk);
>> +err:
>> + =C2=A0 =C2=A0 return ret;
>> +}
>> +
>> +static __devexit int s3c64xx_dsp_dev_remove(struct platform_device =
*pdev)
>> +{
>> + =C2=A0 =C2=A0 dev_err(&pdev->dev, "Device removal not yet supporte=
d\n");
>> + =C2=A0 =C2=A0 return 0;
>> +}
>> +
>> +static struct platform_driver s3c64xx_dsp_driver =3D {
>> + =C2=A0 =C2=A0 .probe =C2=A0=3D s3c64xx_dsp_dev_probe,
>> + =C2=A0 =C2=A0 .remove =3D s3c64xx_dsp_dev_remove,
>> + =C2=A0 =C2=A0 .driver =3D {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =3D "s3c64xx-dsp",
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =3D THIS_MODULE,
>> + =C2=A0 =C2=A0 },
>> +};
>> +
>> +static int __init s3c64xx_dsp_init(void)
>> +{
>> + =C2=A0 =C2=A0 return platform_driver_register(&s3c64xx_dsp_driver)=
;
>> +}
>> +module_init(s3c64xx_dsp_init);
>> +
>> +static void __exit s3c64xx_dsp_exit(void)
>> +{
>> + =C2=A0 =C2=A0 platform_driver_unregister(&s3c64xx_dsp_driver);
>> +}
>> +module_exit(s3c64xx_dsp_exit);
>> +
>> +/* Module information */
>> +MODULE_AUTHOR("Jaswinder Singh, <jassi.brar@samsung.com>");
>> +MODULE_DESCRIPTION("S3C64XX PCM Controller Driver");
>> diff --git a/sound/soc/s3c24xx/s3c64xx-dsp.h b/sound/soc/s3c24xx/s3c=
64xx-dsp.h
>> new file mode 100644
>> index 0000000..cb92346
>> --- /dev/null
>> +++ b/sound/soc/s3c24xx/s3c64xx-dsp.h
>> @@ -0,0 +1,41 @@
>> +/* =C2=A0sound/soc/s3c24xx/s3c64xx-dsp.h
>> + *
>> + * =C2=A0ALSA Soc Audio Layer - S3C64XX PCM Controller driver
>> + *
>> + * =C2=A0This program is free software; you can redistribute =C2=A0=
it and/or modify it
>> + * =C2=A0under =C2=A0the terms of =C2=A0the GNU General =C2=A0Publi=
c License as published by the
>> + * =C2=A0Free Software Foundation; =C2=A0either version 2 of the =C2=
=A0License, or (at your
>> + * =C2=A0option) any later version.
>> + */
>> +
>> +#ifndef __SND_SOC_S3C64XX_PCM_H
>> +#define __SND_SOC_S3C64XX_PCM_H __FILE__
>> +
>> +#define S3C64XX_DSP_CLKSRC_PCLK =C2=A0 =C2=A0 =C2=A00
>> +#define S3C64XX_DSP_CLKSRC_MUX =C2=A0 =C2=A0 =C2=A0 1
>> +
>> +#define S3C64XX_DSP_SYNC_DIV 0
>> +#define S3C64XX_DSP_SCLK_DIV 1
>> +
>> +/**
>> + * struct s3c_dsp_info - S3C PCM Controller information
>> + * @dev: The parent device passed to use from the probe.
>> + * @regs: The pointer to the device register block.
>> + * @dma_playback: DMA information for playback channel.
>> + * @dma_capture: DMA information for capture channel.
>> + */
>> +struct s3c_dsp_info {
>> + =C2=A0 =C2=A0 struct device =C2=A0 *dev;
>> + =C2=A0 =C2=A0 void __iomem =C2=A0 =C2=A0*regs;
>> +
>> + =C2=A0 =C2=A0 /* Whether to keep PCMSCLK enabled even when idle(no=
 active xfer) */
>> + =C2=A0 =C2=A0 unsigned int idleclk;
>> +
>> + =C2=A0 =C2=A0 struct clk =C2=A0 =C2=A0 =C2=A0*pcm_pclk;
>> + =C2=A0 =C2=A0 struct clk =C2=A0 =C2=A0 =C2=A0*pcm_cclk;
>> +
>> + =C2=A0 =C2=A0 struct s3c24xx_pcm_dma_params =C2=A0 *dma_playback;
>> + =C2=A0 =C2=A0 struct s3c24xx_pcm_dma_params =C2=A0 *dma_capture;
>> +};
>> +
>> +#endif /* __SND_SOC_S3C64XX_PCM_H */
>> --
>> 1.6.2.5
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.h=
tml
>>
>
> --
> "You grabbed my hand and we fell into it, like a daydream - or a feve=
r."
>
