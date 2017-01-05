From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM64: dts: exynos5433-tm2: enable HDMI/TV path
Date: Thu, 5 Jan 2017 13:33:03 -0300
Message-ID: <78e3d9c4-ee60-9b60-9f1b-b73290a18d62@osg.samsung.com>
References: <1483629943-31183-1-git-send-email-a.hajda@samsung.com>
 <CGME20170105152604eucas1p12c1a964b5299a5a41305b00b80a09f36@eucas1p1.samsung.com>
 <1483629943-31183-3-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1483629943-31183-3-git-send-email-a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Marek Szyprowski <m.szyprowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Inki Dae <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Andrzej,

On 01/05/2017 12:25 PM, Andrzej Hajda wrote:
> TV path consist of following interconnected components:
> - DECON_TV - display controller,
> - HDMI - video signal converter RGB / HDMI,
> - MHL - video signal converter HDMI / MHL,
> - DDC - i2c slave device for EDID reading (on hsi2c_11 bus).
> 
> The same path/configuration is used by TM2E board and is
> automatically applied thanks to dts file inclusion.
> 
> Signed-off-by: Andrzej Hajda <a.hajda-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm64/boot/dts/exynos/exynos5433-tm2.dts | 71 +++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts b/arch/arm64/boot/dts/exynos/exynos5433-tm2.dts

[snip]

>  
> +&hdmi {
> +	hpd-gpio = <&gpa3 0 0>;

Same comment than interrupts, please use the GPIO_ACTIVE_HIGH here.
The rest looks good to me.

Reviewed-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
