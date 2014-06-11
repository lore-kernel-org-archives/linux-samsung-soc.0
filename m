From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2 v3] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Wed, 11 Jun 2014 19:50:51 +0200
Message-ID: <539896FB.4050702@gmail.com>
References: <1402468318-7342-1-git-send-email-ch.naveen@samsung.com> <539839D6.1050305@collabora.co.uk> <CAHfPSqCYqTRBBH56y81na-t18pvoPmyWobZwXNgkrtq=H_79CQ@mail.gmail.com> <5398918F.4060800@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:63432 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753077AbaFKRvK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Jun 2014 13:51:10 -0400
In-Reply-To: <5398918F.4060800@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

On 11.06.2014 19:27, Javier Martinez Canillas wrote:
> On 06/11/2014 01:38 PM, Naveen Krishna Ch wrote:
>> On 11 June 2014 16:43, Javier Martinez Canillas
>> <javier.martinez@collabora.co.uk> wrote:
>>> On 06/11/2014 08:31 AM, Naveen Krishna Chatradhi wrote:

[snip]

>>>
>>>>               return ERR_PTR(-EINVAL);
>>>>       }
>>>> +     cs->line = spi->cs_gpio;
>>>>
>>>
>>> I wonder why are you keeping cs->line? AFAICT it's only used in
>>> s3c64xx_spi_setup() to request the GPIO and since you get the struct spi_device
>>> pointer as a parameter then you can just use spi->s_gpio instead.
>> I'm trying not to touch the non-DT part of the code.
>>
>> struct s3c64xx_spi_csinfo *cs = spi->controller_data;
>>
>> This will update the cs->line and cs->fb_delay in case of non-DT.
> 
> I see, then I prefer the opposite and do something like this on s3c64xx_spi_probe():
> 
> if (!pdev->dev.of_node)
>        spi->cs_gpio = cs->line;

Hmm, as far as I understand, spi here is spi_device, not spi_master. I
don't think you have access to SPI devices on your bus in controller
probe().

What I think could work is reworking the driver to:

- in DT case, don't do anything in the driver about the GPIO chip
select, because it will be handled automatically by the core.

- in non-DT case, in s3c64xx_spi_setup(), just take the GPIO pin from
s3c64xx_spi_csinfo struct passed through spi->controller_data, request
it and save it to spi->cs_gpio,

- in non-DT case, in s3c64xx_spi_cleanup(), free the GPIO requested in
s3c64xx_spi_setup() and set spi->cs_gpio to -ENOENT (as done initially
in spi_alloc_device()).

Best regards,
Tomasz
