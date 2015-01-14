From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v3 1/7 RESEND] PM / Domains: Add a note about power domain subdomains
Date: Wed, 14 Jan 2015 16:09:02 +0100
Message-ID: <CAPDyKFp68ggbvf0M_co4-eBcrKf7XuOXUNQUgWRY-Do_-ipgGw@mail.gmail.com>
References: <1421243091-10778-2-git-send-email-m.szyprowski@samsung.com>
	<1421244735-10844-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f45.google.com ([209.85.192.45]:44943 "EHLO
	mail-qg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753976AbbANPJD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 10:09:03 -0500
Received: by mail-qg0-f45.google.com with SMTP id z107so7304024qgd.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2015 07:09:02 -0800 (PST)
In-Reply-To: <1421244735-10844-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>

On 14 January 2015 at 15:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> This patch adds a note on defining subdomains to generic PM domain
> binding documentation to let power domain providers use common approach
> for defining power domain hierarchy.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
> RESEND version:
> - fixed spelling mistakes, thanks go to Geert!
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
> +   Some power domains might be powered from another power domain (or have
> +   other hardware specific dependencies). For representing such dependency
> +   a standard PM domain consumer binding is used. When provided, all domains
> +   created by the given provider should be subdomains of the domain
> +   specified by this binding. More details about power domain specifier are
> +   available in the next section.
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
> +The nodes above define two power controllers: 'parent' and 'child'.
> +Domains created by the 'child' power controller are subdomains of '0' power
> +domain provided by the 'parent' power controller.
> +
>  ==PM domain consumers==
>
>  Required properties:
> --
> 1.9.2
>
