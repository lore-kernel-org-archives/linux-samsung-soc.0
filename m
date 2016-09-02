From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 1/5] clk: samsung: exynos5410: Add clock IDs for PDMA and
 EPLL clocks
Date: Fri, 02 Sep 2016 16:09:08 +0200
Message-ID: <74653ed5-827b-1ad6-e17a-0c8e173da29f@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-2-git-send-email-s.nawrocki@samsung.com>
 <2885a9f5-7fcf-f718-234d-2742e0719c55@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-reply-to: <2885a9f5-7fcf-f718-234d-2742e0719c55@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-clk@vger.kernel.org, tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/30/2016 11:54 AM, Krzysztof Kozlowski wrote:
> On 08/22/2016 06:30 PM, Sylwester Nawrocki wrote:
>> > The PDMA{0,1} and EPLL clock IDs are added separately in this
>> > patch so the patch can be merged to the arm-soc tree as dependency.
>> > 
>> > Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> > ---
>> >  include/dt-bindings/clock/exynos5410.h | 3 +++
>> >  1 file changed, 3 insertions(+)
>> > 
>> > diff --git a/include/dt-bindings/clock/exynos5410.h b/include/dt-bindings/clock/exynos5410.h
>> > index 85b467b..a74442a 100644
>> > --- a/include/dt-bindings/clock/exynos5410.h
>> > +++ b/include/dt-bindings/clock/exynos5410.h
>> > @@ -19,6 +19,7 @@
>> >  #define CLK_FOUT_MPLL		4
>> >  #define CLK_FOUT_BPLL		5
>> >  #define CLK_FOUT_KPLL		6
>> > +#define CLK_FOUT_EPLL		7
>> >  
>> >  /* gate for special clocks (sclk) */
>> >  #define CLK_SCLK_UART0		128
>> > @@ -48,6 +49,8 @@
>> >  #define CLK_USI3		268
>> >  #define CLK_UART3		260
>> >  #define CLK_PWM			279
>> > +#define CLK_PDMA0		280
>> > +#define CLK_PDMA1		281
>
> How about making the IDs the same as in exynos5420? This way those
> drivers could be merged someday in the future (if someone would be
> bored...).

OK, I will do it, but there is already mismatch in the PLL indices.

--
Thanks,
Sylwester
