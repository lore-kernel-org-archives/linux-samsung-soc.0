From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Add a callback 'notify_after' for PWM
 backlight control
Date: Wed, 21 Dec 2011 13:32:58 +0900
Message-ID: <062101ccbf99$9df432f0$d9dc98d0$%kim@samsung.com>
References: <004001ccb877$4830abb0$d8920310$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18519 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751730Ab1LUEdB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Dec 2011 23:33:01 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ007HHDY30WA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 13:33:00 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ001SFDYYJPD0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 13:33:00 +0900 (KST)
In-reply-to: <004001ccb877$4830abb0$d8920310$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Banajit Goswami' <banajit.g@samsung.com>

Jingoo Han wrote:
> 
> The callback 'notify_after' was added to struct
> platform_pwm_backlight_data
> provided by PWM backlight driver. Therefore, this patch adds a callback
> 'notify_after' which can be called after pwm_enable, pwm_disable and
> pwm_config.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/plat-samsung/dev-backlight.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/dev-backlight.c b/arch/arm/plat-
> samsung/dev-backlight.c
> index e657305..90abd55 100644
> --- a/arch/arm/plat-samsung/dev-backlight.c
> +++ b/arch/arm/plat-samsung/dev-backlight.c
> @@ -116,6 +116,8 @@ void samsung_bl_set(struct samsung_bl_gpio_info
> *gpio_info,
>  		samsung_bl_data->init = bl_data->init;
>  	if (bl_data->notify)
>  		samsung_bl_data->notify = bl_data->notify;
> +	if (bl_data->notify_after)
> +		samsung_bl_data->notify_after = bl_data->notify_after;
>  	if (bl_data->exit)
>  		samsung_bl_data->exit = bl_data->exit;
>  	if (bl_data->check_fb)
> --
> 1.7.1

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
