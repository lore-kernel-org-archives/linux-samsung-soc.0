From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v4 07/10] rtc: max77686: Fix unsupported year message
Date: Wed, 27 Jan 2016 13:24:19 +0900
Message-ID: <56A84673.5040806@samsung.com>
References: <1453865806-4661-1-git-send-email-javier@osg.samsung.com>
 <1453865806-4661-8-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:56465 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751021AbcA0EY0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2016 23:24:26 -0500
In-reply-to: <1453865806-4661-8-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org

On 27.01.2016 12:36, Javier Martinez Canillas wrote:
> The max77686 RTC only supports a range of 99 years so instead of using
> year 1900 as the base, the year 2000 is used. This means that 1900 to
> 1999 are unsupported years.
> 
> The driver was printing a warning for those values but was returning a
> error so for consistency, print an error message instead and don't say
> that a year 2000 is assumed, since the year is not set.
> 
> Also, it is better to use dev_* log functions instead of pr_* to print
> information about the device in the kernel log in a standardized way.
> 
> This also allows to remove the local pr_fmt() defined macro.
> 
> Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 
> ---
> 
> Changes in v4:
> - Use dev_err() instead of dev_warn() and change message.
>   Suggested by Krzysztof Kozlowski and Andi Shyti.
> - Change subject line and commit message of patch #7.
> - Removed Laxman Dewangan's Acked-by tag since the patch changed.
> 
> Changes in v3:
> - Add Laxman Dewangan's Acked-by tag to patch #7.
> 
> Changes in v2: None
> 
>  drivers/rtc/rtc-max77686.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
