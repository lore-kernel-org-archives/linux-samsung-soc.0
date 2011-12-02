From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: S5PV210: Add USB OTG gadget device support to SMDKV210
 board
Date: Fri, 02 Dec 2011 09:11:51 +0530
Message-ID: <4ED848FF.9070103@linaro.org>
References: <1322538455-31748-1-git-send-email-jg1.han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:45864 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756485Ab1LBDlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Dec 2011 22:41:35 -0500
Received: by iage36 with SMTP id e36so3487702iag.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Dec 2011 19:41:34 -0800 (PST)
In-Reply-To: <1322538455-31748-1-git-send-email-jg1.han@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Jingoo,

On Tuesday 29 November 2011 09:17 AM, Jingoo Han wrote:
[ snip ]
> diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
[ snip ]
> @@ -308,6 +310,8 @@ static void __init smdkv210_machine_init(void)
>
>   	samsung_bl_set(&smdkv210_bl_gpio_info,&smdkv210_bl_data);
>
> +	clk_xusbxti.rate = 24000000;
> +
Would it be a good idea to set the default rate of clk_xusbxti in 
arch/arm/plat-s5p/clock.c and remove the explicit rate setting in all 
the machine files?

Currently, the clock is also set in machine files for which ehci is enabled.
>   	platform_add_devices(smdkv210_devices, ARRAY_SIZE(smdkv210_devices));
>   }
>

-- 
Tushar Behera
