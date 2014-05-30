From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: dts: exynos4: Fix reg sizes of GIC
Date: Sat, 31 May 2014 03:18:30 +0900
Message-ID: <5388CB76.2030806@samsung.com>
References: <1400855960-22033-1-git-send-email-t.figa@samsung.com> <53886E53.70206@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f170.google.com ([209.85.192.170]:43480 "EHLO
	mail-pd0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933015AbaE3SSe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 May 2014 14:18:34 -0400
Received: by mail-pd0-f170.google.com with SMTP id g10so1218347pdj.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 May 2014 11:18:34 -0700 (PDT)
In-Reply-To: <53886E53.70206@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Kukjin Kim <kgene.kim@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 05/30/14 20:41, Tomasz Figa wrote:
> Hi,
>
> On 23.05.2014 16:39, Tomasz Figa wrote:
>> This patch fixes reg entry sizes in GIC node that were not large enough
>> to cover whole regions.
>>
>> Signed-off-by: Tomasz Figa<t.figa@samsung.com>
>> ---
>>   arch/arm/boot/dts/exynos4.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
>> index b8ece4b..fbaf426 100644
>> --- a/arch/arm/boot/dts/exynos4.dtsi
>> +++ b/arch/arm/boot/dts/exynos4.dtsi
>> @@ -113,7 +113,7 @@
>>   		compatible = "arm,cortex-a9-gic";
>>   		#interrupt-cells =<3>;
>>   		interrupt-controller;
>> -		reg =<0x10490000 0x1000>,<0x10480000 0x100>;
>> +		reg =<0x10490000 0x10000>,<0x10480000 0x10000>;
>>   	};
>>
>>   	combiner: interrupt-controller@10440000 {
>>
>
> Ping.
>
Yeah, SZ_64K is used for GIC_CPU and GIC_DIST before moving on DT 
support. Applied, but I need to check this is required for stable tree...

Thanks,
Kukjin
