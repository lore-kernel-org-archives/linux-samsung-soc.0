From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [GIT PULL] clk/samsung updates for 4.2
Date: Wed, 03 Jun 2015 16:05:59 -0700
Message-ID: <20150603230559.6017.43918@quantum>
References: <556F26C3.9080302@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f181.google.com ([209.85.192.181]:35596 "EHLO
	mail-pd0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752607AbbFCXGD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 3 Jun 2015 19:06:03 -0400
Received: by pdbnf5 with SMTP id nf5so17142307pdb.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 03 Jun 2015 16:06:03 -0700 (PDT)
In-Reply-To: <556F26C3.9080302@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Quoting Sylwester Nawrocki (2015-06-03 09:09:39)
> 
> The following changes since commit 20db7092e478c33a2bf5254063c51f5db6443959:
> 
>   Merge branch 'clk-next-hi6220' into clk-next (2015-05-27 22:06:42 -0700)
> 
> are available in the git repository at:
> 
> 
>   git://linuxtv.org/snawrocki/samsung.git tags/clk-samsung-for-4.2

Sylwester,

Pulled towards 4.2. Thanks for the pull request.

One small thing: clk-next isn't considered stable.  I had some stuff in
there (Stephen's amba assigned-clock-rates patch) which I had to pull
out (no ACK from maintainer) and it crept back in because this PR was
based on top of it. No big deal because I caught it when it happened
(this time).

In the future I am always happy to take PRs based on -rc1 (or any -rc
that is already present in clk-next). Of course if you have a dependency
on stuff already merged in clk-next then just let me know.

Regards,
Mike

> 
> for you to fetch changes up to e5c6fc4f271a27d5b236b5f4929bf0f2dab80a7d:
> 
>   clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC (2015-06-02
> 14:52:12 +0200)
> 
> ----------------------------------------------------------------
> Updates of the exynos5433 clock definitions for proper support of SMC,
> DVFS of GPU and CPU big.LITTLE cores and a fix for system suspend adding
> one of the clock controller's registers to save/restore list.
> 
> ----------------------------------------------------------------
> Chanwoo Choi (1):
>       clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core
> 
> Hyungwon Hwang (1):
>       clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend
> 
> Jonghwa Lee (1):
>       clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC
> 
> Joonyoung Shim (1):
>       clk: exynos5433: Add clock flag to support the DVFS of GPU
> 
>  drivers/clk/samsung/clk-exynos5433.c |   81 +++++++++++++++++-----------------
>  1 file changed, 40 insertions(+), 41 deletions(-)
> 
> -- 
> Thanks,
> Sylwester
