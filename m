From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Samsung: Make uart_save static in pm.c file
Date: Tue, 07 Aug 2012 19:52:31 +0900
Message-ID: <099201cd748a$becdce40$3c696ac0$%kim@samsung.com>
References: <1343889644-27266-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54221 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753507Ab2HGKwe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Aug 2012 06:52:34 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M8D009XWSVD2L40@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:52:33 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M8D00EAMSVJZQB0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 07 Aug 2012 19:52:31 +0900 (KST)
In-reply-to: <1343889644-27266-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Fixes the following sparse warning:
> arch/arm/plat-samsung/pm.c:77:21:
> warning: symbol 'uart_save' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/plat-samsung/pm.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
> index 64ab65f..1507028 100644
> --- a/arch/arm/plat-samsung/pm.c
> +++ b/arch/arm/plat-samsung/pm.c
> @@ -74,7 +74,7 @@ unsigned char pm_uart_udivslot;
> 
>  #ifdef CONFIG_SAMSUNG_PM_DEBUG
> 
> -struct pm_uart_save uart_save[CONFIG_SERIAL_SAMSUNG_UARTS];
> +static struct pm_uart_save uart_save[CONFIG_SERIAL_SAMSUNG_UARTS];
> 
>  static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save
*save)
>  {
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
