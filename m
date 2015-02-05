From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [v3,1/9] clk: samsung: exynos5433: Add clocks for CMU_APOLLO domain
Date: Thu, 5 Feb 2015 22:42:36 +0900
Message-ID: <CAGTfZH1hMBgKCyTk+zmovOU5uFLpY-KHvJssXwFz8Zv1vXQEsw@mail.gmail.com>
References: <1422922437-7414-2-git-send-email-cw00.choi@samsung.com>
	<54D31F67.1050701@samsung.com>
	<54D33E66.30909@samsung.com>
Reply-To: cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54D33E66.30909-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Seung-Woo Kim <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, devicetree <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Pankaj and Sylwester,

On Thu, Feb 5, 2015 at 6:56 PM, Sylwester Nawrocki
<s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org> wrote:
> On 05/02/15 08:44, Pankaj Dubey wrote:
>>> +static struct samsung_gate_clock apollo_gate_clks[] __initdata = {
>
>>> > +
>>> > +  /* ENABLE_PCLK_APOLLO */
>>> > +  GATE(CLK_PCLK_ASAPBMST_CSSYS_APOLLO, "pclk_asapbmst_cssys_apollo",
>>> > +                  "div_pclk_dbg_apollo", ENABLE_PCLK_APOLLO,
>>> > +                  2, CLK_IGNORE_UNUSED, 0),
>>> > +  GATE(CLK_PCLK_PMU_APOLLO, "pclk_pmu_apollo", "div_pclk_apollo",
>>> > +                  ENABLE_PCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
>>> > +  GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_pmu_sysreg_apollo",
>>
>> Isn't "pclk_pmu_sysreg_apollo" be named as "pclk_sysreg_apollo" to match
>> with UM?

You're right. It is my mistake.
>
> Sounds reasonable, Chanwoo, if you agree I'll squash following change
> to this patch before sending upstream:

I agree.

>
> diff --git a/drivers/clk/samsung/clk-exynos5433.c
> b/drivers/clk/samsung/clk-exynos5433.c
> index 7a024cd..387e3e3 100644
> --- a/drivers/clk/samsung/clk-exynos5433.c
> +++ b/drivers/clk/samsung/clk-exynos5433.c
> @@ -3656,7 +3656,7 @@ static struct samsung_gate_clock apollo_gate_clks[]
> __initdata = {
>                         2, CLK_IGNORE_UNUSED, 0),
>         GATE(CLK_PCLK_PMU_APOLLO, "pclk_pmu_apollo", "div_pclk_apollo",
>                         ENABLE_PCLK_APOLLO, 1, CLK_IGNORE_UNUSED, 0),
> -       GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_pmu_sysreg_apollo",
> +       GATE(CLK_PCLK_SYSREG_APOLLO, "pclk_sysreg_apollo",
>                         "div_pclk_apollo", ENABLE_PCLK_APOLLO,
>                         0, CLK_IGNORE_UNUSED, 0),

Best Regards,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
