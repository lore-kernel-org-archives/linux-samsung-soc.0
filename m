From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/2 v2] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Tue, 10 Jun 2014 13:21:50 -0700
Message-ID: <CAD=FV=V9Qd=aYDAkJuic2DbBaY=0E5UpNnnBHfEBqE5rvYLKVw@mail.gmail.com>
References: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com>
	<1402394881-31564-2-git-send-email-ch.naveen@samsung.com>
	<53976154.60308@gmail.com>
	<CAD=FV=X5nLM3Yqkvk+UqVZPFzVNHmPDn3y+euYDwZ3M2bG+0Cg@mail.gmail.com>
	<539763BF.1030209@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:36522 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753846AbaFJUVw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 16:21:52 -0400
Received: by mail-ve0-f181.google.com with SMTP id db11so3406276veb.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 13:21:51 -0700 (PDT)
In-Reply-To: <539763BF.1030209@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Tomasz,

On Tue, Jun 10, 2014 at 12:59 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On 10.06.2014 21:58, Doug Anderson wrote:
>> Tomasz,
>>
>> On Tue, Jun 10, 2014 at 12:49 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>>> This is wrong. The "cs-gpios" property is supposed to be an array,
>>> indexed by chip select number of SPI devices (indicated by their "reg"
>>> properties).
>>>
>>> Moreover, is there a need to parse this manually in this driver? I can
>>> see respective parsing code in of_spi_register_master().
>>
>> I noticed this too (see my response), but I was confused about the
>> fact that nobody else uses the array created by
>> of_spi_register_master().  Any idea why?
>
> Hmm, I can see of_spi_register_master() assigning allocated pointer to
> master->cs_gpios, which is then used in spi_add_device() as follows:
>
>         if (master->cs_gpios)
>                 spi->cs_gpio = master->cs_gpios[spi->chip_select];

OK.  I haven't traced through all the code, but I did notice:

* spi-gpio.c: has its own cs_gpios[0], initted with of_get_named_gpio()
* spi-dw-mmio.c, spi-efm32.c, spi-imx.c, spi-pl022.c, spi-sirf.c all
seem to be looking at "cs-gpios" directly.

...but I see now that you're right that most drivers don't need to
actually look at cs_gpios and can just look at the device itself.

-Doug
