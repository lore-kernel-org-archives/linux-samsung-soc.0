From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] clk: s2mps11: Use kcalloc instead of kzalloc for array
 allocation
Date: Thu, 23 Jul 2015 09:38:21 +0900
Message-ID: <55B0377D.10908@samsung.com>
References: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:29789 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751236AbbGWAiZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 22 Jul 2015 20:38:25 -0400
In-reply-to: <1437557693-29433-1-git-send-email-vaibhav.hiremath@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vaibhav Hiremath <vaibhav.hiremath@linaro.org>, linux-arm-kernel@lists.infradead.org
Cc: Sangbeom Kim <sbkim73@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, "open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-kernel@vger.kernel.org>, "open list:SAMSUNG MULTIFUNCTION PMIC DEVICE DRIVERS" <linux-samsung-soc@vger.kernel.org>, "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>

On 22.07.2015 18:34, Vaibhav Hiremath wrote:
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
> Since I do not have platform to test, it would be helpful if someone
> tests it for me.
> I have build tested it.
> 
>  drivers/clk/clk-s2mps11.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)

Looks good, simplifies the code and fixes the __init/__exit.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
