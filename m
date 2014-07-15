From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3 v6] spi: s3c64xx: fix broken "cs_gpios" usage in the
 driver
Date: Tue, 15 Jul 2014 19:22:27 +0200
Message-ID: <53C56353.2040902@samsung.com>
References: <1405316506-27855-1-git-send-email-ch.naveen@samsung.com>
 <1405316506-27855-2-git-send-email-ch.naveen@samsung.com>
 <53C55D17.90109@samsung.com>
 <CAHfPSqA5MMtaY5kb85xmZXkN62a+otgDAM93Gxn9d9fHv39k=g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44179 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932208AbaGORXM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Jul 2014 13:23:12 -0400
In-reply-to: <CAHfPSqA5MMtaY5kb85xmZXkN62a+otgDAM93Gxn9d9fHv39k=g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org

On 15.07.2014 19:21, Naveen Krishna Ch wrote:
> Hello Tomasz,
> 
> On 15 July 2014 22:25, Tomasz Figa <t.figa@samsung.com> wrote:
>> Hi Naveen,
>>
>> On 14.07.2014 07:41, Naveen Krishna Chatradhi wrote:
>>> Since, (3146bee spi: s3c64xx: Added provision for dedicated cs pin)
>>>
>>> spi-s3c64xx.c driver expects
>>> 1. chip select gpios from "cs-gpio"(singular) under the
>>>    "controller-data" node of the client/slave device of the SPI.
>>
>> Please work a bit more on readability of your commit messages,
>> especially in terms of using correct terminology to avoid unnecessary
>> confusion.
>>
>> s/'chip select gpios'/'chip select GPIO pins'/
>> s/'"cs-gpio"(singular)'/'"cs-gpio" property'/
>> s/'client/slave device of the SPI'/'SPI device'/
> 
> Sure, I'm working on that.
> 
>>
>> More things like this follow in rest of the text below.
>>
>> Otherwise I believe the code after this patch does the right thing, so:
>>
>> Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> 
> I've submitted another patch set which does the same functionality
> as this patch set. I believe the new series is more cleaner in terms of
> patch separation and documentation.
> 
> Kindly, let me know your comments on that series.
> http://www.spinics.net/lists/arm-kernel/msg347634.html

Right. I noticed it just now and am looking at it.

Best regards,
Tomasz
