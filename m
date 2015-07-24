From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH] clk: s2mps11: Use kcalloc instead of kzalloc for array
 allocation
Date: Fri, 24 Jul 2015 14:39:00 -0700
Message-ID: <20150724213900.GG15042@codeaurora.org>
References: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:36649 "EHLO
	smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752539AbbGXVjC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jul 2015 17:39:02 -0400
Content-Disposition: inline
In-Reply-To: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Michael Turquette <mturquette@baylibre.com>, "open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

On 07/22, Vaibhav Hiremath wrote:
> This patch cleans up the driver for,
> 
>   - Use devm_kcalloc varient instead of devm_kzalloc for array
>     allocation.
>   - clk_prepare/unprepare, remove "ret" variable as it is not required
>   - use __exit for cleanup function
> 
> As I am referring this driver as a reference for my 88pm800 clk driver,
> applying same changes here as well.
> 
> Signed-off-by: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
