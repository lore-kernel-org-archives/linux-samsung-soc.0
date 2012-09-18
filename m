From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/2] ARM: SAMSUNG: Add check for NULL in clock interface
Date: Tue, 18 Sep 2012 09:47:27 +0530
Message-ID: <CAJuYYwR9ttbL9oknv7L60GnS3U1c_MX0Qddr6fg1zh7T1LzR=w@mail.gmail.com>
References: <1346941534-4501-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:38669 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751468Ab2IRER3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Sep 2012 00:17:29 -0400
Received: by lbbgj3 with SMTP id gj3so4696482lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Sep 2012 21:17:28 -0700 (PDT)
In-Reply-To: <1346941534-4501-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chander Kashyap <chander.kashyap@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 6 September 2012 19:55, Chander Kashyap <chander.kashyap@linaro.org> wrote:
> The clock instance parameter in Samsung clock interface is not being checked
> for NULL pointers. Add checks for NULL pointers.
>
> Signed-off-by: Chander Kashyap <chander.kashyap@linaro.org>
> ---
>  arch/arm/plat-samsung/clock.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/clock.c b/arch/arm/plat-samsung/clock.c
> index 65c5eca..7938fbc 100644
> --- a/arch/arm/plat-samsung/clock.c
> +++ b/arch/arm/plat-samsung/clock.c
> @@ -119,7 +119,7 @@ void clk_disable(struct clk *clk)
>
>  unsigned long clk_get_rate(struct clk *clk)
>  {
> -       if (IS_ERR(clk))
> +       if (IS_ERR_OR_NULL(clk))
>                 return 0;
>
>         if (clk->rate != 0)
> @@ -136,7 +136,7 @@ unsigned long clk_get_rate(struct clk *clk)
>
>  long clk_round_rate(struct clk *clk, unsigned long rate)
>  {
> -       if (!IS_ERR(clk) && clk->ops && clk->ops->round_rate)
> +       if (!IS_ERR_OR_NULL(clk) && clk->ops && clk->ops->round_rate)
>                 return (clk->ops->round_rate)(clk, rate);
>
>         return rate;
> @@ -146,7 +146,7 @@ int clk_set_rate(struct clk *clk, unsigned long rate)
>  {
>         int ret;
>
> -       if (IS_ERR(clk))
> +       if (IS_ERR_OR_NULL(clk))
>                 return -EINVAL;
>
>         /* We do not default just do a clk->rate = rate as
> @@ -175,7 +175,7 @@ int clk_set_parent(struct clk *clk, struct clk *parent)
>  {
>         int ret = 0;
>
> -       if (IS_ERR(clk))
> +       if (IS_ERR_OR_NULL(clk) || IS_ERR_OR_NULL(parent))
>                 return -EINVAL;
>
>         spin_lock(&clocks_lock);
> --
> 1.7.9.5

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>
