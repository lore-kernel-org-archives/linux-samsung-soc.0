From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 4/7] ASoC: samsung: i2s: Do not use platform_data for
 DMA parameters
Date: Mon, 07 Nov 2016 17:02:54 +0100
Message-ID: <c4388f30-702b-895b-5280-6fabf8e7bfe1@samsung.com>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com>
 <1478276094-19135-6-git-send-email-s.nawrocki@samsung.com>
 <CGME20161104232949epcas4p30f2bceb3a6c95c10661b68d7bf4d4e99@epcas4p3.samsung.com>
 <201611050029.18984.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:41392 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932380AbcKGQDK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 11:03:10 -0500
In-reply-to: <201611050029.18984.arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, dmaengine@vger.kernel.org, vinod.koul@intel.com, broonie@kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com, kgene@kernel.org, javier@osg.samsung.com, andi.shyti@samsung.com, sbkim73@samsung.com

On 11/05/2016 12:29 AM, Arnd Bergmann wrote:
> On Friday 04 November 2016, Sylwester Nawrocki wrote:
>> > -       ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
>> > +       ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
>> >                                                  NULL, NULL);
>
> If we remove the filter argument from every caller here, maybe we should also
> change the prototype to not expect those three NULL arguments any more.

There is one occurrence where the third argument needs to be not NULL.
I'm planning to modify sound/sound/samsung/i2s.c so there is no need
to create another platform device just for the overlay DAI, afterwards
the above function could be simplified.

-- 
Thanks,
Sylwester
