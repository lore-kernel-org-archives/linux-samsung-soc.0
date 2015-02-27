From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFT] phy: exynos-mipi-video: Use spin_lock to protct
 state->regmap rmw operations
Date: Fri, 27 Feb 2015 14:27:44 +0100
Message-ID: <54F070D0.2050504@samsung.com>
References: <1425009057.12126.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:64226 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751334AbbB0N15 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Feb 2015 08:27:57 -0500
In-reply-to: <1425009057.12126.1.camel@phoenix>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On 27/02/15 04:50, Axel Lin wrote:
> he state->regmap is initialized by devm_regmap_init_mmio().
> So it's fine to use spin_lock rather than mutex to protct state->regmap rmw
> operations.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
> Hi Sylwester,
> I don't have this hardware handy, so can you test if this patch works.
> This patch is on top of my previous patch (phy: exynos-mipi-video: Fixup 
> the test for state->regmap)

Thanks for the patch, it looks good to me. I somehow missed the syscon
already uses a spinlock for regmap protection.

v4.0-rc1 seems devastated as far as exynos4 is concerned, it may take
some time until I get around and fix all the issues so I tested your
patch on v3.19. It all works well as expected.

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

-- 
Thanks,
Sylwester
