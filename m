From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 3/8] clk: max77686: Refactor successful exit of probe function
Date: Mon, 21 Oct 2013 15:11:21 +0530
Message-ID: <CAK9yfHxesuwz-+ERYJ2joHZ4_O04E7e3ZSjYWQUDxfV7Wxoebw@mail.gmail.com>
References: <1382027442-1992-1-git-send-email-t.figa@samsung.com>
	<1382027442-1992-4-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f48.google.com ([209.85.160.48]:55675 "EHLO
	mail-pb0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752846Ab3JUJlW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Oct 2013 05:41:22 -0400
Received: by mail-pb0-f48.google.com with SMTP id ma3so6740325pbc.35
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Oct 2013 02:41:21 -0700 (PDT)
In-Reply-To: <1382027442-1992-4-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, devicetree@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Mike Turquette <mturquette@linaro.org>, Samuel Ortiz <sameo@linux.intel.com>, Lee Jones <lee.jones@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>

Hi Tomasz,

On 17 October 2013 22:00, Tomasz Figa <t.figa@samsung.com> wrote:
> The function can simply return 0, without jumping to a separate label,
> which does exactly the same. This patch does not introduce any
> functional change, just a clean-up.
>
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/clk/clk-max77686.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/clk/clk-max77686.c b/drivers/clk/clk-max77686.c
> index e40ecdb..5d78460 100644
> --- a/drivers/clk/clk-max77686.c
> +++ b/drivers/clk/clk-max77686.c
> @@ -178,7 +178,7 @@ static int max77686_clk_probe(struct platform_device *pdev)
>
>         platform_set_drvdata(pdev, max77686_clks);
>
> -       goto out;
> +       return 0;
>
>  err_clk_pmic:
>         clkdev_drop(max77686_clks[MAX77686_CLK_CP]->lookup);
> @@ -187,7 +187,6 @@ err_clk_cp:
>         clkdev_drop(max77686_clks[MAX77686_CLK_AP]->lookup);
>         kfree(max77686_clks[MAX77686_CLK_AP]->hw.clk);
>  err_clk_ap:

You could probably do the same for this label too.

> -out:
>         return ret;
>  }
>

-- 
With warm regards,
Sachin
