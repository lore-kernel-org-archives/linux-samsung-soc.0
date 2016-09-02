From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 4/5] clk: samsung: Add support for EPLL on exynos5410
Date: Fri, 2 Sep 2016 19:32:41 +0200
Message-ID: <20160902173241.GB9022@kozik-lap>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-5-git-send-email-s.nawrocki@samsung.com>
 <74d97f1b-6a3a-78f1-6d96-b0d0b9717ab2@samsung.com>
 <fe67f53a-b5cd-1ff2-ae9f-7bce6b3d33b8@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fe67f53a-b5cd-1ff2-ae9f-7bce6b3d33b8@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-clk@vger.kernel.org, tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Sep 02, 2016 at 05:15:31PM +0200, Sylwester Nawrocki wrote:
> On 08/30/2016 12:36 PM, Krzysztof Kozlowski wrote:
> > On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
> >> This patch adds code instantiating the EPLL, which is used as the
> >> audio subsystem's root clock.
> >> The requirement to specify the external root clock in clocks property
> >> is also added.
> > 
> > I think the requirement was there already but explained little bit
> > differently:
> > 19 External clock:
> > 20
> > 21 There is clock that is generated outside the SoC. It
> > 22 is expected that it is defined using standard clock bindings
> > 23 with following clock-output-name:
> > 24
> > 25  - "fin_pll" - PLL input clock from XXTI
> >
> > so you can just combine them. Driver now will require the fin_pll in two
> > ways:
> > 1. Old lookup by "fin_pll" name.
> > 2. of_clk_get of yours.
> 
> I'm not sure what do you mean exactly, I'm also adding in this patch a sentence
> right after the text as quoted above saying that:
> 
> "This clock should be listed in the clocks property of the controller node."
> 
> The description of the consumer clock (the main clock controller's parent clock)
> was not in the binding so far, there is no "clocks" property in the list of
> required properties.

First of all, in commit message, you are not adding the requirement...
it was present already, I think. Wasn't it?

As for the code, I am saying that you are duplicating the information.
There is already an paragraph for external clock. You are adding a new
one before and extending it... just make it simpler - mention external
clock in one place.

> 
> >>  That ensures proper initialization order by exlicitly
> >> specifying dependencies in devicetree.  It prevents situations when the
> >> SoC's clock controller driver has initialized, the external oscillator
> >> clock is not yet registered and setting clock frequencies through
> >> assigned-clock-rates property doesn't work properly due to unknown
> >> external oscillator frequency.
> >>
> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> ---
> >>  .../devicetree/bindings/clock/exynos5410-clock.txt |  14 +++
> >>  drivers/clk/samsung/clk-exynos5410.c               |  30 +++++-
> >>  drivers/clk/samsung/clk-pll.c                      | 102 +++++++++++++++++++++
> >>  drivers/clk/samsung/clk-pll.h                      |   1 +
> >>  4 files changed, 145 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> >> index aeab635..2aefc07 100644
> >> --- a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> >> +++ b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> >> @@ -12,6 +12,9 @@ Required Properties:
> >>  
> >>  - #clock-cells: should be 1.
> >>  
> >> +- clocks: should contain an entry specifying the root oscillator clock
> >> +  on XXTI pin (fin_pll).
> > 
> > Combine with "external clock".
> 
> Do you mean rephrasing this to something like:
> 
> - clocks: should contain an entry specifying the external clock (fin_pll),
>   i.e. the root clock on XXTI pin.

Could be, with removal of the existing paragraph. The only comment I
have is about duplicating the information.

Best regards,
Krzysztof
