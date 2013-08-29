From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk/exynos5250: change parent to aclk200_disp1 for hdmi subsystem
Date: Wed, 28 Aug 2013 19:24:07 -0700
Message-ID: <20130829022407.8231.37926@quantum>
References: <1377242219-30831-1-git-send-email-rahul.sharma@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:57894 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255Ab3H2CYO convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Aug 2013 22:24:14 -0400
Received: by mail-pb0-f46.google.com with SMTP id rq2so7018209pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2013 19:24:13 -0700 (PDT)
In-Reply-To: <1377242219-30831-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, inki.dae@samsung.com, s.nawrocki@samsung.com, thomas.abraham@linaro.org, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Quoting Rahul Sharma (2013-08-23 00:16:59)
> parent of hdmi and mixer block is mentioned as aclk200 which is
> not correct. It is clocked by the ouput of aclk200_disp1. Hence
> parent for mixer and hdmi clocks is changed to aclk200_disp1.
> 
> Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>

Taken into clk-next.

Thanks,
Mike

> ---
> This set is based on Mike's clk-next branch at
> https://git.linaro.org/gitweb?p=people/mturquette/linux.git
> 
>  drivers/clk/samsung/clk-exynos5250.c |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index a9916a4..d90e593 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -489,8 +489,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>         GATE(mie1, "mie1", "aclk200", GATE_IP_DISP1, 1, 0, 0),
>         GATE(dsim0, "dsim0", "aclk200", GATE_IP_DISP1, 3, 0, 0),
>         GATE(dp, "dp", "aclk200", GATE_IP_DISP1, 4, 0, 0),
> -       GATE(mixer, "mixer", "aclk200", GATE_IP_DISP1, 5, 0, 0),
> -       GATE(hdmi, "hdmi", "aclk200", GATE_IP_DISP1, 6, 0, 0),
> +       GATE(mixer, "mixer", "mout_aclk200_disp1", GATE_IP_DISP1, 5, 0, 0),
> +       GATE(hdmi, "hdmi", "mout_aclk200_disp1", GATE_IP_DISP1, 6, 0, 0),
>         GATE(g2d, "g2d", "aclk200", GATE_IP_ACP, 3, 0, 0),
>  };
>  
> -- 
> 1.7.10.4
