From: ysh <youshenghui0322@163.com>
Subject: Re: Ask for help on SPI slave side driver support
Date: Mon, 14 Oct 2013 22:51:06 +0800
Message-ID: <525C04DA.6050409@163.com>
References: <23ff6b10.bf1d.1416a88321f.Coremail.youshenghui0322@163.com> <4025277.bhF6fFGQqq@flatron> <20130930093317.GX19304@sirena.org.uk> <4cd52b0c.af8e.14184497bb9.Coremail.youshenghui0322@163.com> <20131007113323.GL21581@sirena.org.uk> <4e8f3999.9132.141b335ef13.Coremail.youshenghui0322@163.com> <20131014112519.GQ2443@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m12-15.163.com ([220.181.12.15]:38336 "EHLO m12-15.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755253Ab3JNOuw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Oct 2013 10:50:52 -0400
In-Reply-To: <20131014112519.GQ2443@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org, jassi.brar@samsung.com

On 2013-10-14 19:25, Mark Brown wrote:
> On Mon, Oct 14, 2013 at 03:05:58AM +0800, YouShenghui wrote:
>
> Please fix your mailer to word wrap within paragraphs, your messages are
> very hard to read.
>
>> Ok, I have one question when reading drivers/spi/spi-s3c64xx.c
>> In s3c64xx_spi_setup, cs->line(S3C64XX_GPC(3)) is set to GPIOF_OUT_INIT_HIGH, that means an general output pin.
>> But the other three(clk, mosi, miso) was set to 2 by s3c64xx_spi0_cfg_gpio. This is just what is needed by SPI.
>> My question is why wasn't cs->line also set to 2 to use SPI CS0?
>
> In common with many drivers this driver controls the chp select as a
> GPIO.  Generally the hardware is less flexible than Linux can be if it
> implements automatic chip select handling at all.
>
>> When I want to use spi as slave side, should I set S3C64XX_GPC(3)'s cfg of  to 0(input) or 2?
>
> I don't think the controller has any slave support natively so you'd
> probably need to put it into GPIO mode.
Got it, then what about the setting of clk, mosi, miso pin in slave mode?
Do you mean I need to simulate spi slave side using four gpios?

thanks
zduan
