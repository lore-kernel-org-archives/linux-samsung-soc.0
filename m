From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] of/documentation: Update G2D documentation
Date: Sat, 06 Jul 2013 01:52:48 +0200
Message-ID: <4264635.Hmig5l0VLj@flatron>
References: <1373013749-14530-1-git-send-email-sachin.kamat@linaro.org> <1373013749-14530-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:33614 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751942Ab3GEXww (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 5 Jul 2013 19:52:52 -0400
Received: by mail-ea0-f171.google.com with SMTP id m14so1737077eaj.16
        for <linux-samsung-soc@vger.kernel.org>; Fri, 05 Jul 2013 16:52:50 -0700 (PDT)
In-Reply-To: <1373013749-14530-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, patches@linaro.org, mturquette@linaro.org, inki.dae@samsung.com

Hi Sachin,

On Friday 05 of July 2013 14:12:28 Sachin Kamat wrote:
> Exynos5250 G2D IP requires only the gate clock. Update the
> binding documentation accordingly.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Inki Dae <inki.dae@samsung.com>
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt        |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt index
> 3f454ff..60ca631 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> @@ -12,7 +12,9 @@ Required properties:
>    - interrupts : G2D interrupt number to the CPU.
>    - clocks : from common clock binding: handle to G2D clocks.
>    - clock-names : from common clock binding: must contain "sclk_fimg2d"
> and -		  "fimg2d", corresponding to entries in the clocks 
property. +		
>  "fimg2d" for S5PV210 & Exynos4 based SoCs and "fimg2d" for +		 
> Exynos5250 SoC, corresponding to entries in the clocks
> +		  property.

I think this needs to be rephrased, because I can't get any sense from 
this sentence.

Maybe something like:

- clock-names : names of clocks listed in clocks property, in the same 
order, depending on SoC type:
    - for S5PV210 and Exynos4 based SoCs : "fimg2d" and "sclk_fimg2d"
    - for Exynos5250 SoC : "fimg2d".

What do you think?

Best regards,
Tomasz
