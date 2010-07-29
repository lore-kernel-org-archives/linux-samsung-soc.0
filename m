From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH v5 3/7] ARM: S5P: Added default pll values for APLL 800/1000MHz
Date: Thu, 29 Jul 2010 15:11:20 +0400
Message-ID: <4C5161D8.1010609@ru.mvista.com>
References: <1280399145-22761-1-git-send-email-myungjoo.ham@samsung.com>	<1280399145-22761-2-git-send-email-myungjoo.ham@samsung.com>	<1280399145-22761-3-git-send-email-myungjoo.ham@samsung.com> <1280399145-22761-4-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:61494 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752731Ab0G2LMk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 07:12:40 -0400
Received: by eya25 with SMTP id 25so56728eya.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 29 Jul 2010 04:12:39 -0700 (PDT)
In-Reply-To: <1280399145-22761-4-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: MyungJoo Ham <myungjoo.ham@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org

Hello.

MyungJoo Ham wrote:

> CPUFREQ of S5PV210 uses different APLL settings according to
> different CPU frequencies. We provide such settings values for
> CPUFREQ at pll.h.

> Note that at 1GHz of ARMCLK, APLL should be 1GHz and for other lower
> ARMCLK, APLL should be 800MHz.

> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
[...]
> diff --git a/arch/arm/plat-s5p/include/plat/pll.h b/arch/arm/plat-s5p/include/plat/pll.h
> index 7db3227..d79042a 100644
> --- a/arch/arm/plat-s5p/include/plat/pll.h
> +++ b/arch/arm/plat-s5p/include/plat/pll.h
> @@ -21,6 +21,9 @@
>  
>  #include <asm/div64.h>
>  
> +#define PLL45XX_APLL_VAL_1000	((1 << 31) | (125<<16) | (3<<8) | (1))
> +#define PLL45XX_APLL_VAL_800	((1 << 31) | (100<<16) | (3<<8) | (1))
> +

   Incosistent spacing. Why there spaces around the first << but not around 
the following? Should be spaces around every <<...


WBR, Sergei
