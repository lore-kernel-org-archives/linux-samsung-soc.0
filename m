From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 5/7] arm64: dts: exynos: Add dts files for Samsung
 Exynos5433 64bit SoC
Date: Tue, 4 Oct 2016 15:46:40 +0200
Message-ID: <20161004134640.GA4150@kozik-lap>
References: <1472046551-703-1-git-send-email-cw00.choi@samsung.com>
 <1472046551-703-6-git-send-email-cw00.choi@samsung.com>
 <CAMuHMdV3WdS75QXsJgEXirqV-d=RJa-LTq4OdvS6fgQWS+DO-A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAMuHMdV3WdS75QXsJgEXirqV-d=RJa-LTq4OdvS6fgQWS+DO-A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Krzysztof =?utf-8?Q?Koz=C5=82owski?= <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, jh80.chung@samsung.com, Seung-Woo Kim <sw0312.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, jonghwa3.lee@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Oct 04, 2016 at 03:37:35PM +0200, Geert Uytterhoeven wrote:
> On Wed, Aug 24, 2016 at 3:49 PM, Chanwoo Choi <cw00.choi@samsung.com> wrote:
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
> 
> > +       cluster_a53_opp_table: opp_table0 {
> > +               compatible = "operating-points-v2";
> > +               opp-shared;
> > +
> > +               opp@400000000 {
> > +                       opp-hz = /bits/ 64 <400000000>;
> > +                       opp-microvolt = <900000>;
> > +               };
> 
> With W=1:
> 
> Warning (unit_address_vs_reg): Node /opp_table0/opp@400000000 has a
> unit name, but no reg property

AFAIR, there should be an exception for this... [1] But maybe it was not
added after all?

Best regards,
Krzysztof


[1] http://lists.infradead.org/pipermail/linux-arm-kernel/2016-April/419738.html
