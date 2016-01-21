From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 7/8] ARM: exynos_defconfig: Remove MAX77802 RTC Kconfig
 symbol
Date: Thu, 21 Jan 2016 10:58:18 +0900
Message-ID: <56A03B3A.40709@samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
 <1453310088-29985-8-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:47009 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751648AbcAUB6W (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 20:58:22 -0500
In-reply-to: <1453310088-29985-8-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 21.01.2016 02:14, Javier Martinez Canillas wrote:
> The driver has been removed so the Kconfig symbol is not valid anymore.
> 
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> ---
> 
>  arch/arm/configs/exynos_defconfig | 1 -
>  1 file changed, 1 deletion(-)

The patch should go after merging rtc-max77802 into rtc-max77686 to
preserve bisectability on defconfig.

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
