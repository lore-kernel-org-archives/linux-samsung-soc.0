From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] clk: samsung: Register clk provider only after registering
 its all clocks
Date: Mon, 30 Jun 2014 15:49:34 +0200
Message-ID: <53B16AEE.30003@samsung.com>
References: <1403106412-24526-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15103 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752083AbaF3NuC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 09:50:02 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N7Z002CMIFDJR70@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Jun 2014 14:50:01 +0100 (BST)
In-reply-to: <1403106412-24526-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com

On 18.06.2014 17:46, Sylwester Nawrocki wrote:
> Ensure the clock provider is not registered until after all its related
> clocks were created and are ready to use. Currently there are races
> possible and any (of_)clk_get() call right after a clock provider's
> clk_init_cb callback call may fail.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
> 
> NOTE: Tested only on Exynos4412.
> 
>  drivers/clk/samsung/clk-exynos3250.c |    2 ++
>  drivers/clk/samsung/clk-exynos4.c    |    2 ++
>  drivers/clk/samsung/clk-exynos5250.c |    2 ++
>  drivers/clk/samsung/clk-exynos5260.c |    2 ++
>  drivers/clk/samsung/clk-exynos5410.c |    2 ++
>  drivers/clk/samsung/clk-exynos5420.c |    2 ++
>  drivers/clk/samsung/clk-exynos5440.c |    2 ++
>  drivers/clk/samsung/clk-s3c2410.c    |    2 ++
>  drivers/clk/samsung/clk-s3c2412.c    |    2 ++
>  drivers/clk/samsung/clk-s3c2443.c    |    2 ++
>  drivers/clk/samsung/clk-s3c64xx.c    |    2 ++
>  drivers/clk/samsung/clk.c            |   19 ++++++++++---------
>  drivers/clk/samsung/clk.h            |    2 ++
>  13 files changed, 34 insertions(+), 9 deletions(-)

Applied for 3.17.

Best regards,
Tomasz
