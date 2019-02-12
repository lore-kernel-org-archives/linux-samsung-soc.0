From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH] clk: samsung: s3c2443: Mark expected switch
 fall-through
Date: Tue, 12 Feb 2019 09:37:49 +0900
Message-ID: <effba950-8fcf-2d96-827d-25d20ae60f1d@samsung.com>
References: <CGME20190211181544epcas4p1d899221776a647a5bdf21372304bf0d7@epcas4p1.samsung.com>
        <20190211181531.GA3238@embeddedor>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211181531.GA3238@embeddedor>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Gustavo,

On 19. 2. 12. 오전 3:15, Gustavo A. R. Silva wrote:
> In preparation to enabling -Wimplicit-fallthrough, mark switch
> cases where we are expecting to fall through.
> 
> This patch fixes the following warnings:
> 
> drivers/clk/samsung/clk-s3c2443.c: In function ‘s3c2443_common_clk_init’:
> drivers/clk/samsung/clk-s3c2443.c:390:3: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    samsung_clk_register_alias(ctx, s3c2450_aliases,
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>      ARRAY_SIZE(s3c2450_aliases));
>      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/clk/samsung/clk-s3c2443.c:393:2: note: here
>   case S3C2416:
>   ^~~~
> 
> Warning level 3 was used: -Wimplicit-fallthrough=3
> 
> Notice that, in this particular case,  the code comment is modified
> in accordance with what GCC is expecting to find.
> 
> This patch is part of the ongoing efforts to enable
> -Wimplicit-fallthrough.

Except for level 5 of -Wimplicit-fallthrough,
level 4 is more strict to show the warnings.
Why don't you support level 4 for -Wimplicit-fallthrough?
I think that you want to fix for -Wimplicit-fallthrough warning,
you better to support level 4. What do you think?


> 
> Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
> ---
>  drivers/clk/samsung/clk-s3c2443.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/samsung/clk-s3c2443.c b/drivers/clk/samsung/clk-s3c2443.c
> index 884067e4f1a1..f38f0e24e3b6 100644
> --- a/drivers/clk/samsung/clk-s3c2443.c
> +++ b/drivers/clk/samsung/clk-s3c2443.c
> @@ -389,7 +389,7 @@ void __init s3c2443_common_clk_init(struct device_node *np, unsigned long xti_f,
>  				ARRAY_SIZE(s3c2450_gates));
>  		samsung_clk_register_alias(ctx, s3c2450_aliases,
>  				ARRAY_SIZE(s3c2450_aliases));
> -		/* fall through, as s3c2450 extends the s3c2416 clocks */
> +		/* fall through - as s3c2450 extends the s3c2416 clocks */
>  	case S3C2416:
>  		samsung_clk_register_div(ctx, s3c2416_dividers,
>  				ARRAY_SIZE(s3c2416_dividers));
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
