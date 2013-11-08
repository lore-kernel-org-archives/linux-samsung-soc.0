From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/3] clk: exynos5250: save/restore EPLL0 configuration
Date: Fri, 8 Nov 2013 15:51:26 +0530
Message-ID: <CAK9yfHwU6NLdB1QYn0FJKSaAw5u9yXc6KkdXSom8ZOL2RZAsPg@mail.gmail.com>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:59203 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757152Ab3KHKV1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Nov 2013 05:21:27 -0500
Received: by mail-ob0-f171.google.com with SMTP id gq1so1321505obb.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Nov 2013 02:21:26 -0800 (PST)
In-Reply-To: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Andrew Bresticker <abrestic@chromium.org>

On 8 November 2013 15:44, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
>
> The EPLL configuration register needs to be saved across
> suspend/resume.
>
> Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  drivers/clk/samsung/clk-exynos5250.c |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
> index ee866e377c80..6767635dc895 100644
> --- a/drivers/clk/samsung/clk-exynos5250.c
> +++ b/drivers/clk/samsung/clk-exynos5250.c
> @@ -143,6 +143,7 @@ static unsigned long exynos5250_clk_regs[] __initdata = {
>         SRC_CPU,
>         DIV_CPU0,
>         SRC_CORE1,
> +       EPLL_CON0,
>         SRC_TOP0,
>         SRC_TOP2,
>         SRC_TOP3,
> --
> 1.7.9.5
>

Forgot to mention that this series is based on top of Tomasz Figa's
Exynos5250 cleanup series.
http://www.spinics.net/lists/arm-kernel/msg280039.html

-- 
With warm regards,
Sachin
