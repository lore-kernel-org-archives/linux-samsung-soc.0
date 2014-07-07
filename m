From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 1/3 v5] spi: s3c64xx: fix broken "cs_gpios" usage in the driver
Date: Mon, 7 Jul 2014 11:51:38 +0530
Message-ID: <CAHfPSqAXs=5VLLEV-XVw5YJo=-9QFn9KA8oG_A0CfNykcVwnCQ@mail.gmail.com>
References: <1402631992-500-1-git-send-email-ch.naveen@samsung.com> <20140702165651.GK410@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f44.google.com ([209.85.216.44]:58741 "EHLO
	mail-qa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750889AbaGGGV7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Jul 2014 02:21:59 -0400
In-Reply-To: <20140702165651.GK410@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Tomasz Figa <t.figa@samsung.com>

Hello Mark,

Thanks for the review.

On 2 July 2014 22:26, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jun 13, 2014 at 09:29:50AM +0530, Naveen Krishna Chatradhi wrote:
>
>> Hence, spi-s3c64xx.c is broken since "Jun 21 11:26:12 2013" and
>> considering the time with no compliants about the breakage.
>
> I'm not clear what the breakage is?  Some boards are broken but what's
> the driver issue?

ToT was broken for few boards
exynos4412-trats2.dts, exynos4210-smdkv310.dts and exynos5250-smdk5250.dts

With some DTS changes SPI works well, spi-s3c64xx.c driver had no issues.

>
>>       if (!spi_get_ctldata(spi)) {
>>               /* Request gpio only if cs line is asserted by gpio pins */
>> -             if (sdd->cs_gpio) {
>> -                     err = gpio_request_one(cs->line, GPIOF_OUT_INIT_HIGH,
>> -                                     dev_name(&spi->dev));
>> +             if (gpio_is_valid(spi->cs_gpio)) {
>> +                     err = gpio_request_one(spi->cs_gpio,
>> +                                             GPIOF_OUT_INIT_HIGH,
>> +                                             dev_name(&spi->dev));
>>                       if (err) {
>>                               dev_err(&spi->dev,
>>                                       "Failed to get /CS gpio [%d]: %d\n",
>> -                                     cs->line, err);
>> +                                     spi->cs_gpio, err);
>>                               goto err_gpio_req;
>>                       }
>> -
>> -                     spi->cs_gpio = cs->line;
>> +             } else {
>> +                     dev_err(&spi->dev, "chip select gpio is invalid\n");
>> +                     return -EINVAL;
>>               }
>
> This appears to be making it mandatory to specify a GPIO when previously
> it was not mandatory which I believe breaks some SoCs - the native chip
> select has to be used on some devices as there is no pinmux option to
> make it a GPIO (this was why the native chip select support was added).

I read the commit "3146beec21b64f4551fcf0ac148381d54dc41b1b"
"spi: s3c64xx: Added provision for dedicated cs pin"

I understand "cs_gpio" shouldn't be mandatory. Will remove the else part.

>
> Also I'd need to check but are you sure that GPIO 0 is not valid?

gpio_is_valid() returns true for
"number >= 0 && number < ARCH_NR_GPIOS"

-- 
Shine bright,
(: Nav :)
