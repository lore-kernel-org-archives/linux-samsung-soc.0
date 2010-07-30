From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH 1/2] ARM: S5PV210: Add audio support to Aquila
Date: Fri, 30 Jul 2010 16:15:29 +0900
Message-ID: <4C527C11.5090409@samsung.com>
References: <4C4F9E4C.7000001@samsung.com>
 <20100729173825.GE24781@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:63615 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755205Ab0G3HPa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Jul 2010 03:15:30 -0400
Received: from epmmp2 (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6D002XM05TRZ40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jul 2010 16:15:29 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6D00AD905T6N@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Jul 2010 16:15:29 +0900 (KST)
In-reply-to: <20100729173825.GE24781@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben@simtec.co.uk>, Liam Girdwood <lrg@slimlogic.co.uk>, Kyungmin Park <kyungmin.park@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>

Mark Brown wrote:
> On Wed, Jul 28, 2010 at 12:04:44PM +0900, Chanwoo Choi wrote:
> 
>> +static struct regulator_consumer_supply wm8994_fixed_voltage0_supplies[] = {
>> +	{
>> +		.dev_name	= "5-001a",
>> +		.supply		= "DBVDD",
>> +	}, {
>> +		.dev_name	= "5-001a",
>> +		.supply		= "AVDD2",
>> +	}, {
>> +		.dev_name	= "5-001a",
>> +		.supply		= "CPVDD",
>> +	},
>> +
>> +};
>> +
>> +static struct regulator_consumer_supply wm8994_fixed_voltage1_supplies[] = {
> 
> All these fixed voltage regulators seem a bit suspicous for a mobile
> phone - I'd have expected that the supplies would all be being provided
> by your PMIC except for things taken directly from the battery supply
> (like the speakers tend to be, for example)?  There's no problem with
> the code itself, it just looks a bit odd.
> 

All these consumer supply of WM8994 codec connected the below regulator(VCC_1.8V) on
a circuit diagram. "VCC_1.8V" regualtor is always enabled, because it is used to many devices.
Then I haven't connected all these consumer supply of WM8994 codec to "VCC_1.8V" regulator.
I will modify that the consumer supply would be provided by PMIC.

static struct regulator_init_data aquila_buck3_data = {
	.constraints	= {
		.name		= "VCC_1.8V",
		.min_uV		= 1800000,
		.max_uV		= 1800000,
		.apply_uV	= 1,
		.state_mem	= {
			.enabled = 1,
		},
	},
};

>> +static struct i2c_board_info i2c_gpio5_devs[] __initdata = {
>> +	{
>> +		/* CS/ADDR = low 0x34 (FYI: high = 0x36) */
>> +		I2C_BOARD_INFO("wm8994", 0x34 >> 1),
>> +		.platform_data	= &wm8994_platform_data,
>> +	},
>> +};
> 
> Probably clearer for generic Linux use to specify the address as 0x1a
> directly.

Ok, I will do.

> 
>> +static void __init aquila_sound_init(void)
>> +{
>> +	unsigned int gpio;
>> +
>> +	/* CODEC_XTAL_EN */
>> +	gpio = S5PV210_GPH3(2);		/* XEINT_26 */
>> +	gpio_request(gpio, "CODEC_XTAL_EN");
>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>> +	s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
>> +	gpio_direction_output(gpio, 1);
> 
> Might be as well to provide some or all this stuff in your audio machine
> driver?

The Aquila board have a oscillator which provide main clock to 
WM8994 audio codec. The oscillator provide 24MHz clock to WM8994 audio codec
(MCLK1 pin). I set gpio setting of "CODEC_XTAL_EN" to enable a oscillator.

> 
>> +	/* MICBIAS_EN */
>> +	gpio = S5PV210_GPJ4(2);			/* XMSMRN */
>> +	gpio_request(gpio, "MICBIAS_EN");
>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>> +	gpio_direction_output(gpio, 1);
> 
> This in particular would benefit from keeping the request of the GPIO
> joined up with the driver that uses it.

Ok, I will move this code to machine driver(sound/soc/s3c24xxx/aquila_wm8994.c).

>> +	/* ADC_EN */
>> +	gpio = S5PV210_GPJ3(2);
>> +	gpio_request(gpio, "ADC_EN");
>> +	s3c_gpio_cfgpin(gpio, S3C_GPIO_OUTPUT);
>> +	gpio_direction_output(gpio, 1);
> 
> I'm not sure what this does?
> 

I explained below description about "ADC_EN" :
"ADC_EN : This gpio enable the ADC device which is used to detect
 the kind of jack. (SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT)
 According to the kind of jack, an electric current is changed.
 (Only used on Aquila board) "

When inserting the jack to Aquila board, I used ADC driver so that, detecting
the kind of jack(SND_JACK_HEADPHONE/HEADSET/MECHANICAL/AVOUT).

I will separately make the another function to initialize ADC driver.

Thank you for your comment.
Chanwoo Choi
