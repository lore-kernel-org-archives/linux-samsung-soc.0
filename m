From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [RFC PATCH 12/14] ARM: dts: exynos5: add system register support
Date: Tue, 15 Apr 2014 14:11:51 +0530
Message-ID: <CAK9yfHz9yFjQ8x2UuR7uvPTR+E8wUo4W+2XYKiF17RmwMji8OQ@mail.gmail.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
	<1397540862-21359-13-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:42280 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934AbaDOIlw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Apr 2014 04:41:52 -0400
Received: by mail-oa0-f53.google.com with SMTP id j17so10179929oag.26
        for <linux-samsung-soc@vger.kernel.org>; Tue, 15 Apr 2014 01:41:51 -0700 (PDT)
In-Reply-To: <1397540862-21359-13-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: Dave Airlie <airlied@linux.ie>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>

On 15 April 2014 11:17, YoungJun Cho <yj44.cho@samsung.com> wrote:
> This patch adds sysreg device node, and sysreg property to fimd device node
> which is required to use I80 interface.
>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5.dtsi |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index 258dca4..f938bbb 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -88,12 +88,18 @@
>                 status = "disabled";
>         };
>
> +       sys_reg: syscon@10050000 {
> +               compatible = "samsung,exynos5-sysreg", "syscon";

Do we really need a separate string for this? Can't we use
"samsung,exynos4-sysreg" itself?

-- 
With warm regards,
Sachin
