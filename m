From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 3/4] clk: samsung: always allocate the clk_table
Date: Tue, 12 Mar 2013 15:24:47 +0530
Message-ID: <CAJuYYwT183EcZZ20P8D7AP34CwXfKYLzsmZdoJz1ny7XznzyAg@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120044.29499.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f170.google.com ([209.85.223.170]:45296 "EHLO
	mail-ie0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755206Ab3CLJyr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 05:54:47 -0400
Received: by mail-ie0-f170.google.com with SMTP id c11so6106511ieb.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 02:54:47 -0700 (PDT)
In-Reply-To: <201303120044.29499.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
> This is needed to allow looking up previous created clocks when
> adding separate aliases to them.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  drivers/clk/samsung/clk.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1a5de69..7c943f8 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -58,11 +58,11 @@ void __init samsung_clk_init(struct device_node *=
np, void __iomem *base,
>  {
>         reg_base =3D base;
>
> -#ifdef CONFIG_OF
>         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks, GFP_KER=
NEL);
>         if (!clk_table)
>                 panic("could not allocate clock lookup table\n");

This change is fine but one point that should be considered is that on
non-dt platforms, the memory allocation of clk_table cannot really be
justified just because few clocks require two or more aliases.

Instead, the optional alias passed for divider/mux register functions
can actually be a list of alias names, the list being terminated by a
zero-length string. The clock register helper functions can then loop
through that list and register all the aliases.

Thanks,
Thomas.

>
> +#ifdef CONFIG_OF
>         clk_data.clks =3D clk_table;
>         clk_data.clk_num =3D nr_clks;
>         of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
> --
> 1.7.2.3
>
