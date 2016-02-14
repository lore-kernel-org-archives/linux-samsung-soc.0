From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [rtc-linux] [PATCH] rtc: s3c: Document required clocks in the DT
 binding
Date: Sun, 14 Feb 2016 15:34:05 +0900
Message-ID: <56C01FDD.9050204@samsung.com>
References: <1455038632-14545-1-git-send-email-javier@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1455038632-14545-1-git-send-email-javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Cc: k.kozlowski.k-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Belloni <alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

W dniu 10.02.2016 o 02:23, Javier Martinez Canillas pisze:
> The S3C Real Time Clock driver requires the clock and source clock to
> be defined in the device node but that requirement is not documented.

+Cc: Alessandro Zummo

No, not entirely. The samsung,s3c6410-rtc needs rtc and rtc_src clocks
but rest of compatible devices need only rtc clock.

Best regards,
Krzysztof

> 
> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
> 
> ---
> 
>  Documentation/devicetree/bindings/rtc/s3c-rtc.txt | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> index ac2fcd6ff4b8..1068ffce9f91 100644
> --- a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> @@ -14,6 +14,10 @@ Required properties:
>    interrupt number is the rtc alarm interrupt and second interrupt number
>    is the rtc tick interrupt. The number of cells representing a interrupt
>    depends on the parent interrupt controller.
> +- clocks: Must contain a list of phandle and clock specifier for the rtc
> +          and source clocks.
> +- clock-names: Must contain "rtc" and "rtc_src" entries sorted in the
> +               same order as the clocks property.
>  
>  Example:
>  
> @@ -21,4 +25,6 @@ Example:
>  		compatible = "samsung,s3c6410-rtc";
>  		reg = <0x10070000 0x100>;
>  		interrupts = <44 0 45 0>;
> +		clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
> +		clock-names = "rtc", "rtc_src";
>  	};
> 

--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
