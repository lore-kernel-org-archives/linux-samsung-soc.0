From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/5] clk: samsung: exynos5410: Add clock IDs for PDMA and
 EPLL clocks
Date: Fri, 2 Sep 2016 19:36:08 +0200
Message-ID: <20160902173608.GC9022@kozik-lap>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-2-git-send-email-s.nawrocki@samsung.com>
 <2885a9f5-7fcf-f718-234d-2742e0719c55@samsung.com>
 <74653ed5-827b-1ad6-e17a-0c8e173da29f@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:35518 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752007AbcIBRgM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 2 Sep 2016 13:36:12 -0400
Content-Disposition: inline
In-Reply-To: <74653ed5-827b-1ad6-e17a-0c8e173da29f@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org, tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org

On Fri, Sep 02, 2016 at 04:09:08PM +0200, Sylwester Nawrocki wrote:
> On 08/30/2016 11:54 AM, Krzysztof Kozlowski wrote:
> > On 08/22/2016 06:30 PM, Sylwester Nawrocki wrote:
> >> > The PDMA{0,1} and EPLL clock IDs are added separately in this
> >> > patch so the patch can be merged to the arm-soc tree as dependency.
> >> > 
> >> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> > ---
> >> >  include/dt-bindings/clock/exynos5410.h | 3 +++
> >> >  1 file changed, 3 insertions(+)
> >> > 
> >> > diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
> >> > index 85b467b..a74442a 100644
> >> > --- a/include/dt-bindings/clock/exynos5410.h
> >> > +++ b/include/dt-bindings/clock/exynos5410.h
> >> > @@ -19,6 +19,7 @@
> >> >  #define CLK_FOUT_MPLL		4
> >> >  #define CLK_FOUT_BPLL		5
> >> >  #define CLK_FOUT_KPLL		6
> >> > +#define CLK_FOUT_EPLL		7
> >> >  
> >> >  /* gate for special clocks (sclk) */
> >> >  #define CLK_SCLK_UART0		128
> >> > @@ -48,6 +49,8 @@
> >> >  #define CLK_USI3		268
> >> >  #define CLK_UART3		260
> >> >  #define CLK_PWM			279
> >> > +#define CLK_PDMA0		280
> >> > +#define CLK_PDMA1		281
> >
> > How about making the IDs the same as in exynos5420? This way those
> > drivers could be merged someday in the future (if someone would be
> > bored...).
> 
> OK, I will do it, but there is already mismatch in the PLL indices.

Oh, crap, I missed that difference. This means the drivers won't be
combined... so I am not sure whether keeping same IDs for rest brings
benefits. Whatever you chooses:

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
