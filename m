From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 01/14] mfd: sec: Add maximum RTC register for regmap config
Date: Wed, 12 Feb 2014 09:58:00 +0100
Message-ID: <1392195480.22265.2.camel@AMDC1943>
References: <1392123837-5517-1-git-send-email-k.kozlowski@samsung.com>
 <1392123837-5517-2-git-send-email-k.kozlowski@samsung.com>
 <20140212084859.GO15081@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:61035 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbaBLI6E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Feb 2014 03:58:04 -0500
In-reply-to: <20140212084859.GO15081@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On Wed, 2014-02-12 at 08:48 +0000, Lee Jones wrote:
> > Add maximum register to the regmap used by rtc-s5m driver.
> > 
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/mfd/sec-core.c          |    2 ++
> >  include/linux/mfd/samsung/rtc.h |    2 ++
> >  2 files changed, 4 insertions(+)
> 
> I guess some of these patches depend on some others?
> 
> When provided with their Acked-by:s, I'm happy to take this whole
> patch-set and create an immutable branch for the other maintainer()s
> in the set to pull from.
> 
> Acked-by: Lee Jones <lee.jones@linaro.org>

Only few of these patches can be picked independently so your idea
sounds good. All I have to do is to get the acks... :)

Best regards,
Krzysztof
