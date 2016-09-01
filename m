From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Thu, 1 Sep 2016 11:19:24 +0200
Message-ID: <0e8e0b3c-0dd9-c44b-d1ad-03c840d3a725@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
 <20160831174657.GA19969@kozik-lap>
 <c043b569-fbad-23bb-5807-5dda9cc8b37f@osg.samsung.com>
 <e3cdab3d-f1ef-f751-b169-e3328178b835@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <e3cdab3d-f1ef-f751-b169-e3328178b835-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 09/01/2016 11:05 AM, Krzysztof Kozlowski wrote:
> On 09/01/2016 10:43 AM, Javier Martinez Canillas wrote:
>>>> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>>> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>>> @@ -21,6 +21,11 @@
>>>>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>>>>  	};
>>>>  
>>>> +	memory {
>>>> +		device_type = "memory";
>>>> +		reg = <0 0>;
>>>> +	};
>>>
>>> This looks okay, but the default size and address cells won't be
>>> present. Won't that be a problem?
>>>
>>
>> They will be present since at this point exynos5440.dtsi is still including
>> exynos5440.dtsi, we are just overriding the memory node with the same values
>> than skeleton.dtsi so this can be removed later in patch 7/7.
> 
> I don't get it. exynos5440.dtsi does not set size/address cells in top node.
>

Sorry, maybe I'm misunderstanding your question. The size/address cells are set
in the top node by exynos5440.dtsi including the skeleton.dtsi (since these are
set in that included dtsi).

IOW, scripts/dtc/dtx_diff doesn't show differences for these exynos5440 DTB
before and after $SUBJECT.

> Best regards,
> Krzysztof
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
