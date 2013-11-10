From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/3] clk: exynos5250: save/restore EPLL0 configuration
Date: Sun, 10 Nov 2013 18:01:28 +0100
Message-ID: <2334797.Ti06tGyoel@flatron>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:54100 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab3KJRB3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 12:01:29 -0500
Received: by mail-ee0-f44.google.com with SMTP id d41so1981184eek.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Nov 2013 09:01:28 -0800 (PST)
In-Reply-To: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Sachin, Andrew,

On Friday 08 of November 2013 15:44:06 Sachin Kamat wrote:
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
>  	SRC_CPU,
>  	DIV_CPU0,
>  	SRC_CORE1,
> +	EPLL_CON0,

What about EPLL_CON1 and EPLL_CON2? Also, have you considered register
restoration order?

Anyway, I believe it's not the correct way to restore PLL configuration.
See my Samsung PM consolidation series, especially patch [1] to see my
proposed way of handling this. (Beware of a bug that snuck into this patch
 - samsung_clk_save() is not being called for PLL registers.)

[1] http://thread.gmane.org/gmane.linux.kernel.samsung-soc/24078/focus=24087

Best regards,
Tomasz
