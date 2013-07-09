From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH v2 3/3] of/documentation: Update G2D documentation
Date: Tue, 9 Jul 2013 12:11:17 +0530
Message-ID: <CAK9yfHw-Ry0NTKhrbVApz6-7r4R1jhnh34+fFHmA3FPgvdyTWQ@mail.gmail.com>
References: <1373350364-2952-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f41.google.com ([209.85.219.41]:65346 "EHLO
	mail-oa0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753062Ab3GIGlT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jul 2013 02:41:19 -0400
Received: by mail-oa0-f41.google.com with SMTP id n10so7545472oag.28
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Jul 2013 23:41:17 -0700 (PDT)
In-Reply-To: <1373350364-2952-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: devicetree-discuss@lists.ozlabs.org, kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org, mturquette@linaro.org, tomasz.figa@gmail.com, Inki Dae <inki.dae@samsung.com>

On 9 July 2013 11:42, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> Exynos5250 G2D IP requires only the gate clock. Update the
> binding documentation accordingly.
>
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Inki Dae <inki.dae@samsung.com>
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
>

Please ignore this patch. Will re-send. Sorry for the noise.

-- 
With warm regards,
Sachin
