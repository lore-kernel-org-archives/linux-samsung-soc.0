From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH] clk: exynos5250: Fix parent clock for sclk_mmc{0,1,2,3}
Date: Tue, 23 Apr 2013 19:53:26 -0700
Message-ID: <20130424025326.GA10479@quad.lixom.net>
References: <CAD=FV=UUg9Apb0o+zLdidDUmkLZt1phgo80bxug=o6JmANCPfw@mail.gmail.com>
 <1366698711-15470-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f53.google.com ([209.85.220.53]:54234 "EHLO
	mail-pa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757442Ab3DXCxX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 22:53:23 -0400
Received: by mail-pa0-f53.google.com with SMTP id bh4so875323pad.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 19:53:23 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1366698711-15470-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, dianders@chromium.org, kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, olofj@chromium.org, patches@linaro.org

On Tue, Apr 23, 2013 at 12:01:51PM +0530, Tushar Behera wrote:
> commit 688f7d8c9fef ("clk: exynos5250: Fix divider values for
> sclk_mmc{0,1,2,3}") incorrectly sets the divider for sclk_mmc{0,1,2,3}
> to fix the wrong clock value. Though this fixed issue with Arndale,
> it created regressions for other boards like Snow.
> 
> On Exynos5250, sclk_mmc<n> is generated like below (as per the clock
> names in drivers/clk/samsung/clk-exynos5250.c)
> 
> mout_group1_p ==> mout_mmc<n> ==>
> 		div_mmc<n> ==> div_mmc_pre<n> => sclk_mmc<n>
> 
> Earlier div_mmc<n> was set as the parent for sclk_mmc<n>, hence
> div_mmc_pre<n> was not getting referred in kernel code and depending
> on its value set during preboot, sclk_mmc<n> value was different for
> various boards.
> 
> Setting the correct clock generation path should fix the issues
> reported in above referenced commit. The changes committed during the
> earlier patch has also been reverted here.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> CC: Doug Anderson <dianders@chromium.org>
> ---
> Doug,
> 
> Would you please test whether this patch works for Snow?

Applied to next/drivers in arm-soc.git.


-Olof
