From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v1 20/50] ARM: dts: exynos: change and rename FSYS OPP
 table in Exynos5420
Date: Wed, 17 Jul 2019 10:39:36 +0200
Message-ID: <CAJKOXPfHgmBo9NX6jO8qSqXjN1pFmnKkQEWbou+q7-BDq2XKQg@mail.gmail.com>
References: <CGME20190715124450eucas1p189043d196375aa6adacf898de81bfa9b@eucas1p1.samsung.com>
 <20190715124417.4787-1-l.luba@partner.samsung.com> <20190715124417.4787-21-l.luba@partner.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-21-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukasz Luba <l.luba@partner.samsung.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Andrzej Hajda <a.hajda@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, 15 Jul 2019 at 14:44, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>
> The FSYS and FSYS2 buses have similar characteristics and both have max
> frequency 240MHz. The old OPP table bus_fsys_apb_opp_table should be used
> only to FSYS APB bus because APB max frequency is 200MHz.
> The new OPPs for FSYS should increase its performance and related devices.

I do not understand the explanation. You say that there are two buses
- FSYS and FSYS2 - and old OPP table should be used for FSYS APB but
you remove the old one (by renaming). Or which one is the 'old one'
here? The reason is speed... wait, what? Usually DTS should describe
the HW so I imagine that proper opp table should be used for proper
bus. It surprised me that we switch a bus to different OPP table just
because of speed concerns. It should be correctness concern.

Please clarify and reword all this.

I am also not sure how this relates with previous patch - whether you
are fixing independent issues. Maybe because I do not see the issue
fixed... change the commit title and adjust the messages to focus WHY
you are doing it. For small fixes WHAT you are doing is rather obvious
so commit msg (and title) should not focus on it.

Best regards,
Krzysztof

>
> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index 941c58bdd809..c7fc4b829b2a 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -995,7 +995,7 @@
>                         compatible = "samsung,exynos-bus";
>                         clocks = <&clock CLK_DOUT_ACLK200_FSYS>;
>                         clock-names = "bus";
> -                       operating-points-v2 = <&bus_fsys_apb_opp_table>;
> +                       operating-points-v2 = <&bus_fsys_opp_table>;
>                         status = "disabled";
>                 };
>
> @@ -1003,7 +1003,7 @@
>                         compatible = "samsung,exynos-bus";
>                         clocks = <&clock CLK_DOUT_ACLK200_FSYS2>;
>                         clock-names = "bus";
> -                       operating-points-v2 = <&bus_fsys2_opp_table>;
> +                       operating-points-v2 = <&bus_fsys_opp_table>;
>                         status = "disabled";
>                 };
>
> @@ -1157,7 +1157,7 @@
>                         };
>                 };
>
> -               bus_fsys2_opp_table: opp_table5 {
> +               bus_fsys_opp_table: opp_table5 {
>                         compatible = "operating-points-v2";
>
>                         opp00 {
> --
> 2.17.1
>
