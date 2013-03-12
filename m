From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/4] clk: samsung: remove np check in clock init
Date: Tue, 12 Mar 2013 14:23:00 +0530
Message-ID: <CAJuYYwSU_pFoyHkzt=sP6AfN03F9V1_Rx+3o1ekbLHD4jC5SpA@mail.gmail.com>
References: <201303120042.09633.heiko@sntech.de>
	<201303120044.00803.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f181.google.com ([209.85.210.181]:33688 "EHLO
	mail-ia0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932295Ab3CLIxA convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Mar 2013 04:53:00 -0400
Received: by mail-ia0-f181.google.com with SMTP id w33so4505222iag.40
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Mar 2013 01:53:00 -0700 (PDT)
In-Reply-To: <201303120044.00803.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

On 12 March 2013 05:14, Heiko St=FCbner <heiko@sntech.de> wrote:
> This let to the suspend init never being reached on non-DT platforms.
>
> Signed-off-by: Heiko Stueber <heiko@sntech.de>
> ---
>  drivers/clk/samsung/clk.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index d36cdd5..1a5de69 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -57,8 +57,6 @@ void __init samsung_clk_init(struct device_node *np=
, void __iomem *base,
>                 unsigned long nr_rdump)
>  {
>         reg_base =3D base;
> -       if (!np)
> -               return;

Hi Heiko,

Sorry, I did not understand the need for this. Could you please add
few more details on this change.

Thanks,
Thomas.

>
>  #ifdef CONFIG_OF
>         clk_table =3D kzalloc(sizeof(struct clk *) * nr_clks, GFP_KER=
NEL);
> --
> 1.7.2.3
>
