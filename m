From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 0/4] ARM: SAMSUNG: Add __init attribute to functions calling
 s3c_set_platdata
Date: Fri, 09 Mar 2012 08:04:04 -0800
Message-ID: <4F5A29F4.7020308@samsung.com>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:57185 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932280Ab2CIQEK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 Mar 2012 11:04:10 -0500
Received: by yhmm54 with SMTP id m54so916294yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 09 Mar 2012 08:04:09 -0800 (PST)
In-Reply-To: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

On 03/01/12 01:17, Tushar Behera wrote:
> The function s3c_set_platdata is defined with __init attribute, hence the
> functions calling s3c_set_platdata should also be defined with __init
> attribute.
>
> Even though all the modified functions are called from xxx_machine_init()
> functions, it is still better to define each of them with __init attribute.
>
> Tushar Behera (4):
>    ARM: EXYNOS: Add __init attribute to nuri_camera_init()
>    ARM: EXYNOS: Add __init attribute to universal_camera_init()
>    ARM: SAMSUNG: Add __init attribute to samsung_bl_set()
>    ARM: SAMSUNG: Add __init attribute to xxx_set_platdata() wrappers
>
>   arch/arm/mach-exynos/mach-nuri.c           |    2 +-
>   arch/arm/mach-exynos/mach-universal_c210.c |    2 +-
>   arch/arm/plat-samsung/dev-backlight.c      |    2 +-
>   arch/arm/plat-samsung/devs.c               |    4 ++--
>   4 files changed, 5 insertions(+), 5 deletions(-)
>
Looks good to me, applied.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
