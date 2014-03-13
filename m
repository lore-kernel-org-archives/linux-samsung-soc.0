From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/1] clk: exynos-5420: Fix VPLL lock offset
Date: Thu, 13 Mar 2014 12:53:00 +0100
Message-ID: <53219C1C.1030501@samsung.com>
References: <1394681222-27882-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:52181 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753385AbaCMLxT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 07:53:19 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2D00CMCICT8N60@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Mar 2014 11:53:17 +0000 (GMT)
In-reply-to: <1394681222-27882-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Sachin,

On 13.03.2014 04:27, Sachin Kamat wrote:
> Set it as per the user manual.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>   drivers/clk/samsung/clk-exynos5420.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
> index 60b26819bed5..7fd6bea467fd 100644
> --- a/drivers/clk/samsung/clk-exynos5420.c
> +++ b/drivers/clk/samsung/clk-exynos5420.c
> @@ -33,7 +33,7 @@
>   #define RPLL_LOCK		0x10050
>   #define IPLL_LOCK		0x10060
>   #define SPLL_LOCK		0x10070
> -#define VPLL_LOCK		0x10070
> +#define VPLL_LOCK		0x10080
>   #define MPLL_LOCK		0x10090
>   #define CPLL_CON0		0x10120
>   #define DPLL_CON0		0x10128
>

Looks fine. Will queue for 3.15, since ATM there is no support for PLL 
rate setting on Exynos 5420 (no rate tables registered).

Best regards,
Tomasz
