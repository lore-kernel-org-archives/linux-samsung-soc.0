From: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH 3/3] ARM: dts: exynos: correct the rtc
 compatible value for exynos5
Date: Mon, 11 Jul 2016 07:52:31 +0200
Message-ID: <5783341F.1030006@samsung.com>
References: <1468056226-19128-1-git-send-email-ayaka@soulik.info>
 <1468056226-19128-4-git-send-email-ayaka@soulik.info>
Reply-To: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <rtc-linux+bncBDKZNNNLXAHBBJPIRS6AKGQE7EYL5ZY-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
Sender: rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org
In-reply-to: <1468056226-19128-4-git-send-email-ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
List-Post: <https://groups.google.com/group/rtc-linux/post>, <mailto:rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Help: <https://groups.google.com/support/>, <mailto:rtc-linux+help-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Archive: <https://groups.google.com/group/rtc-linux
List-Subscribe: <https://groups.google.com/group/rtc-linux/subscribe>, <mailto:rtc-linux+subscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>
List-Unsubscribe: <mailto:googlegroups-manage+712029733259+unsubscribe-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org>,
 <https://groups.google.com/group/rtc-linux/subscribe>
To: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
Cc: alexandre.belloni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org, a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org, rtc-linux-/JYPxA39Uh5TLH3MbocFFw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 07/09/2016 11:23 AM, Randy Li wrote:
> Those platforms are reported to use the same rtc IP core
> as exynos3250's.

Insufficient. Exynos4 also has to be updated. Actually all SoC from SoC
family requires rtc src clock. I think S3C6410 also requires it but I
don't have all the data necessary to confirm this.

Best regards,
Krzysztof

> 
> Signed-off-by: Randy Li <ayaka-xPW3/0Ywev/iB9QmIjCX8w@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos3250.dtsi | 2 +-
>  arch/arm/boot/dts/exynos5.dtsi    | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
> index 62f3dcd..cdd69a0 100644
> --- a/arch/arm/boot/dts/exynos3250.dtsi
> +++ b/arch/arm/boot/dts/exynos3250.dtsi
> @@ -208,7 +208,7 @@
>  		};
>  
>  		rtc: rtc@10070000 {
> -			compatible = "samsung,s3c6410-rtc";
> +			compatible = "samsung,exynos3250-rtc";
>  			reg = <0x10070000 0x100>;
>  			interrupts = <0 73 0>, <0 74 0>;
>  			interrupt-parent = <&pmu_system_controller>;
> diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
> index d5c0f18..71a1ad2 100644
> --- a/arch/arm/boot/dts/exynos5.dtsi
> +++ b/arch/arm/boot/dts/exynos5.dtsi
> @@ -88,7 +88,7 @@
>  	};
>  
>  	rtc: rtc@101E0000 {
> -		compatible = "samsung,s3c6410-rtc";
> +		compatible = "samsung,exynos3250-rtc";
>  		reg = <0x101E0000 0x100>;
>  		interrupts = <0 43 0>, <0 44 0>;
>  		status = "disabled";
> 

-- 
You received this message because you are subscribed to "rtc-linux".
Membership options at http://groups.google.com/group/rtc-linux .
Please read http://groups.google.com/group/rtc-linux/web/checklist
before submitting a driver.
--- 
You received this message because you are subscribed to the Google Groups "rtc-linux" group.
To unsubscribe from this group and stop receiving emails from it, send an email to rtc-linux+unsubscribe-/JYPxA39Uh5TLH3MbocFF+G/Ez6ZCGd0@public.gmane.org
For more options, visit https://groups.google.com/d/optout.
