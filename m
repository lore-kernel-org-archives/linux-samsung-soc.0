From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v5 3/5] clk/samsung: add support for pll2650xx
Date: Thu, 13 Mar 2014 15:50:13 +0100
Message-ID: <5321C5A5.9040808@samsung.com>
References: <1394636208-3125-1-git-send-email-rahul.sharma@samsung.com>
 <1394636208-3125-4-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:53766 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753001AbaCMOuQ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 10:50:16 -0400
In-reply-to: <1394636208-3125-4-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rahul Sharma <rahul.sharma@samsung.com>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: mturquette@linaro.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, pankaj.dubey@samsung.com

Hi Rahul,

On 12.03.2014 15:56, Rahul Sharma wrote:
> Add support for pll2650xx in samsung pll file. This PLL variant
> is close to pll36xx but uses CON2 registers instead of CON1.
>
> Aud_pll in Exynos5260 is pll2650xx and uses this code.
>
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
> ---
>   drivers/clk/samsung/clk-pll.c |  101 +++++++++++++++++++++++++++++++++++++++++
>   drivers/clk/samsung/clk-pll.h |    1 +
>   2 files changed, 102 insertions(+)

Applied with Pankaj's reviewed-by, thanks.

Best regards,
Tomasz
