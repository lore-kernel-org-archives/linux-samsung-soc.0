From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V2 05/10] clk/samsung: add support for pll2550xx
Date: Thu, 23 Jan 2014 19:40:06 +0100
Message-ID: <52E16206.2020801@samsung.com>
References: <1389099548-14649-1-git-send-email-rahul.sharma@samsung.com>
 <1389099548-14649-6-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:63794 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753637AbaAWSkX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:40:23 -0500
In-reply-to: <1389099548-14649-6-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, thomas.ab@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, Pankaj Dubey <pankaj.dubey@samsung.com>

On 07.01.2014 13:59, Rahul Sharma wrote:
> From: Pankaj Dubey <pankaj.dubey@samsung.com>
>
> exynos5260 use pll2550xx and it has different bit fields
> for P,M,S values as compared to pll2550. Support for
> pll2550xx is added here.
>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
> ---
>   drivers/clk/samsung/clk-pll.c |  108 +++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |    1 +
>   2 files changed, 109 insertions(+)

Acked-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
