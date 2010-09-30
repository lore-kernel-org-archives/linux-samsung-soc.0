From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Thu, 30 Sep 2010 10:50:28 +0900
Message-ID: <005a01cb6041$de5c9020$9b15b060$%kim@samsung.com>
References: <4C4F9E4C.7000001@samsung.com>
 <20100729173825.GE24781@opensource.wolfsonmicro.com>
 <4C527C11.5090409@samsung.com>
 <001b01cb5fd0$2c73bd50$855b37f0$%kim@samsung.com> <4CA3E67A.3070309@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:38507 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752218Ab0I3BuO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Sep 2010 21:50:14 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L9J00M9SEFOWB90@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Sep 2010 10:50:12 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L9J00AC7EFOEW@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Sep 2010 10:50:12 +0900 (KST)
In-reply-to: <4CA3E67A.3070309@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Chanwoo Choi' <cwchoi00@gmail.com>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, alsa-devel@alsa-project.org, 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Joonyoung Shim' <jy0922.shim@samsung.com>, 'Ben Dooks' <ben@simtec.co.uk>, 'Kyungmin Park' <kyungmin.park@samsung.com>, 'Myungjoo Ham' <myungjoo.ham@samsung.com>, 'linux-arm-kernel' <linux-arm-kernel@lists.infradead.org>, 'Liam Girdwood' <lrg@slimlogic.co.uk>

Chanwoo Choi wrote:
> Kukjin Kim wrote:
> > Chanwoo Choi wrote:
> >> Mark Brown wrote:
> >>> On Wed, Jul 28, 2010 at 12:04:44PM +0900, Chanwoo Choi wrote:
> >>>
> >>>> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[]
> =
> >> {
> >>>> +	{
> >>>> +		.dev_name	= "5-001a",
> >>>> +		.supply		= "DBVDD",
> >>>> +	}, {
> >>>> +		.dev_name	= "5-001a",
> >>>> +		.supply		= "AVDD2",
> >>>> +	}, {
> >>>> +		.dev_name	= "5-001a",
> >>>> +		.supply		= "CPVDD",
> >>>> +	},
> >>>> +
> >>>> +};
> >>>> +
> >>>> +static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[]
> =
> >> {
> >>> All these fixed voltage regulators seem a bit suspicous for a mobile
> >>> phone - I'd have expected that the supplies would all be being provided
> >>> by your PMIC except for things taken directly from the battery supply
> >>> (like the speakers tend to be, for example)?  There's no problem with
> >>> the code itself, it just looks a bit odd.
> >>>
> >> All these consumer supply of WM8994 codec connected the below
> >> regulator(VCC_1.8V) on
> >> a circuit diagram. "VCC_1.8V" regualtor is always enabled, because it is used
> to
> >> many devices.
> >> Then I haven't connected all these consumer supply of WM8994 codec to
> >> "VCC_1.8V" regulator.
> >> I will modify that the consumer supply would be provided by PMIC.
> >>
> >> static struct regulator_init_data aquila_buck3_data = {
> >> 	.constraints	= {
> >> 		.name		= "VCC_1.8V",
> >> 		.min_uV		= 1800000,
> >> 		.max_uV		= 1800000,
> >> 		.apply_uV	= 1,
> >> 		.state_mem	= {
> >> 			.enabled = 1,
> >> 		},
> >> 	},
> >> };
> >>
> >>>> +static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
> >>>> +	{
> >>>> +		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
> >>>> +		I2C_BOARD_INFO("wm8994", 0x34 >> 1),
> >>>> +		.platform_data	= &wm8994_platform_data,
> >>>> +	},
> >>>> +};
> >>> Probably clearer for generic Linux use to specify the address as 0x1a
> >>> directly.
> >> Ok, I will do.
> >>
> >>>> +static void __init aquila_sound_init(void)
> >>>> +{
> >>>> +	unsigned int gpio;
> >>>> +
> >>>> +	/* CODEC_XTAL_EN */
> >>>> +	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
> >>>> +	gpio_request(gpio, "CODEC_XTAL_EN");
> >>>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> >>>> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
> >>>> +	gpio_direction_output(gpio, 1);
> >>> Might be as well to provide some or all this stuff in your audio machine
> >>> driver?
> >> The Aquila board have a oscillator which provide main clock to
> >> WM8994 audio codec. The oscillator provide 24MHz clock to WM8994 audio
> codec
> >> (MCLK1 pin). I set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.
> >>
> >>>> +	/* MICBIAS_EN */
> >>>> +	gpio = S5PV210_GPJ4(2);			/* XMSMRN */
> >>>> +	gpio_request(gpio, "MICBIAS_EN");
> >>>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> >>>> +	gpio_direction_output(gpio, 1);
> >>> This in particular would benefit from keeping the request of the GPIO
> >>> joined up with the driver that uses it.
> >> Ok, I will move this code to machine
> driver(sound/soc/s3c24xxx/aquila_wm8994.c).
> >>
> >>>> +	/* ADC_EN */
> >>>> +	gpio = S5PV210_GPJ3(2);
> >>>> +	gpio_request(gpio, "ADC_EN");
> >>>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
> >>>> +	gpio_direction_output(gpio, 1);
> >>> I'm not sure what this does?
> >>>
> >> I explained below description about "ADC_EN" :
> >> "ADC_EN : This gpio enable the ADC device which is used to detect
> >>  the kind of jack. (SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT)
> >>  According to the kind of jack, an electric current is changed.
> >>  (Only used on Aquila board) "
> >>
> >> When inserting the jack to Aquila board, I used ADC driver so that, detecting
> >> the kind of jack(SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT).
> >>
> >> I will separately make the another function to initialize ADC driver.
> >>
> >> Thank you for your comment.
> >> Chanwoo Choi
> >>
> > Hi,
> >
> > How was going on?
> >
> 
> I did post this patch and reviewed by maintainer.
> The request was reflected to following patch.
> Also, I did explain the constraints of the regulator of WM8994 codec
> and resend following patch. This patch include Goni and Aquila board code
> related to audio.
> 	[PATCH] ARM: S5PV210: Add audio support to Goni and Aquila board
> 
> This is my mistake, "RESEND" word is leaved out in the subject.
> 
Hmm...so may missed. :-(

It would helpful to me if you could add patch version and changelog.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
