From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 2/2] mfd: sec-core: Modify RTC compatible name of S2MPS13
Date: Tue, 17 Mar 2015 10:57:34 +0100
Message-ID: <1426586254.16027.1.camel@AMDC1943>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
 <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:51056 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932589AbbCQJ5h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Mar 2015 05:57:37 -0400
In-reply-to: <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On wto, 2015-03-17 at 10:54 +0100, Krzysztof Kozlowski wrote:
> From: Chanwoo Choi <cw00.choi@samsung.com>
> 
> This patch modify the RTC compatible name of S2MPS13 because S2MPS13's RTC is
> equal to S2MPS14's RTC.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>


Tested on Exynos5433 board with S2MPS13 PMIC.
Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

I feel like talking to myself with this self-reply... but at least this
leaves a public track :).

Best regards,
Krzysztof
