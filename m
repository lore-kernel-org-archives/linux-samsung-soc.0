From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: exynos4412: Audio dies after one day on kernel 4.0
Date: Fri, 12 Jun 2015 18:36:24 +0530
Message-ID: <20150612130624.GL28601@localhost>
References: <5569F435.5040708@unseen.is>
 <CAJKOXPfV2HRMeVhT5uRO5An3pqALWBLBxX2wzP=WxN+eu4dr2A@mail.gmail.com>
 <556E0931.9030703@unseen.is>
 <556E44B7.10303@samsung.com>
 <5576CD40.8060301@unseen.is>
 <CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:32687 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755304AbbFLNFV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Jun 2015 09:05:21 -0400
Content-Disposition: inline
In-Reply-To: <CAJKOXPeehj++Ojt2Zo4sgNjVASzZ8r_6OROM6FK_BRRQqVzcGg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: gabriel@unseen.is, linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org, sylvester.nawrocki@gmail.com, Robert Baldyga <r.baldyga@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On Wed, Jun 10, 2015 at 05:22:07PM +0900, Krzysztof Kozlowski wrote:

> > I can now say for sure that the commits 88987d2c75 and aee4d1fac8 are
> > the cause for the problem. Audio was working now for 7 days.
> 
> +CC Vinod
> 
> Gabriel,
> 
> I sent a patch which should fix the issue. Could you give it a try? Of
> course don't revert the other patches and don't use other workarounds.
> Just apply the patch on clean (vanilla would be the best) kernel.
> [RFT PATCH] dmaengine: Fix choppy sound because of unimplemented resume
I have already applied this one, can you check the -next and see if this
issue is seen

-- 
~Vinod
