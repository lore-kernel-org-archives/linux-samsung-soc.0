From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH 3/9] clk: samsung: exynos4: Move suspend/resume handling
 to SoC driver
Date: Thu, 17 Oct 2013 19:12:08 +0530
Message-ID: <CAKew6eV7Hd1x1+YLR9rjzNgYu0t=9Q8BG23VUvhPJTf77bsRXQ@mail.gmail.com>
References: <1381921698-5060-1-git-send-email-t.figa@samsung.com>
	<1381921698-5060-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f173.google.com ([209.85.223.173]:43888 "EHLO
	mail-ie0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755429Ab3JQNmJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 17 Oct 2013 09:42:09 -0400
Received: by mail-ie0-f173.google.com with SMTP id u16so3812950iet.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 17 Oct 2013 06:42:08 -0700 (PDT)
In-Reply-To: <1381921698-5060-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Kyungmin Park <kyungmin.park@samsung.com>, Rahul Sharma <rahul.sharma@samsung.com>, Thomas Abraham <thomas.abraham@linaro.org>, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>

Hi Tomasz,

[ ... ]
>  /*
>   * list of controller registers to be saved and restored during a
>   * suspend/resume cycle.
> @@ -288,6 +299,70 @@ static unsigned long exynos4_clk_regs[] __initdata = {
>         GATE_IP_CPU,
>  };
>
> +static int exynos4_clk_suspend(void)
> +{
> +       samsung_clk_save(reg_base, exynos4_save_common,
> +                               ARRAY_SIZE(exynos4_clk_regs));

a doubt here, Is sizeof(exynos4_clk_regs) works with
exynos4_clk_regs[] as __initdata ?

> +
> +       if (exynos4_soc == EXYNOS4210)
> +               samsung_clk_save(reg_base, exynos4_save_soc,
> +                                       ARRAY_SIZE(exynos4210_clk_save));

[ ... ]
> +static void exynos4_clk_sleep_init(void)

I think, this fuction can be placed in __init section.

Same in other patches as well.

Regards,
Yadwinder
