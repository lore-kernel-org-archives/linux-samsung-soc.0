From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] i2c: exynos5: Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS
 instead of open-coded
Date: Thu, 14 Apr 2016 15:26:41 +0200
Message-ID: <570F9A91.1060400@samsung.com>
References: <1460596084.6630.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26008 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753533AbcDNN0r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Apr 2016 09:26:47 -0400
In-reply-to: <1460596084.6630.1.camel@ingics.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: Kukjin Kim <kgene@kernel.org>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org

On 04/14/2016 03:08 AM, Axel Lin wrote:
> Use SET_NOIRQ_SYSTEM_SLEEP_PM_OPS to simplify the code.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
