From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v2] ARM: dts: exynos: Add entries for sound support on
 Odroid-XU board
Date: Fri, 21 Oct 2016 11:30:31 +0200
Message-ID: <a052c61f-8c8c-9732-0db5-ebc7b7966dd3@samsung.com>
References: <CGME20160916112217eucas1p1694395dda2a1e8cdf562007ed8141542@eucas1p1.samsung.com>
 <1474024920-32744-1-git-send-email-s.nawrocki@samsung.com>
 <f4d204d8-b6b8-5173-c530-bfea1ec9ed7d@samsung.com>
 <71286ef8-4b7f-cfde-7bb9-9f3bd2289527@samsung.com>
 <20160917200017.GA13666@kozik-lap>
 <5fef2bec-adcf-0230-cd00-7fc29cbbcd32@samsung.com>
 <20160922184036.GA10000@kozik-lap> <20161017155421.GA11689@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19809 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933452AbcJUJam (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 05:30:42 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OFE00AE752X0Y50@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 21 Oct 2016 10:30:34 +0100 (BST)
In-reply-to: <20161017155421.GA11689@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene@kernel.org, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org

On 10/17/2016 05:54 PM, Krzysztof Kozlowski wrote:
> I re-applied the patch. However I do not have Odroid XU board anymore
> (Samsung R&D Institute Poland was kind enough to provide XU and U3
> boards to me this year... but I had to give it back :( ) so I cannot
> verify that it works... If it does not, then Sylwester you owe me
> another bottle of good whisky!

I verified your for-next branch on Odroid-XU and it boots and sound
works.  I'm sorry, you're out of luck this time:)

I'm considering setting up some basic boot tests with -next also
on Odroid-XU here.

--
Thanks,
Sylwester
