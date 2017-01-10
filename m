From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk/samsung: exynos542x: mark some clocks as critical
Date: Mon, 9 Jan 2017 16:10:18 -0800
Message-ID: <20170110001018.GE17126@codeaurora.org>
References: <CGME20161222094441epcas5p330bb16763e02149a275c30eb644b0e7c@epcas5p3.samsung.com>
 <1482399870-18563-1-git-send-email-m.szyprowski@samsung.com>
 <1f51a603-b345-2c93-f4e1-9617dca387d0@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:33356 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752856AbdAJAKU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 9 Jan 2017 19:10:20 -0500
Content-Disposition: inline
In-Reply-To: <1f51a603-b345-2c93-f4e1-9617dca387d0@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On 01/09, Sylwester Nawrocki wrote:
> On 12/22/2016 10:44 AM, Marek Szyprowski wrote:
> > Some parent clocks of the Exynos542x clock blocks, which have separate
> > power domains (like DISP, MFC, MSC, GSC, FSYS and G2D) must be always
> > enabled to access any register related to power management unit or devices
> > connected to it. For the time being, until a proper solution based on
> > runtime PM is applied, mark those clocks as critical (instead of ignore
> > unused or even no flags) to prevent disabling them.
> >
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> 
> Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> 
> Stephen, Mike, could you apply the $subject patch directly? Due to recent
> Exynos IOMMU related changes that patch is needed as a regression fix
> for v4.10.
> 

Sure, no problem.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
