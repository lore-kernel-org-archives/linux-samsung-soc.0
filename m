From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH RFC 4/7] ASoC: samsung: i2s: Do not use platform_data for DMA parameters
Date: Mon, 07 Nov 2016 22:14:34 +0100
Message-ID: <1863253.DX7iDsal5P@wuerfel>
References: <1478276094-19135-1-git-send-email-s.nawrocki@samsung.com> <201611050029.18984.arnd@arndb.de> <c4388f30-702b-895b-5280-6fabf8e7bfe1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.74]:64048 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752307AbcKGVPb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Nov 2016 16:15:31 -0500
In-Reply-To: <c4388f30-702b-895b-5280-6fabf8e7bfe1@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-samsung-soc@vger.kernel.org, vinod.koul@intel.com, sbkim73@samsung.com, andi.shyti@samsung.com, javier@osg.samsung.com, broonie@kernel.org, kgene@kernel.org, dmaengine@vger.kernel.org, ckeepax@opensource.wolfsonmicro.com, ym0914@gmail.com

On Monday, November 7, 2016 5:02:54 PM CET Sylwester Nawrocki wrote:
> On 11/05/2016 12:29 AM, Arnd Bergmann wrote:
> > On Friday 04 November 2016, Sylwester Nawrocki wrote:
> >> > -       ret = samsung_asoc_dma_platform_register(&pdev->dev, pri_dai->filter,
> >> > +       ret = samsung_asoc_dma_platform_register(&pdev->dev, NULL,
> >> >                                                  NULL, NULL);
> >
> > If we remove the filter argument from every caller here, maybe we should also
> > change the prototype to not expect those three NULL arguments any more.
> 
> There is one occurrence where the third argument needs to be not NULL.
> I'm planning to modify sound/sound/samsung/i2s.c so there is no need
> to create another platform device just for the overlay DAI, afterwards
> the above function could be simplified.

Ok, sounds good.

	Arnd
