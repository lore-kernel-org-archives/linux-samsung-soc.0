From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/6] clk: exynos: Some fixes and cleanup
Date: Tue, 16 Jul 2013 16:36:26 +0900
Message-ID: <02dc01ce81f7$2d9fb6b0$88df2410$%kim@samsung.com>
References: <1373533334-5169-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:39122 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752205Ab3GPHg2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Jul 2013 03:36:28 -0400
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MQ00013YQFXFQ60@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Jul 2013 16:36:26 +0900 (KST)
In-reply-to: <1373533334-5169-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, patches@linaro.org

Sachin Kamat wrote:
> 
> Resending some of patches (1, 3 and 5) as per discussion in thread [1].
> Other patches in the series are new.
> 
> [1] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/19933
> 
> Sachin Kamat (6):
>   clk: exynos4: Staticize local symbols
>   clk: exynos4: Remove unused function
>   clk: exynos5250: Staticize local symbols
>   clk: exynos5420: Staticize local symbols
>   clk: exynos5440: Staticize local symbols
>   clk: exynos-audss: Staticize exynos_audss_clk_init
> 
>  drivers/clk/samsung/clk-exynos-audss.c |    2 +-
>  drivers/clk/samsung/clk-exynos4.c      |   42
++++++++++++-----------------
> ---
>  drivers/clk/samsung/clk-exynos5250.c   |   14 +++++------
>  drivers/clk/samsung/clk-exynos5420.c   |   14 +++++------
>  drivers/clk/samsung/clk-exynos5440.c   |   14 +++++------
>  5 files changed, 37 insertions(+), 49 deletions(-)
> 
> --
> 1.7.9.5

There are small comments on 1st and 2nd patches.
Others look good to me.

For 3rd~6th patches:
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

Thanks,
- Kukjin
