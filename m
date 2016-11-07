From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 4/6] ARM: dts: Add clock provider specific properties to
 max8997 node
Date: Mon, 7 Nov 2016 12:07:32 -0300
Message-ID: <ef27992b-87a0-6d18-35cc-83360e6d677a@osg.samsung.com>
References: <1478513376-14307-1-git-send-email-pankaj.dubey@samsung.com>
 <1478513376-14307-5-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1478513376-14307-5-git-send-email-pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
Cc: krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thomas.ab-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, myungjoo.ham-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Pankaj,

On 11/07/2016 07:09 AM, Pankaj Dubey wrote:
> This patch adds a label and #clock-cells property to device node of
> max8997 PMIC to allow using it as a clock provider.
> 
> CC: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> CC: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Signed-off-by: Pankaj Dubey <pankaj.dubey-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
> ---
>  arch/arm/boot/dts/exynos4210-origen.dts | 3 ++-
>  arch/arm/boot/dts/exynos4210-trats.dts  | 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/exynos4210-origen.dts b/arch/arm/boot/dts/exynos4210-origen.dts
> index cb3a255..6c7ef4e 100644
> --- a/arch/arm/boot/dts/exynos4210-origen.dts
> +++ b/arch/arm/boot/dts/exynos4210-origen.dts
> @@ -147,11 +147,12 @@
>  	pinctrl-0 = <&i2c0_bus>;
>  	pinctrl-names = "default";
>  
> -	max8997_pmic@66 {
> +	max8997: max8997_pmic@66 {

The ePAPR says that the node name should be "somewhat generic, reflecting
the function of the device and not its precise programming model". So I
think this should be instead:

        max8997: pmic@66 {

[...]
  
> -	max8997_pmic@66 {
> +	max8997: max8997_pmic@66 {

Same here.

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
