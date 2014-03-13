From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 1/5] clk/samsung: add support for multiple clock
 providers
Date: Thu, 13 Mar 2014 15:44:13 +0100
Message-ID: <5321C43D.80100@samsung.com>
References: <1394636208-3125-1-git-send-email-rahul.sharma@samsung.com>
 <1394636208-3125-2-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:61968 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191AbaCMOoS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 10:44:18 -0400
In-reply-to: <1394636208-3125-2-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, pankaj.dubey@samsung.com

Hi Rahul,

On 12.03.2014 15:56, Rahul Sharma wrote:
> Samsung CCF helper functions do not provide support to
> register multiple Clock Providers for a given SoC. Due to
> this limitation, SoC platforms are not able to use these
> helpers for registering multiple clock providers and are
> forced to bypass this layer.
>
> This layer is modified accordingly to enable the support
> for multiple clock providers.
>
> Clock file for exynos4, exynos5250, exynos5420, exynos5440,
> S3c64xx, S3c2412 and S3c2443 are also modified as per changed
> helper functions.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>   drivers/clk/samsung/clk-exynos4.c    |   47 +++++++-------
>   drivers/clk/samsung/clk-exynos5250.c |   25 +++++---
>   drivers/clk/samsung/clk-exynos5420.c |   24 ++++---
>   drivers/clk/samsung/clk-exynos5440.c |   18 +++---
>   drivers/clk/samsung/clk-pll.c        |   14 +++--
>   drivers/clk/samsung/clk-s3c2412.c    |   29 +++++----
>   drivers/clk/samsung/clk-s3c2443.c    |   46 +++++++-------
>   drivers/clk/samsung/clk-s3c64xx.c    |   44 +++++++------
>   drivers/clk/samsung/clk.c            |  114 ++++++++++++++++++----------------
>   drivers/clk/samsung/clk.h            |   72 ++++++++++++++-------
>   10 files changed, 251 insertions(+), 182 deletions(-)

Applied, thanks.

Best regards,
Tomasz
