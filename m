From: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v2 2/7] ARM: dts: exynos: Remove skeleton.dtsi usage for
 Exynos3
Date: Thu, 1 Sep 2016 18:26:58 +0200
Message-ID: <20160901162658.GB12564@kozik-lap>
References: <1472720817-20362-1-git-send-email-javier@osg.samsung.com>
 <1472720817-20362-3-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1472720817-20362-3-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Sep 01, 2016 at 11:06:51AM +0200, Javier Martinez Canillas wrote:
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
>  arch/arm/boot/dts/exynos3250-artik5.dtsi | 1 +
>  arch/arm/boot/dts/exynos3250-monk.dts    | 1 +
>  arch/arm/boot/dts/exynos3250-rinato.dts  | 1 +
>  arch/arm/boot/dts/exynos3250.dtsi        | 3 ++-
>  4 files changed, 5 insertions(+), 1 deletion(-)
>



Thanks, applied.

Best regards,
Krzysztof

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
