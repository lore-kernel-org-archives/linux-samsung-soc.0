From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: exynos: Add MFC memory banks for Peach boards
Date: Fri, 6 May 2016 10:12:08 -0400
Message-ID: <23883a5f-bfed-9474-51a7-14271b6c391f@osg.samsung.com>
References: <1461871311-18344-1-git-send-email-javier@osg.samsung.com>
 <cef99c21-3886-c055-05bf-cd04e3b588b3@osg.samsung.com>
 <572CA2F3.4050407@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <572CA2F3.4050407-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 05/06/2016 09:58 AM, Krzysztof Kozlowski wrote:
> On 05/06/2016 03:44 PM, Javier Martinez Canillas wrote:
>> Hello Krzysztof,
>>
>> On 04/28/2016 03:21 PM, Javier Martinez Canillas wrote:
>>> The MFC nodes with the memory regions reserved for memory allocations
>>> are missing in the Exynos5420 Peach Pit and Exynos5800 Peach Pi DTS.
>>>
>>> This causes the s5p-mfc driver probe to fail with the following error:
>>>
>>> [    4.140647] s5p_mfc_alloc_memdevs:1072: Failed to declare coherent memory for MFC device
>>> [    4.216163] s5p-mfc: probe of 11000000.codec failed with error -12
>>>
>>> Add the missing nodes so the driver probes and the {en,de}coder video
>>> nodes are registered correctly:
>>>
>>> [    4.096277] s5p-mfc 11000000.codec: decoder registered as /dev/video4
>>> [    4.102282] s5p-mfc 11000000.codec: encoder registered as /dev/video5
>>>
>>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>>>
>>> ---
>>>
>>>  arch/arm/boot/dts/exynos5420-peach-pit.dts | 5 +++++
>>>  arch/arm/boot/dts/exynos5800-peach-pi.dts  | 5 +++++
>>>  2 files changed, 10 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> index b644858231b6..f9d2e4f1a0e0 100644
>>> --- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> +++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
>>> @@ -694,6 +694,11 @@
>>>  	status = "okay";
>>>  };
>>>  
>>> +&mfc {
>>> +	samsung,mfc-r = <0x43000000 0x800000>;
>>> +	samsung,mfc-l = <0x51000000 0x800000>;
>>> +};
>>> +
>>>  &mmc_0 {
>>>  	status = "okay";
>>>  	num-slots = <1>;
>>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> index 6ba9aec15485..62ceb89e073f 100644
>>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>>> @@ -669,6 +669,11 @@
>>>  	status = "okay";
>>>  };
>>>  
>>> +&mfc {
>>> +	samsung,mfc-r = <0x43000000 0x800000>;
>>> +	samsung,mfc-l = <0x51000000 0x800000>;
>>> +};
>>> +
>>>  &mmc_0 {
>>>  	status = "okay";
>>>  	num-slots = <1>;
>>>
>>
>> Any comments about this patch?
> 
> What is up with the rush now (a week for ping)? As I understand, this

Sorry about that... I should had waited for more time for the ping indeed.
I just thought the patch was trivial and you usually answer within days.

> was broken for very long time on these boards (since adding DT support
> in 2012?).
> 

Yes, that's correct. And in fact even the s5p-mfc driver is currently
not working in mainline. But I posted some fixes and will post more
patches from other people today to get it working. So I thought that
would be nice to have this in since one of my test machines is a Peach.

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
