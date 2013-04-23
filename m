From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] clk: exynos5250: Fix parent clock for sclk_mmc{0,1,2,3}
Date: Tue, 23 Apr 2013 08:59:03 -0700
Message-ID: <CAD=FV=X6Gy_we+C0VH3keqEY=v4uW_wmS3HdHQvqY-Jfwcsi5w@mail.gmail.com>
References: <CAD=FV=UUg9Apb0o+zLdidDUmkLZt1phgo80bxug=o6JmANCPfw@mail.gmail.com>
	<1366698711-15470-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:35121 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757098Ab3DWP7E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Apr 2013 11:59:04 -0400
Received: by mail-lb0-f175.google.com with SMTP id o10so815081lbi.34
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2013 08:59:03 -0700 (PDT)
In-Reply-To: <1366698711-15470-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Thomas Abraham <thomas.abraham@linaro.org>, Olof Johansson <olofj@chromium.org>, Patch Tracking <patches@linaro.org>

Tushar,

Thanks for tracking this down.

On Mon, Apr 22, 2013 at 11:31 PM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> commit 688f7d8c9fef ("clk: exynos5250: Fix divider values for
> sclk_mmc{0,1,2,3}") incorrectly sets the divider for sclk_mmc{0,1,2,3}
> to fix the wrong clock value. Though this fixed issue with Arndale,
> it created regressions for other boards like Snow.
>
> On Exynos5250, sclk_mmc<n> is generated like below (as per the clock
> names in drivers/clk/samsung/clk-exynos5250.c)
>
> mout_group1_p ==> mout_mmc<n> ==>
>                 div_mmc<n> ==> div_mmc_pre<n> => sclk_mmc<n>
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

Yup, it works for me.  I did the basic testing of installing to eMMC
with this and then booting from eMMC.  I saw no errors in the console.

I glanced over the patch and it looks reasonable to me.  :)

Reported-by: Doug Anderson <dianders@chromium.org>
Tested-by: Doug Anderson <dianders@chromium.org>
