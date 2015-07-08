From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 0/4] ARM: dts: Use labels instead of full paths for
 Exynos5 pinctrl nodes
Date: Wed, 8 Jul 2015 07:15:42 -0700
Message-ID: <559D308E.3020809@osg.samsung.com>
References: <1436333790-18219-1-git-send-email-javier@osg.samsung.com>
 <559CDEDA.50608@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <559CDEDA.50608-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Krzysztof,

On 07/08/2015 01:27 AM, Krzysztof Kozlowski wrote:
> On 08.07.2015 14:36, Javier Martinez Canillas wrote:
>> Hello Kukjin and Krzysztof,
>>
>> This is a trivial series that changes Exynos5 pinctrl dtsi files to extend
>> the pinctrl nodes using labels instead of full paths.
>>
>> Using labels is less error prone since a misstyped label leads to a build
>> error while full paths can lead to the creation of a new node instead of
>> overriding the original which makes the mistake harder to detect.
>>
>> I tested the changes by decompiling the Exynos5* dtbs and comparing before
>> and after. The resulting dts were identical modulo some node ordering due
>> the pinctrl include change.
> 
> Is the DTB before and after the same? It should not change by re-ordering.
>

The DTB differ but I'm not that familiar with how dtc represents the FDT
to know what is changing in the binary.

But as mentioned, the decompiled DTS only changes in which position the
pinctrl are defined and both DTS are identical if I do:

$ cat decompiled.dts | sort

> Best regards,
> Krzysztof
> 

-- 
Javier Martinez Canillas
Sr. Linux Kernel Developer
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
