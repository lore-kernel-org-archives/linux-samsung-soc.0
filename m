From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: Re: [PATCH v3 03/15] ARM: dts: sysreg: add exynos5 compatible to DT bindings
Date: Wed, 4 Jun 2014 17:14:52 +0530
Message-ID: <CAFp+6iESdBDh+Ji20Z4Y_W=6y+xGwJ_abxBc-abAK4RfBF6otQ@mail.gmail.com>
References: <1401686571-22148-1-git-send-email-yj44.cho@samsung.com>
	<1401686571-22148-4-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f47.google.com ([209.85.216.47]:54722 "EHLO
	mail-qa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752305AbaFDLoy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jun 2014 07:44:54 -0400
In-Reply-To: <1401686571-22148-4-git-send-email-yj44.cho@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: YoungJun Cho <yj44.cho@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, robh+dt <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, ijc+devicetree@hellion.org.uk, Kumar Gala <galak@codeaurora.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, inki.dae@samsung.com, Kukjin Kim <kgene.kim@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, sw0312.kim@samsung.com, a.hajda@samsung.com

Hi,


On Mon, Jun 2, 2014 at 10:52 AM, YoungJun Cho <yj44.cho@samsung.com> wrote:
> This patch adds relevant to exynos5 compatible for exynos5 SoCs.

This change is not required. Please check the latest 'for-next' branch
of linux-samsung tree.
Recently a patch "dfbbdbf ARM: dts: Add sysreg sytem controller node
to exynos5250 and exynos5420"
has already updated this binding information.

>
> Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
> Acked-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  .../devicetree/bindings/arm/samsung/sysreg.txt     |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> index 0ab3251..fd71581 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/sysreg.txt
> @@ -3,6 +3,7 @@ SAMSUNG S5P/Exynos SoC series System Registers (SYSREG)
>  Properties:
>   - compatible : should contain "samsung,<chip name>-sysreg", "syscon";
>     For Exynos4 SoC series it should be "samsung,exynos4-sysreg", "syscon";
> +   For Exynos5 SoC series it should be "samsung,exynos5-sysreg", "syscon";
>   - reg : offset and length of the register set.
>
>  Example:
> --
> 1.7.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Vivek Gautam
Samsung R&D Institute, Bangalore
India
