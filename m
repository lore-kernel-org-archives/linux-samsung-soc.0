From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: RE: [PATCH] regulator: Add support samsung power domain
Date: Fri, 17 Sep 2010 13:45:36 +0200
Message-ID: <007b01cb565d$db4376d0$91ca6470$%szyprowski@samsung.com>
References: <1284717532-9992-1-git-send-email-kgene.kim@samsung.com>
 <20100917113050.GA4322@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40651 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801Ab0IQLps (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Sep 2010 07:45:48 -0400
In-reply-to: <20100917113050.GA4322@rakim.wolfsonmicro.main>
Content-language: pl
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Kukjin Kim' <kgene.kim@samsung.com>
Cc: 'Jeongbae Seo' <jeongbae.seo@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 'Changhwan Youn' <chaos.youn@samsung.com>, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk

Hello,

On Friday, September 17, 2010 1:31 PM Mark Brown wrote:

> Another option to consider here is using runtime PM - other platforms
> seem to be going down that route, and are using it to also factor clock
> management for the IP blocks out (so that the block's clocks get enabled
> and disabled automatically when the block is active without needing any
> code in the driver).

The approach with merging power domains with clocks have some disadvantages.
In some cases the clock gating and power gating should be distinguished.
Just assume an IP like a video codec. It has it's own internal state machine.
It gets reset when the ip is power gated, but it is preserved during clock
gating. The driver might want to do a clock gating when it is waiting for a
new frame to decode, but should do power gating only when the device has
been closed. Having a set of fake clocks just for power gating imho doesn't
look good.

Best regards
--
Marek Szyprowski
Samsung Poland R&D Center
