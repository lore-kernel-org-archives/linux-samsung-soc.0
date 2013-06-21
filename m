From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/2] Clock update for EXYNOS4210-CPUFREQ driver
Date: Fri, 21 Jun 2013 10:44:53 -0700
Message-ID: <20130621174453.20448.59791@quantum>
References: <1371725238-25437-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:58980 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1423307Ab3FURo5 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Jun 2013 13:44:57 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl14so8160569pab.20
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jun 2013 10:44:56 -0700 (PDT)
In-Reply-To: <1371725238-25437-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, tomasz.figa@gmail.com, patches@linaro.org

Quoting Tushar Behera (2013-06-20 03:47:16)
> cpufreq driver for EXYNOS4 based SoCs are not platform drivers, hence
> we cannot currently pass the clock names through a device tree node.
> Instead, we need to make them available through global alias.
> 
> The patches are based on next-20130618.
> 
> Patch 1 has not been modified.
> Patch 2 has been updated to include EXYNOS4X12 releated clocks.

Patch and changelogs look good to me now. Tomasz, any comments? I am
happy to take these into clk-next with your review.

Regards,
Mike

> 
> Tushar Behera (2):
>   clk: samsung: Add MUX_FA macro to pass flag and alias
>   clk: exynos4: Fix clock aliases for cpufreq related clocks
> 
>  drivers/clk/samsung/clk-exynos4.c |   21 +++++++++++----------
>  drivers/clk/samsung/clk.h         |    3 +++
>  2 files changed, 14 insertions(+), 10 deletions(-)
> 
> -- 
> 1.7.9.5
