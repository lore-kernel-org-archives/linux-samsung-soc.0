From: Tomasz Figa <t.figa-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCHv4 7/7] ARM: dts: Add device tree sources for Exynos3250
Date: Fri, 09 May 2014 10:01:39 +0200
Message-ID: <536C8B63.3000400@samsung.com>
References: <1398388572-30239-1-git-send-email-cw00.choi@samsung.com>
 <1398388572-30239-8-git-send-email-cw00.choi@samsung.com>
 <535B0324.50705@gmail.com> <536C2A1C.6030807@samsung.com>
 <536C6175.5000302@gmail.com> <536C7F65.50503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <536C7F65.50503-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Tomasz Figa <tomasz.figa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, marc.zyngier-5wv7dgnIgG8@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, hyunhee.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yj44.cho-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, sajjan.linux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, tushar.behera-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, sachin.kamat-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jaehoon Chung <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org



On 09.05.2014 09:10, Chanwoo Choi wrote:
> Hi Tomasz,
> 
> On 05/09/2014 02:02 PM, Tomasz Figa wrote:
>> Hi Chanwoo,
>>
>> On 09.05.2014 03:06, Chanwoo Choi wrote:
>>> On 04/26/2014 09:51 AM, Tomasz Figa wrote:
>>>> On 25.04.2014 03:16, Chanwoo Choi wrote:
>>
>> [snip]
>>
>>>>> +    cpus {
>>>>> +        #address-cells = <1>;
>>>>> +        #size-cells = <0>;
>>>>> +
>>>>> +        cpu@0 {
>>>>> +            device_type = "cpu";
>>>>> +            compatible = "arm,cortex-a7";
>>>>> +            reg = <0>;
>>>>> +            clock-frequency = <1000000000>;
>>>>> +        };
>>>>
>>>> Why only one CPU? I believe Exynos3250 is dual core.
>>>
>>> I'll add cpu1 information.
>>>
>>>> Also are physical IDs of the cores really 0 and 1? On Exynos4210 for example they are 0x900 and 0x901, while on Exynos4212 they are 0xa00 and 0xa01. Please check this.
>>>
>>> The 'reg' property means only hardware id(hwid) of CPU.
>>> You can check it on arm_dt_init_cpu_maps() in arch/arm/kernel/devtree.c.h.
>>> or Documentation/devicetree/bindings/arm/cpus.txt.
>>>
>>
>> Well, as described in Documentation/devicetree/bindings/arm/cpus.txt, on 32-bit ARM v7 or later CPUs the "reg" property should be equal to the lower 24-bits of MPIDR value of given CPU, which in addition to core ID includes also cluster ID, which can be non-zero, even on single cluster SoCs (like it is on Exynos4210 and 4x12).
> 
> I checked the lower 24-bit of MPIDR value for Exynos3250 in arm_dt_init_cpu_maps().
> - the lower 24-bit of MPIDR for CPU0 is '0x0'.

Fair enough. Thanks.

Best regards,
Tomasz
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
