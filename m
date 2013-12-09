From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] clk: exynos5250: Add CLK_SET_RATE_PARENT flag to
 mout_apll
Date: Mon, 09 Dec 2013 14:31:48 +0100
Message-ID: <1466487.IbnMiN0f0X@amdc1227>
References: <1385007454-5234-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:19940 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933522Ab3LINcB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 08:32:01 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MXJ0050NK9BD210@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 09 Dec 2013 13:31:59 +0000 (GMT)
In-reply-to: <1385007454-5234-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Sachin,

On Thursday 21 of November 2013 09:47:34 Sachin Kamat wrote:
> Add CLK_SET_RATE_PARENT flag to be able to change the frequency
> to desired value.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Your patch description is a bit off. It doesn't say frequency of what
clock will be able to be changed to "desired value" and what is the reason
for this change.

Best regards,
Tomasz
