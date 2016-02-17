From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: dts: Move syscon reboot/poweroff to common dtsi
 for Exynos
Date: Tue, 16 Feb 2016 23:23:24 -0300
Message-ID: <56C3D99C.3090403@osg.samsung.com>
References: <1455636348-14277-1-git-send-email-javier@osg.samsung.com>
 <56C3D745.7050904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56C3D745.7050904-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andi Shyti <andi.shyti-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Alim Akhtar <alim.akhtar-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 02/16/2016 11:13 PM, Krzysztof Kozlowski wrote:

[snip]

>> diff --git a/arch/arm/boot/dts/exynos-syscon-restart.dtsi b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
>> new file mode 100644
>> index 000000000000..09a2040054ed
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/exynos-syscon-restart.dtsi
>> @@ -0,0 +1,27 @@
>> +/*
>> + * Samsung's Exynos SoC syscon reboot/poweroff nodes common definition.
>> + *
>> + * This program is free software; you can redistribute it and/or modify
>> + * it under the terms of the GNU General Public License version 2 as
>> + * published by the Free Software Foundation.
>> + */
>> +
>> +/ {
>> +	soc {
>> +		compatible = "simple-bus";
>
> The exynos4 does not have soc node. I wonder whether we should provide
> here also address and size:
>                  #address-cells = <1>;
>                  #size-cells = <1>;
> 		ranges;
>
> Without this it works fine but that does not look correct enough.
>
> A minor effect of this patch on Exynos4 is that syscon-poweroff/reboot
> are now the only children of "soc" simple-bus (rest of platform devices
> is not)... but this is not a problem.
>
> Works fine so only the question about cells/ranges remains. Any comments?
>

I in fact had the #address-cells and #size-cells at the beginning but then
realized that both the syscon-poweroff and syscon-reboot nodes didn't have
a reg property so it felt strange to me to have those.

Also, I thought that maybe a SoC dtsi may need a different #address-cells
and #size-cells for the other child nodes so having those in this dtsi
could override the values in the SoC dtsi depending where is included.

So I thought it could do more harm than good but I've no strong opinion
and can add those if you prefer.

> Best regards,
> Krzysztof
>
>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
