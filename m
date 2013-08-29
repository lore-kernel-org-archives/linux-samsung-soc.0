From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 0/2] Add GPLL, APLL, KPLL,
 EPLL and VPLL freq table for exynos5420 and exynos5250
Date: Wed, 28 Aug 2013 19:42:44 -0700
Message-ID: <20130829024244.10934.6393@quantum>
References: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:64026 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754964Ab3H2Cmv convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 22:42:51 -0400
Received: by mail-pb0-f53.google.com with SMTP id up15so7042973pbc.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 19:42:51 -0700 (PDT)
In-Reply-To: <1377697198-19097-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.figa@samsung.com, patches@linaro.org, linaro-kernel@lists.linaro.org, joshi@samsung.com

Quoting Vikas Sajjan (2013-08-28 06:39:56)
> Adds GPLL, APLL, KPLL, EPLL and VPLL freq table for exynos5420 and exynos5250.
> 
> changes since v1:
>         - addressed comments from Tomasz Figa <tomasz.figa@gmail.com>
> 
> is rebased on Mike's 
> https://git.linaro.org/gitweb?p=people/mturquette/linux.git;a=shortlog;h=refs/heads/clk-next
> and on top of Tomasz Figa's clk clean-up patch series
> http://www.spinics.net/lists/arm-kernel/msg269848.html

Looks good to me but it will have to wait until Tomasz's cleanup series
is merged. I'm waiting on that get to get reviewed-by's and then I'll
take them both in.

Regards,
Mike

> 
> 
> Vikas Sajjan (2):
>   clk: samsung: Add GPLL freq table for exynos5250 SoC
>   clk: samsung: Add APLL, KPLL, EPLL and VPLL freq table for exynos5420
>     SoC
> 
>  drivers/clk/samsung/clk-exynos5250.c |   19 ++++++++-
>  drivers/clk/samsung/clk-exynos5420.c |   78 ++++++++++++++++++++++++++++++++++
>  2 files changed, 96 insertions(+), 1 deletion(-)
> 
> -- 
> 1.7.9.5
