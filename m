From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 0/2] Clock changes for supporting CPUFreq on Exynos5250
Date: Tue, 28 May 2013 11:08:44 +0530
Message-ID: <51A442E4.90307@linaro.org>
References: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f50.google.com ([209.85.220.50]:61168 "EHLO
	mail-pa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932643Ab3E1Fiu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 May 2013 01:38:50 -0400
Received: by mail-pa0-f50.google.com with SMTP id fb11so6141701pad.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 May 2013 22:38:49 -0700 (PDT)
In-Reply-To: <1368770153-29041-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, mturquette@linaro.org, thomas.abraham@linaro.org, patches@linaro.org

On 05/17/2013 11:25 AM, Tushar Behera wrote:
> With the use of common clock framework, CPUFreq driver on EXYNOS5250 now
> requires a few changes in clocks.
> 
> Tested on Exynos5250 based Arndale board.
> The patches are based on v3.10-rc1.
> 
> Tushar Behera (2):
>   clk: exynos5250: Update cpufreq related clocks for EXYNOS5250
>   clk: exynos5250: Add sclk_mpll to the parent list of mout_cpu clock
> 
>  drivers/clk/samsung/clk-exynos5250.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Any comments on this series?

-- 
Tushar Behera
