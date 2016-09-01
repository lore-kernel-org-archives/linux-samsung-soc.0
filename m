From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 4/7] ARM: dts: exynos: Remove skeleton.dtsi usage for
 Exynos5
Date: Thu, 1 Sep 2016 18:31:15 +0200
Message-ID: <20160901163115.GD12564@kozik-lap>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
 <1472720817-20362-5-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472720817-20362-5-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 01, 2016 at 11:06:53AM +0200, Javier Martinez Canillas wrote:
> The skeleton.dtsi file was removed in ARM64 for different reasons as
> explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").
> 
> These also applies to ARM and it will also allow to get rid of the
> following DTC warnings in the future:
> 
> "Node /memory has a reg or ranges property, but no unit name"
> 
> The disassembled DTB are almost the same besides an empty chosen
> node being removed and nodes reordered, so it should not have
> functional changes.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> ---
> 
> Changes in v2: None
> 
>  arch/arm/boot/dts/exynos5.dtsi                     | 3 ++-
>  arch/arm/boot/dts/exynos5250-arndale.dts           | 1 +
>  arch/arm/boot/dts/exynos5250-smdk5250.dts          | 1 +
>  arch/arm/boot/dts/exynos5250-snow-common.dtsi      | 1 +
>  arch/arm/boot/dts/exynos5250-spring.dts            | 1 +
>  arch/arm/boot/dts/exynos5260-xyref5260.dts         | 1 +
>  arch/arm/boot/dts/exynos5260.dtsi                  | 4 ++--
>  arch/arm/boot/dts/exynos5410-odroidxu.dts          | 1 +
>  arch/arm/boot/dts/exynos5410-smdk5410.dts          | 1 +
>  arch/arm/boot/dts/exynos5420-arndale-octa.dts      | 1 +
>  arch/arm/boot/dts/exynos5420-peach-pit.dts         | 1 +
>  arch/arm/boot/dts/exynos5420-smdk5420.dts          | 1 +
>  arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi | 1 +
>  arch/arm/boot/dts/exynos5440.dtsi                  | 3 ++-
>  arch/arm/boot/dts/exynos54xx.dtsi                  | 1 -
>  arch/arm/boot/dts/exynos5800-peach-pi.dts          | 1 +
>  16 files changed, 18 insertions(+), 5 deletions(-)



Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
