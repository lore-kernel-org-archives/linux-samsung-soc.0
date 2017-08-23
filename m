From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [GIT PULL] clk/samsung updates for 4.14-rc1
Date: Wed, 23 Aug 2017 15:38:43 -0700
Message-ID: <20170823223843.GE21656@codeaurora.org>
References: <CGME20170811170044epcas1p156cc48d8ca2d2533fa91daf41213487f@epcas1p1.samsung.com>
 <3188b220-d1da-eabc-33cf-333b2315af47@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:44954 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdHWWip (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 23 Aug 2017 18:38:45 -0400
Content-Disposition: inline
In-Reply-To: <3188b220-d1da-eabc-33cf-333b2315af47@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Mike Turquette <mturquette@baylibre.com>, "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

On 08/11, Sylwester Nawrocki wrote:
> 
> The following changes since commit 5771a8c08880cdca3bfb4a3fc6d309d6bba20877:
> 
>   Linux v4.13-rc1 (2017-07-15 15:22:10 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/clk-v4.14-samsung
> 
> for you to fetch changes up to 599cebea93e69c25e4cf027fc21d2bdf9a4a1ec7:
> 
>   clk: samsung: exynos542x: Enable clock rate propagation up to the EPLL (2017-08-10 10:56:23 +0200)
> 
> ----------------------------------------------------------------
> clk/samsung updates for 4.14
> 
> Changes in definitions of audio related clocks for Exynos5420/5422/5800
> SoCs: a fix of mau_epll clock definition and changes enabling clock rate
> setting propagation on a path from the I2S IP block up the EPLL.
> 

Thanks. Pulled into clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
