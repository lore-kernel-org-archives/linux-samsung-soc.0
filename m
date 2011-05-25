From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH 6/7] ARM: S5PV210: Add clkdev support
Date: Wed, 25 May 2011 14:39:25 -0700
Message-ID: <4DDD770D.5020902@samsung.com>
References: <1305839906-1815-1-git-send-email-thomas.ab@samsung.com> <1305839906-1815-7-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:62826 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756094Ab1EYVj3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 May 2011 17:39:29 -0400
Received: by pwi15 with SMTP id 15so63672pwi.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 May 2011 14:39:28 -0700 (PDT)
In-Reply-To: <1305839906-1815-7-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On 05/19/11 14:18, Thomas Abraham wrote:
> Add clkdev support for Samsung's s5pv210 platform.
>
> Signed-off-by: Thomas Abraham<thomas.ab@samsung.com>
> ---
>   arch/arm/Kconfig                            |    1 +
>   arch/arm/mach-s5pv210/clock.c               |   42 ++++++++++++++++++++++++++-
>   arch/arm/mach-s5pv210/include/mach/clkdev.h |    7 ++++
>   3 files changed, 49 insertions(+), 1 deletions(-)
>   create mode 100644 arch/arm/mach-s5pv210/include/mach/clkdev.h
>

(snip)

> @@ -366,30 +371,34 @@ static struct clk init_clocks_off[] = {
>   		.ctrlbit	= (1<<0),
>   	}, {
>   		.name		= "cfcon",
> -		.id		= 0,
> +		.id		= -1,

Should be split.

-- 
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
