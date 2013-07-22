From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 0/6] clk: exynos: Some fixes and cleanup
Date: Mon, 22 Jul 2013 19:10:26 +0200
Message-ID: <1648122.0DIdkVRanC@amdc1227>
References: <1374141682-29432-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:36320 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757841Ab3GVRKb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 13:10:31 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MQC006TRL1CE120@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Jul 2013 18:10:29 +0100 (BST)
In-reply-to: <1374141682-29432-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, kgene.kim@samsung.com, patches@linaro.org

On Thursday 18 of July 2013 15:31:16 Sachin Kamat wrote:
> Resending some of patches (1, 3 and 5) as per discussion in thread [1].
> Other patches in the series are new.
> 
> [1] http://comments.gmane.org/gmane.linux.kernel.samsung-soc/19933
> 
> Changes since v1:
> * Removed an unnecessary change in Patch 1 as pointed out by Kukjin Kim.
> * Added Kukjin's ack to patches 3~6.
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
> ++++++++++++-------------------- drivers/clk/samsung/clk-exynos5250.c  
> |   14 +++++------
>  drivers/clk/samsung/clk-exynos5420.c   |   14 +++++------
>  drivers/clk/samsung/clk-exynos5440.c   |   14 +++++------
>  5 files changed, 37 insertions(+), 49 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
