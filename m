From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [RESEND][PATCH 1/2] ARM: DTS: Add PMU DT node for exynos5260 SoC
Date: Mon, 28 Jul 2014 20:56:31 +0530
Message-ID: <CAK5sBcHdsDF60JTv7ugC4m=A-5Lmr2rDwizhkCLEyYGRio-2-Q@mail.gmail.com>
References: <1406551080-14821-1-git-send-email-vikas.sajjan@samsung.com>
	<1406551080-14821-2-git-send-email-vikas.sajjan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:38776 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751946AbaG1P0d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jul 2014 11:26:33 -0400
Received: by mail-lb0-f175.google.com with SMTP id 10so5836315lbg.20
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jul 2014 08:26:32 -0700 (PDT)
In-Reply-To: <1406551080-14821-2-git-send-email-vikas.sajjan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vikas Sajjan <vikas.sajjan@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, sunil joshi <joshi@samsung.com>, sajjan.linux@gmail.com, Doug Anderson <dianders@chromium.org>

Hi Vikas,

On Mon, Jul 28, 2014 at 6:07 PM, Vikas Sajjan <vikas.sajjan@samsung.com> wrote:
> Adds PMU DT node for exynos5260 SoC.
>
> Signed-off-by: Vikas Sajjan <vikas.sajjan@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>  arch/arm/boot/dts/exynos5260.dtsi                  |    5 +++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> index 2a4ab04..c038628 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
> @@ -8,6 +8,7 @@ Properties:
>                    - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
>                    - "samsung,exynos5250-pmu" - for Exynos5250 SoC,
>                    - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
> +                  - "samsung,exynos5260-pmu" - for Exynos5260 SoC.

nit: This line should come after 5250 entry to preserve the order.

Otherwise, looks good.
-- 
Regards,
Sachin.
