From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 2/5] clk/samsung: add support for pll2550xx
Date: Thu, 13 Mar 2014 15:49:17 +0100
Message-ID: <5321C56D.90002@samsung.com>
References: <1394636208-3125-1-git-send-email-rahul.sharma@samsung.com>
 <1394636208-3125-3-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53700 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753446AbaCMOtW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 10:49:22 -0400
In-reply-to: <1394636208-3125-3-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, pankaj.dubey@samsung.com, Arun Kumar K <arun.kk@samsung.com>

Hi Rahul,

On 12.03.2014 15:56, Rahul Sharma wrote:
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

Applied, thanks.

Best regards,
Tomasz
