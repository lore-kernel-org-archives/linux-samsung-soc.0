From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 1/5] clk: samsung: exynos5250: Add CLK_IGNORE_UNUSED flag
 for the sysreg clock
Date: Wed, 11 Dec 2013 15:55:32 -0800
Message-ID: <CAD=FV=WK-zgcNvF6qtnsRky3RbEvBOW+1uNiUR-fyp2257gPPw@mail.gmail.com>
References: <1386763029-8516-1-git-send-email-a.kesavan@samsung.com>
	<1386763029-8516-2-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f177.google.com ([209.85.128.177]:61436 "EHLO
	mail-ve0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751709Ab3LKXzd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Dec 2013 18:55:33 -0500
Received: by mail-ve0-f177.google.com with SMTP id db12so6461827veb.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 11 Dec 2013 15:55:32 -0800 (PST)
In-Reply-To: <1386763029-8516-2-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abhilash Kesavan <a.kesavan@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, jonghwa3.lee@samsung.com, Yadwinder Singh Brar <yadi.brar@samsung.com>, Mike Turquette <mturquette@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Tomasz Figa <tomasz.figa@gmail.com>

Abhilash,

On Wed, Dec 11, 2013 at 3:57 AM, Abhilash Kesavan <a.kesavan@samsung.com> wrote:
> The sysreg (system register) generates control signals for various blocks
> like disp1blk, i2c, mipi etc. However, it gets disabled as an unused clock
> at boot-up.
>
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index adf3234..0833501 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -406,7 +406,8 @@ static struct samsung_gate_clock exynos5250_gate_clks[] __initdata = {
>         GATE(hsi2c2, "hsi2c2", "aclk66", GATE_IP_PERIC, 30, 0, 0),
>         GATE(hsi2c3, "hsi2c3", "aclk66", GATE_IP_PERIC, 31, 0, 0),
>         GATE(chipid, "chipid", "aclk66", GATE_IP_PERIS, 0, 0, 0),
> -       GATE(sysreg, "sysreg", "aclk66", GATE_IP_PERIS, 1, 0, 0),
> +       GATE(sysreg, "sysreg", "aclk66",
> +                       GATE_IP_PERIS, 1, CLK_IGNORE_UNUSED, 0),
>         GATE(pmu, "pmu", "aclk66", GATE_IP_PERIS, 2, CLK_IGNORE_UNUSED, 0),
>         GATE(tzpc0, "tzpc0", "aclk66", GATE_IP_PERIS, 6, 0, 0),
>         GATE(tzpc1, "tzpc1", "aclk66", GATE_IP_PERIS, 7, 0, 0),

This does match what's done in exynos4 and exynos5420 and it's not
terrible.  I'm always a fan of actually specifying clocks properly and
that's more possible now using the syscon stuff (see Leela Krishna's
watchdog patches).  You'd have to extend that to add a clock, but that
wouldn't be too hard.

That being said, I'd personally be OK with this solution for now (to
match the other exynos products), so:

Reviewed-by: Doug Anderson <dianders@chromium.org>
