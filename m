From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 1/7] PM / Domains: Add a note about power domain subdomains
Date: Wed, 14 Jan 2015 14:55:19 +0100
Message-ID: <CAMuHMdVCAYMpz4x8Re9X75CDxSFpOw-k5o+PfANWxUq5MYsELw@mail.gmail.com>
References: <1421243091-10778-1-git-send-email-m.szyprowski@samsung.com>
	<1421243091-10778-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:38845 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752387AbbANNzU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 08:55:20 -0500
In-Reply-To: <1421243091-10778-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

Hi Marek,

On Wed, Jan 14, 2015 at 2:44 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> This patch adds a note on defining subdomains to generic PM domain
> binding documentation to let power domain providers use common approach
> for defining power domain hierarchy.

Thanks!

> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/power/power_domain.txt     | 29 ++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/power/power_domain.txt b/Documentation/devicetree/bindings/power/power_domain.txt
> index 98c1667..eeea45b 100644
> --- a/Documentation/devicetree/bindings/power/power_domain.txt
> +++ b/Documentation/devicetree/bindings/power/power_domain.txt
> @@ -19,6 +19,16 @@ Required properties:
>     providing multiple PM domains (e.g. power controllers), but can be any value
>     as specified by device tree binding documentation of particular provider.
>
> +Optional properties:
> + - power-domains : A phandle and PM domain specifier as defined by bindings of
> +                   the power controller specified by phandle.
> +   Some power domains might be powered from other power domain (or have

s/other/another/

> +   other hardware specific dependency). For representing such dependency

s/dependency/dependencies/ (twice)

> +   a standard PM domain consumer binging is used. When provided, all domains

binding

> +   created by the given provider should be a subdomain of the domain

s/a subdomain/subdomains/

> +   specified by this binding. More details about power domain specifier is

s/is/are/

> +   available in the the next section.

duplicate "the"

> +
>  Example:
>
>         power: power-controller@12340000 {
> @@ -30,6 +40,25 @@ Example:
>  The node above defines a power controller that is a PM domain provider and
>  expects one cell as its phandle argument.
>
> +Example 2:
> +
> +       parent: power-controller@12340000 {
> +               compatible = "foo,power-controller";
> +               reg = <0x12340000 0x1000>;
> +               #power-domain-cells = <1>;
> +       };
> +
> +       child: power-controller@12340000 {
> +               compatible = "foo,power-controller";
> +               reg = <0x12341000 0x1000>;
> +               power-domains = <&parent 0>;
> +               #power-domain-cells = <1>;
> +       };
> +
> +The nodes above defines two power controllers: 'parent' and 'child'.

s/defines/define/

> +Domains created by 'child' power controller are subdomains of '0' power

the 'child' power controller

> +domain provided by 'parent' power controller.

the 'parent' power controller.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
