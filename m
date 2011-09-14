From: Jassi Brar <jaswinder.singh@linaro.org>
Subject: Re: [PATCH v8 00/16] To use DMA generic APIs for Samsung DMA
Date: Wed, 14 Sep 2011 17:03:53 +0530
Message-ID: <CAJe_ZhdrPMbBOkfwg=PFyVU14eT0Gc0=rtKwEiQCH5-Q5-CtVQ@mail.gmail.com>
References: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
	<1315980099.26251.498.camel@vkoul-udesk3>
	<CABb+yY25NTbtRPOw-KH8U4zA1Bo8q0BDM8SXyrsobG7NEv8edg@mail.gmail.com>
	<1315999032.26251.501.camel@vkoul-udesk3>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:51277 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932129Ab1INLdy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Sep 2011 07:33:54 -0400
Received: by wwf22 with SMTP id 22so2101682wwf.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Sep 2011 04:33:53 -0700 (PDT)
In-Reply-To: <1315999032.26251.501.camel@vkoul-udesk3>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vinod Koul <vinod.koul@intel.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Boojin Kim <boojin.kim@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org

On 14 September 2011 16:47, Vinod Koul <vinod.koul@intel.com> wrote:

>> The changelog for [PATCH v8 04/16] is misleading - we don't need any
>> modification for the reason mentioned in changelog. But the modification
>> has positive side-effect of preventing callbacks during terminate_all which
>> is no way understood from the changelog. So I would like to changelog
>> corrected.
> I thought change log was correct in depicting what patch does and Boojin
> had replied.... I will check again...

I didn't reply because I ran out of ways to explain the same thing in
different words.
