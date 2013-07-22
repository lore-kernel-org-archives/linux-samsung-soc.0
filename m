From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] clk: exynos4: Add CLK_GET_RATE_NOCACHE flag for the
 Exynos4x12 ISP clocks
Date: Mon, 22 Jul 2013 14:14:40 +0200
Message-ID: <51ED2230.8080100@samsung.com>
References: <1372099374-21008-1-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:30110 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751767Ab3GVMOo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 08:14:44 -0400
In-reply-to: <1372099374-21008-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: mturquette@linaro.org
Cc: linux-kernel@vger.kernel.org, kyungmin.park@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 06/24/2013 08:42 PM, Sylwester Nawrocki wrote:
> The ISP clock registers belong to the ISP power domain and may change
> their values if this power domain is switched off/on. Add
> CLK_GET_RATE_NOCACHE flags to ensure we do not rely on invalid cached
> data when setting or getting frequency of those clocks.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Mike,

would you consider queueing that patch for current -rc cycle ?

Thanks,
Sylwester
