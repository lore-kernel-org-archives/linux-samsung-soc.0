From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Thu, 01 Sep 2016 11:05:59 +0200
Message-ID: <e3cdab3d-f1ef-f751-b169-e3328178b835@kernel.org>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
 <20160831174657.GA19969@kozik-lap>
 <c043b569-fbad-23bb-5807-5dda9cc8b37f@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:25640 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751004AbcIAJGD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 1 Sep 2016 05:06:03 -0400
In-reply-to: <c043b569-fbad-23bb-5807-5dda9cc8b37f@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>

On 09/01/2016 10:43 AM, Javier Martinez Canillas wrote:
>>> --- a/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>> +++ b/arch/arm/boot/dts/exynos5440-ssdk5440.dts
>>> @@ -21,6 +21,11 @@
>>>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>>>  	};
>>>  
>>> +	memory {
>>> +		device_type = "memory";
>>> +		reg = <0 0>;
>>> +	};
>>
>> This looks okay, but the default size and address cells won't be
>> present. Won't that be a problem?
>>
> 
> They will be present since at this point exynos5440.dtsi is still including
> exynos5440.dtsi, we are just overriding the memory node with the same values
> than skeleton.dtsi so this can be removed later in patch 7/7.

I don't get it. exynos5440.dtsi does not set size/address cells in top node.

Best regards,
Krzysztof
