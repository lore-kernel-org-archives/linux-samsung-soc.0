From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [GIT PULL] clk/samsung updates for v4.15, part 2
Date: Tue, 31 Oct 2017 14:51:41 -0700
Message-ID: <20171031215141.GF30645@codeaurora.org>
References: <CGME20171016102923epcas1p445d71065cec89b9f62b9f02a5446c2dc@epcas1p4.samsung.com>
 <148bdf52-8e47-7696-f42d-98625d9dc43e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44098 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751344AbdJaVvn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Oct 2017 17:51:43 -0400
Content-Disposition: inline
In-Reply-To: <148bdf52-8e47-7696-f42d-98625d9dc43e@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>

On 10/16, Sylwester Nawrocki wrote:
> Hi Stephen, Mike,
> 
> This change set is based off of your clk-pm-runtime branch, I needed to
> do it that way as there were dependencies on the newly added clk runtime
> PM feature.  In this tag there is also a fix commit related to changes 
> introduced in the clk-pm-runtime branch. There will be a merge conflict, 
> you can find the conflict resolution hint below. 
> 
> The following changes since commit ae432a9b314e07d486acfadc4df2f922721e6757:
> 
>   clk: samsung: exynos-audss: Add support for runtime PM (2017-09-07 15:26:01 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.15-exynos-pm

Did you change keys recently? My older version of gnupg chokes on
your signature which is slightly concerning. The other PR didn't
have problems.

> 
> for you to fetch changes up to 7679eb20353dc74e47fbc97b2d77fd4f88a77c0f:
> 
>   clk: samsung: Add a separate driver for Exynos4412 ISP clocks (2017-10-16 11:25:50 +0200)
> 
> ----------------------------------------------------------------
> clk/samsung updates for v4.15, part 2
> 
>  - An addition of separate driver for the Exynos 4412 ISP CMU, needed
>    to model and properly handle the clock controller's dependencies
>    on the ISP power domain.

I find it sad that you opted to break the clk node up into two
nodes and clk providers purely to satisfy the requirement that
runtime PM be used with struct devices instead of solving the
problem of multiple power domains for a single struct device and
how that would work with runtime PM.

Anyway, who am I to stand in the way of progress! I'll pull this
into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
