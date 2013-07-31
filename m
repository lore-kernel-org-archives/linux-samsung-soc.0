From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2 Resend 2/3] of/documentation: Update G2D documentation
Date: Tue, 30 Jul 2013 21:02:23 -0700
Message-ID: <20130731040223.24490.62098@quantum>
References: <1373351355-27444-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:41074 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750808Ab3GaEC2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 31 Jul 2013 00:02:28 -0400
Received: by mail-pa0-f46.google.com with SMTP id fa1so360050pad.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jul 2013 21:02:27 -0700 (PDT)
In-Reply-To: <1373351355-27444-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, tomasz.figa@gmail.com, Inki Dae <inki.dae@samsung.com>

Quoting Sachin Kamat (2013-07-08 23:29:15)
> Exynos5250 G2D IP requires only the gate clock. Update the
> binding documentation accordingly.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Inki Dae <inki.dae@samsung.com>

Taken into clk-next.

Thanks,
Mike

> ---
> Updated the description of clock-names as suggested by Tomasz Figa.
> ---
>  .../devicetree/bindings/gpu/samsung-g2d.txt        |    7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> index 3f454ff..c4f358d 100644
> --- a/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> +++ b/Documentation/devicetree/bindings/gpu/samsung-g2d.txt
> @@ -11,8 +11,11 @@ Required properties:
>  
>    - interrupts : G2D interrupt number to the CPU.
>    - clocks : from common clock binding: handle to G2D clocks.
> -  - clock-names : from common clock binding: must contain "sclk_fimg2d" and
> -                 "fimg2d", corresponding to entries in the clocks property.
> +  - clock-names : names of clocks listed in clocks property, in the same
> +                 order, depending on SoC type:
> +                 - for S5PV210 and Exynos4 based SoCs: "fimg2d" and
> +                   "sclk_fimg2d"
> +                 - for Exynos5250 SoC: "fimg2d".
>  
>  Example:
>         g2d@12800000 {
> -- 
> 1.7.9.5
