From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 1/4] clk: samsung: register clk_div_tables for divider clocks
Date: Tue, 12 Mar 2013 14:20:34 +0530
Message-ID: <CAJuYYwS1FSNE5s8TAsTjdX49ZUHapOjRHqAiKqLgLPEV3QM1Uw@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120043.24557.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:43976 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754608Ab3CLIuf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 04:50:35 -0400
Received: by mail-ie0-f181.google.com with SMTP id 17so5970836iea.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 01:50:35 -0700 (PDT)
In-Reply-To: <201303120043.24557.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 05:13, Heiko St=FCbner <heiko@sntech.de> wrote:
> On some Samsung platforms divider clocks only use specific divider co=
mbinations
> like the armdiv on s3c2443 and s3c2416. For these usecases the generi=
c divider
> clock already provides the option of providing a lookup table mapping=
 register
> values to divider values.
>
> Therefore add a new field to samsung_div_clock and if filled with a t=
able,
> use clk_register_divider_table instead of clk_register_divider to reg=
ister
> a divider clock
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/samsung/clk.c |   14 +++++++++++---
>  drivers/clk/samsung/clk.h |   13 +++++++++----
>  2 files changed, 20 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 91d12f3..d36cdd5 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -183,9 +183,17 @@ void __init samsung_clk_register_div(struct sams=
ung_div_clock *list,
>         unsigned int idx, ret;
>
>         for (idx =3D 0; idx < nr_clk; idx++, list++) {
> -               clk =3D clk_register_divider(NULL, list->name, list->=
parent_name,
> -                       list->flags, reg_base + list->offset, list->s=
hift,
> -                       list->width, list->div_flags, &lock);
> +               if (list->table)
> +                       clk =3D clk_register_divider_table(NULL, list=
->name,
> +                                       list->parent_name, list->flag=
s,
> +                                       reg_base + list->offset, list=
->shift,
> +                                       list->width, list->div_flags,
> +                                       list->table, &lock);
> +               else
> +                       clk =3D clk_register_divider(NULL, list->name=
,
> +                                       list->parent_name, list->flag=
s,
> +                                       reg_base + list->offset, list=
->shift,
> +                                       list->width, list->div_flags,=
 &lock);
>                 if (IS_ERR(clk)) {
>                         pr_err("%s: failed to register clock %s\n", _=
_func__,
>                                 list->name);
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index 961192f..26a752b 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -150,9 +150,10 @@ struct samsung_div_clock {
>         u8                      width;
>         u8                      div_flags;
>         const char              *alias;
> +       struct clk_div_table    *table;
>  };
>
> -#define __DIV(_id, dname, cname, pname, o, s, w, f, df, a)     \
> +#define __DIV(_id, dname, cname, pname, o, s, w, f, df, a, t)  \
>         {                                                       \
>                 .id             =3D _id,                          \
>                 .dev_name       =3D dname,                        \
> @@ -164,16 +165,20 @@ struct samsung_div_clock {
>                 .width          =3D w,                            \
>                 .div_flags      =3D df,                           \
>                 .alias          =3D a,                            \
> +               .table          =3D t,                            \
>         }
>
>  #define DIV(_id, cname, pname, o, s, w)                             =
   \
> -       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL)
> +       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL, NULL)
>
>  #define DIV_A(_id, cname, pname, o, s, w, a)                   \
> -       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, a)
> +       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, a, NULL)
>
>  #define DIV_F(_id, cname, pname, o, s, w, f, df)               \
> -       __DIV(_id, NULL, cname, pname, o, s, w, f, df, NULL)
> +       __DIV(_id, NULL, cname, pname, o, s, w, f, df, NULL, NULL)
> +
> +#define DIV_T(_id, cname, pname, o, s, w, t)                   \
> +       __DIV(_id, NULL, cname, pname, o, s, w, 0, 0, NULL, t)
>
>  /**
>   * struct samsung_gate_clock: information about gate clock
> --
> 1.7.2.3
>

Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
