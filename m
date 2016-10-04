From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: exynos: Add dts files for Samsung
 Exynos5433 64bit SoC
Date: Tue, 4 Oct 2016 15:37:35 +0200
Message-ID: <CAMuHMdV3WdS75QXsJgEXirqV-d=RJa-LTq4OdvS6fgQWS+DO-A@mail.gmail.com>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com> <1472046551-703-6-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1472046551-703-6-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, jh80.chung@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, jonghwa3.lee@samsung.com, beomho.seo@samsung.com, jaewon02.kim@samsung
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 24, 2016 at 3:49 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi

> +       cluster_a53_opp_table: opp_table0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp@400000000 {
> +                       opp-hz = /bits/ 64 <400000000>;
> +                       opp-microvolt = <900000>;
> +               };

With W=1:

Warning (unit_address_vs_reg): Node /opp_table0/opp@400000000 has a
unit name, but no reg property
...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
