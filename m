From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 1/3] clk: s2mps11: Add support for S2MPS14 clocks
Date: Thu, 13 Mar 2014 15:33:23 +0100
Message-ID: <5321C1B3.2050806@samsung.com>
References: <1394703425-6462-1-git-send-email-k.kozlowski@samsung.com>
 <1394703425-6462-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:55712 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753180AbaCMOd0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 10:33:26 -0400
In-reply-to: <1394703425-6462-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Hi Krzysztof,

On 13.03.2014 10:37, Krzysztof Kozlowski wrote:
> This patch adds support for S2MPS14 PMIC clocks (BT and AP) to the
> s2mps11 clock driver.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> ---
>   drivers/clk/Kconfig       |    8 +++---
>   drivers/clk/clk-s2mps11.c |   61 ++++++++++++++++++++++++++++++++++-----------
>   2 files changed, 50 insertions(+), 19 deletions(-)

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
