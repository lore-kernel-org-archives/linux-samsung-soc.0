From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Thu, 1 Sep 2016 11:36:54 +0200
Message-ID: <184ad5f6-5528-2ad7-7c2b-46beda9b6dc9@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
 <20160831174657.GA19969@kozik-lap>
 <c043b569-fbad-23bb-5807-5dda9cc8b37f@osg.samsung.com>
 <e3cdab3d-f1ef-f751-b169-e3328178b835@kernel.org>
 <0e8e0b3c-0dd9-c44b-d1ad-03c840d3a725@osg.samsung.com>
 <b051f0fc-e99c-769c-e790-aaafc749a9ef@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:53347
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750895AbcIAJhn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 05:37:43 -0400
In-Reply-To: <b051f0fc-e99c-769c-e790-aaafc749a9ef@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

Hello Krzysztof,

On 09/01/2016 11:28 AM, Krzysztof Kozlowski wrote:
> On 09/01/2016 11:19 AM, Javier Martinez Canillas wrote:
>> Hello Krzysztof,
>>
>> On 09/01/2016 11:05 AM, Krzysztof Kozlowski wrote:
>>> On 09/01/2016 10:43 AM, Javier Martinez Canillas wrote:
>>>>>> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>>>>> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>>>>> @@ -21,6 +21,11 @@
>>>>>>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>>>>>>  	};
>>>>>>  
>>>>>> +	memory {
>>>>>> +		device_type = "memory";
>>>>>> +		reg = <0 0>;
>>>>>> +	};
>>>>>
>>>>> This looks okay, but the default size and address cells won't be
>>>>> present. Won't that be a problem?
>>>>>
>>>>
>>>> They will be present since at this point exynos5440.dtsi is still including
>>>> exynos5440.dtsi, we are just overriding the memory node with the same values
>>>> than skeleton.dtsi so this can be removed later in patch 7/7.
>>>
>>> I don't get it. exynos5440.dtsi does not set size/address cells in top node.
>>>
>>
>> Sorry, maybe I'm misunderstanding your question. The size/address cells are set
>> in the top node by exynos5440.dtsi including the skeleton.dtsi (since these are
>> set in that included dtsi).
> 
> Where? Nothing in my sources...
> 
> 15 / {
> 16         compatible = "samsung,exynos5440", "samsung,exynos5";
> 17
> 18         interrupt-parent = <&gic>;
>

No, I meant that these are set by the fact that exynos5440.dtsi is including
the skeleton.dtsi, since the dtsi set these properties in the top node.

>>
>> IOW, scripts/dtc/dtx_diff doesn't show differences for these exynos5440 DTB
>> before and after $SUBJECT.
> 
> Maybe these are also the default values so no differences... stating
> them explicitly would be useful.
>

I could do it in this patch... but I don't see why that should be needed since:

a) All the others Exynos SoC dtsi file don't explicitly set these properties
   since are set by skeleton.dtsi when including it. So not adding them keeps
   exynos5440.dtsi consistent with the other SoC dtsi.

b) Adding those to the Exynos SoC dtsi when removing the skeleton.dtsi is done
   in a later patch of this series. Again, making it consistent with all the
   Exynos SoC dtsi since none will include skeleton.dtsi anymore.

> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
