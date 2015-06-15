From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [question] [PATCH RFC] clocksource: exynos_mct: remove unneeded
 container_of()
Date: Mon, 15 Jun 2015 12:39:16 -0700
Message-ID: <20150615193916.GJ29640@codeaurora.org>
References: <1434322238.5390.16.camel@mtux>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:43532 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754117AbbFOTjS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Jun 2015 15:39:18 -0400
Content-Disposition: inline
In-Reply-To: <1434322238.5390.16.camel@mtux>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexey Klimov <klimov.linux@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, t.dakhran@gmail.com, yury.norov@gmail.com, kgene@kernel.org, k.kozlowski@samsung.com, thomas.abraham@linaro.org

On 06/15, Alexey Klimov wrote:
> 
> Patch removes unneeded container_of() macro
> in exynos4_local_timer_setup(). Instead let's pass mevt pointer
> to setup and stop functions from exynos4_mct_cpu_notify() 
> and let them get evt pointer.
> 
> Signed-off-by: Alexey Klimov <klimov.linux@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@codeaurora.org>

It was done this way to minimize the diff. I don't see any
problem changing it as you propose.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
