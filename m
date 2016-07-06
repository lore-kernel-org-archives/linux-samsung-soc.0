From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH] arm64: defconfig: Enable s2mps11 regulator clk and s3c rtc
 driver
Date: Wed, 06 Jul 2016 08:03:24 +0200
Message-ID: <577C9F2C.4040509@samsung.com>
References: <1467713211-16014-1-git-send-email-alim.akhtar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:29269 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750832AbcGFGD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2016 02:03:29 -0400
In-reply-to: <1467713211-16014-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com

On 07/05/2016 12:06 PM, Alim Akhtar wrote:
> The s3c rtc controller on exynos7 platform uses rtc source clock
> from s2mps11 pmic. This patch enables the required bits to make
> rtc work on exynos7-espresso board.
> 
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/configs/defconfig |    2 ++
>  1 file changed, 2 insertions(+)

Thanks, applied, with changed commit title and message. Any more arm64
defconfig changes coming soon?

Best regards,
Krzysztof
