From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Thu, 1 Sep 2016 18:26:34 +0200
Message-ID: <20160901162634.GA12564@kozik-lap>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
 <1472720817-20362-2-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472720817-20362-2-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 01, 2016 at 11:06:50AM +0200, Javier Martinez Canillas wrote:
> The skeleton.dtsi file was removed in ARM64 for different reasons as
> explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").
> 
> These also applies to ARM and it will also allow to get rid of the
> following DTC warnings in the future:
> 
> "Node /memory has a reg or ranges property, but no unit name"
> 
> But these boards don't have a memory node defined, so removing the
> skeleton.dtsi inclusion in exynos5440.dtsi will cause a change in
> the compiled DTB. Add a dummy memory node so the compiled DTB does
> not change if the skeleton.dtsi is removed from exynos5440.dtsi.
> 
> Eventually the correct starting addresses and sizes should be used
> but I didn't find that information.
> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> 
> ---
> 
> Changes in v2:
> - Add a fixme to specify that the correct memory values should be set.
>   (Bartlomiej Zolnierkiewicz)
> - Fix commit message (Krzysztof Kozlowski).
> 
>  arch/arm/boot/dts/exynos5440-sd5v1.dts    | 6 ++++++
>  arch/arm/boot/dts/exynos5440-ssdk5440.dts | 6 ++++++
>  2 files changed, 12 insertions(+)
>


Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
