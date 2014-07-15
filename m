From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the driver
Date: Tue, 15 Jul 2014 22:51:02 +0530
Message-ID: <CAHfPSqA5MMtaY5kb85xmZXkN62a+otgDAM93Gxn9d9fHv39k=g@mail.gmail.com>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com> <53C55D17.90109@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f52.google.com ([209.85.216.52]:45771 "EHLO
	mail-qa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932177AbaGORVW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 13:21:22 -0400
In-Reply-To: <53C55D17.90109@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org

Hello Tomasz,

On 15 July 2014 22:25, Tomasz Figa <t.figa@samsung.com> wrote:
> Hi Naveen,
>
> On 14.07.2014 07:41, Naveen Krishna Chatradhi wrote:
>> Since, (3146bee spi: s3c64xx: Added provision for dedicated cs pin)
>>
>> spi-s3c64xx.c driver expects
>> 1. chip select gpios from "cs-gpio"(singular) under the
>>    "controller-data" node of the client/slave device of the SPI.
>
> Please work a bit more on readability of your commit messages,
> especially in terms of using correct terminology to avoid unnecessary
> confusion.
>
> s/'chip select gpios'/'chip select GPIO pins'/
> s/'"cs-gpio"(singular)'/'"cs-gpio" property'/
> s/'client/slave device of the SPI'/'SPI device'/

Sure, I'm working on that.

>
> More things like this follow in rest of the text below.
>
> Otherwise I believe the code after this patch does the right thing, so:
>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

I've submitted another patch set which does the same functionality
as this patch set. I believe the new series is more cleaner in terms of
patch separation and documentation.

Kindly, let me know your comments on that series.
http://www.spinics.net/lists/arm-kernel/msg347634.html

>
> Best regards,
> Tomasz
-- 
Thanks & Regards,
(: Naveen :)
