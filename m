From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: dts: exynos: Use macro for PWM signal polarity
 in Exynos4 boards
Date: Fri, 28 Oct 2016 10:49:14 -0300
Message-ID: <31a8217c-969e-63a4-167c-9027ab1d8581@osg.samsung.com>
References: <1477590438-18095-1-git-send-email-javier@osg.samsung.com>
 <20161028134138.GB5646@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161028134138.GB5646@kozik-lap>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 10/28/2016 10:41 AM, Krzysztof Kozlowski wrote:
> On Thu, Oct 27, 2016 at 02:47:17PM -0300, Javier Martinez Canillas wrote:
>> Using the PWM_POLARITY_INVERTED macro instead of the hardcoded number
>> 0 makes the DTS easier to read.
> 
> 
> Eeee.... PWM_POLARITY_INVERTED = 1 << 0 = 1.
> 
> And you are replacing 0 with 1. Hm? This is not described at all in
> commit message...
> 
> Best regards,
> Krzysztof
> 

Damn! I don't know how I misread the DTS macro as 0, and didn't find issues
when testing the patches on an Exynos5800 Peach Pi.

I should had run scripts/dtc/dtx_diff to notice that the DTB changed, I'm
so sorry about that...

Please discard the patches.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
