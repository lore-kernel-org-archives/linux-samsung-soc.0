From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/2 v2] spi: s3c64xx: use "cs-gpios" from spi node instead
 of "cs-gpio"
Date: Tue, 10 Jun 2014 21:59:59 +0200
Message-ID: <539763BF.1030209@gmail.com>
References: <1402394881-31564-1-git-send-email-ch.naveen@samsung.com>	<1402394881-31564-2-git-send-email-ch.naveen@samsung.com>	<53976154.60308@gmail.com> <CAD=FV=X5nLM3Yqkvk+UqVZPFzVNHmPDn3y+euYDwZ3M2bG+0Cg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:60959 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754306AbaFJUAT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 16:00:19 -0400
In-Reply-To: <CAD=FV=X5nLM3Yqkvk+UqVZPFzVNHmPDn3y+euYDwZ3M2bG+0Cg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@chromium.org>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Naveen Krishna <naveenkrishna.ch@gmail.com>, "broonie@kernel.org" <broonie@kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Jaswinder Singh <jaswinder.singh@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "cpgs ." <cpgs@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

On 10.06.2014 21:58, Doug Anderson wrote:
> Tomasz,
> 
> On Tue, Jun 10, 2014 at 12:49 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:
>> This is wrong. The "cs-gpios" property is supposed to be an array,
>> indexed by chip select number of SPI devices (indicated by their "reg"
>> properties).
>>
>> Moreover, is there a need to parse this manually in this driver? I can
>> see respective parsing code in of_spi_register_master().
> 
> I noticed this too (see my response), but I was confused about the
> fact that nobody else uses the array created by
> of_spi_register_master().  Any idea why?

Hmm, I can see of_spi_register_master() assigning allocated pointer to
master->cs_gpios, which is then used in spi_add_device() as follows:

	if (master->cs_gpios)
		spi->cs_gpio = master->cs_gpios[spi->chip_select];

Best regards,
Tomasz
