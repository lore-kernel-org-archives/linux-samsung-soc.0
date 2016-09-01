From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: Re: [PATCH 1/7] ARM: dts: exynos: Add missing memory node for
 Exynos5440 boards
Date: Thu, 1 Sep 2016 10:30:20 +0200
Message-ID: <e9af2bf5-56e0-cba8-2648-c3754fde410a@osg.samsung.com>
References: <1472645679-5696-1-git-send-email-javier@osg.samsung.com>
 <1472645679-5696-2-git-send-email-javier@osg.samsung.com>
 <3638650.aebblMKNhB@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3638650.aebblMKNhB@amdc1976>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hello Bartlomiej,

On 08/31/2016 07:22 PM, Bartlomiej Zolnierkiewicz wrote:
> 
> Hi,
> 
> On Wednesday, August 31, 2016 02:14:33 PM Javier Martinez Canillas wrote:
>> The skeleton.dtsi file was removed in ARM64 for different reasons as
>> explained in commit ("3ebee5a2e141 arm64: dts: kill skeleton.dtsi").
>>
>> These also applies to ARM and it will also allow to get rid of the
>> following DTC warnings in the future:
>>
>> "Node /memory has a reg or ranges property, but no unit name"
>>
>> But these boards don't have a memory node defined, so removing the
>> skeleton.dtsi inclusion in exynos4.dtsi will cause a change in the
>> compiled DTB. Add a dummy memory node so the compiled DTB doesn't
>> change if the skeleton.dtsi is removed from exynos4.dtsi.
>>
>> Eventually the correct starting addresses and sizes should be used
>> but I didn't find that information.
>>
>> Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
>> ---
>>
>>  arch/arm/boot/dts/exynos5440-sd5v1.dts    | 5 +++++
>>  arch/arm/boot/dts/exynos5440-ssdk5440.dts | 5 +++++
>>  2 files changed, 10 insertions(+)
>>
>> diff --git a/arch/arm/boot/dts/exynos5440-sd5v1.dts b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>> index a98501bab6fc..333db4ff373a 100644
>> --- a/arch/arm/boot/dts/exynos5440-sd5v1.dts
>> +++ b/arch/arm/boot/dts/exynos5440-sd5v1.dts
>> @@ -20,6 +20,11 @@
>>  		bootargs = "root=/dev/sda2 rw rootwait ignore_loglevel earlyprintk no_console_suspend mem=2048M@0x80000000 mem=6144M@0x100000000 console=ttySAC0,115200";
>>  	};
>>  
>> +	memory {
>> +		device_type = "memory";
>> +		reg = <0 0>;
>> +	};
> 
> I think that this node deserves a FIXME comment.
> 

Agreed. I'll add one in v2 for both nodes.

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
