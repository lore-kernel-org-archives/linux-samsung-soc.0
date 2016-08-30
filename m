From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 4/5] clk: samsung: Add support for EPLL on exynos5410
Date: Tue, 30 Aug 2016 12:36:13 +0200
Message-ID: <74d97f1b-6a3a-78f1-6d96-b0d0b9717ab2@samsung.com>
References: <1471883463-1950-1-git-send-email-s.nawrocki@samsung.com>
 <1471883463-1950-5-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:34886 "EHLO
        mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758140AbcH3KgS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 06:36:18 -0400
In-reply-to: <1471883463-1950-5-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-clk@vger.kernel.org
Cc: tomasz.figa@gmail.com, sboyd@codeaurora.org, mturquette@baylibre.com, kgene@kernel.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org

On 08/22/2016 06:31 PM, Sylwester Nawrocki wrote:
> This patch adds code instantiating the EPLL, which is used as the
> audio subsystem's root clock.
> The requirement to specify the external root clock in clocks property
> is also added.

I think the requirement was there already but explained little bit
differently:
19 External clock:
20
21 There is clock that is generated outside the SoC. It
22 is expected that it is defined using standard clock bindings
23 with following clock-output-name:
24
25  - "fin_pll" - PLL input clock from XXTI

so you can just combine them. Driver now will require the fin_pll in two
ways:
1. Old lookup by "fin_pll" name.
2. of_clk_get of yours.


>  That ensures proper initialization order by explicitly
> specifying dependencies in devicetree.  It prevents situations when the
> SoC's clock controller driver has initialized, the external oscillator
> clock is not yet registered and setting clock frequencies through
> assigned-clock-rates property doesn't work properly due to unknown
> external oscillator frequency.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos5410-clock.txt |  14 +++
>  drivers/clk/samsung/clk-exynos5410.c               |  30 +++++-
>  drivers/clk/samsung/clk-pll.c                      | 102 +++++++++++++++++++++
>  drivers/clk/samsung/clk-pll.h                      |   1 +
>  4 files changed, 145 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> index aeab635..2aefc07 100644
> --- a/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> +++ b/Documentation/devicetree/bindings/clock/exynos5410-clock.txt
> @@ -12,6 +12,9 @@ Required Properties:
>  
>  - #clock-cells: should be 1.
>  
> +- clocks: should contain an entry specifying the root oscillator clock
> +  on XXTI pin (fin_pll).

Combine with "external clock".

Rest looks ok:

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
