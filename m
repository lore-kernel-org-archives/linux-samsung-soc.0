From: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v5 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Fri, 06 Mar 2015 11:42:19 +0900
Message-ID: <54F9140B.3060109@samsung.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
 <1425533911-14800-2-git-send-email-cw00.choi@samsung.com>
 <20150305122459.GC14093@leverpostej>
 <CAGTfZH3Bf1ueFO25NXFbN+Mvb9TcGbErbSp=a+vQ0=A+E07mQA@mail.gmail.com>
 <20150305170450.GG14093@leverpostej>
 <CAGTfZH3nkCvnuu+fC1Gv5DrRQXEg6Y19tQnh+phj6c_jAFpbvg@mail.gmail.com>
 <20150305185407.GK14093@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20150305185407.GK14093@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

On 03/06/2015 03:54 AM, Mark Rutland wrote:
> Hi,
> 
>>>>>> +       psci {
>>>>>> +               compatible = "arm,psci";
>>>>>> +               method = "smc";
>>>>>> +               cpu_off = <0x84000002>;
>>>>>> +               cpu_on = <0xC4000003>;
>>>>>> +       };
>>>>>
>>>>> Back at v2 you mentioned that CPU_OFF wasn't working [1].
>>>>>
>>>>> Do both CPU_ON and CPU_OFF work for all CPUs, including the boot CPU?
>>>>
>>>> The CPU1 ~ CPU7 are well woking about CPU_ON/OFF.
>>>> CPU0 (boot CPU) is only well working for CPU_OFF.
>>>> But when I try to turn on the CPU0 after CPU_OFF, I failed it.
>>>
>>> That's rather worrying. Can you look into what's going on here? I'd
>>> rather not have dts describing things which are known to be broken.
>>
>> The board dts don't include any node for CPU_ON/OFF.
> 
> I don't understand. The CPU_ON and CPU_OFF IDs are in the psci node
> quoted above, and all the CPUs had enable-method = "psci".

I mean that there are not additional dt node except for 'cpu' and 'psci' node.

> 
>> When I try to turn on the CPU0 (boot CPU), fail to turn on and lockup happen.
>> After lockup happen, I cannot use the console.
> 
> That sounds like a pretty major bug.
> 
> Are you able to investigate with a hardware debugger?

I can't do because there are not any jtag connector.

> 
> Do other CPUs eventually log errors regarding the lockup? Or is the
> machine completely dead from this point on?

I tested CPU0 on/off. When I turn on the CPU0, I fail it. But, kernel just show the error log without lockup.
I gave you wrong infromation about CPU0 off.

[test result of CPU0 on/off on Linux 4.0-rc2]
root@localhost:~# echo 0 > /sys/devices/system/cpu/cpu0/online 
[  420.965435] IRQ1 no longer affine to CPU0
[  420.965439] IRQ2 no longer affine to CPU0
[ 4631.194227] CPU0: shutdown
root@localhost:~# echo 1 > /sys/devices/system/cpu/cpu0/online
[ 1164.601644] CPU0: failed to come online
-bash: echo: write error: Input/output error

As I experienced, Exynos SoC could not turn off the CPU0 (boot cpu).
I think that we may need the hidden information of Exynos5433 from Exynos5433 architector.

> 
>>>>> I take it CPUs boot at EL2?
>>>
>>> Do the CPUs boot at EL1 or EL2?
>>
>> Unfortunately, I cannot check the secure firmware for Exynos5433 SoC.
>> I think that a few SoC provider probably would know it.
> 
> I guess I asked the wrong question.
> 
> Do CPUs enter the kernel at EL2 or at EL1?

Could you give me a tip how to check the kernel at EL2 or EL1?

Thanks,
Chanwoo Choi


--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
