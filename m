From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 0/3] clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag
 and
Date: Fri, 10 Jun 2016 12:29:15 +0200
Message-ID: <575A967B.9080209@samsung.com>
References: <1465534592-18860-1-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44855 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751630AbcFJK3j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 06:29:39 -0400
In-reply-to: <1465534592-18860-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@baylibre.com, sboyd@codeaurora.org, kgene@kernel.org, k.kozlowski@samsung.com, jh80.chung@samsung.com, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

On 06/10/2016 06:56 AM, Chanwoo Choi wrote:
> This patch-set add the CLK_IGNORE_UNUSED flag to the specific clocks because
> the specific clocks should remain the enable state. This patch-set support the
> PCIE (PCI Express), serial3(AUD Uart) device and fix the hang issue for
> suspend-to-ram.
> 
> Beomho Seo (1):
>   clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag for AUD Uart
> 
> Jaehoon Chung (1):
>   clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to PCIE device
> 
> Jonghwa Lee (1):
>   clk: samsung: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks occurring hang at sleep

I applied these patches, after slightly editing the descriptions.
I also tested with the audio subsystem patches on top of 4.7-rc1 tree
and with AUD UART enabled. Everything seems to be working fine, there
was no any "external abort" exceptions.

-- 
Thanks,
Sylwester
