From: Chanwoo Choi <cwchoi00-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/9] arm64: dts: exynos: Add dts files for 64-bit
 Exynos5433 SoC
Date: Fri, 6 Mar 2015 01:12:43 +0900
Message-ID: <CAGTfZH3Bf1ueFO25NXFbN+Mvb9TcGbErbSp=a+vQ0=A+E07mQA@mail.gmail.com>
References: <1425533911-14800-1-git-send-email-cw00.choi@samsung.com>
	<1425533911-14800-2-git-send-email-cw00.choi@samsung.com>
	<20150305122459.GC14093@leverpostej>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150305122459.GC14093@leverpostej>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Chanwoo Choi <cw00.choi-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Marc Zyngier <Marc.Zyngier-5wv7dgnIgG8@public.gmane.org>, "arnd-r2nGTMty4D4@public.gmane.org" <arnd-r2nGTMty4D4@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <Will.Deacon-5wv7dgnIgG8@public.gmane.org>, "inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <chanho61.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <sw0312.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <jh80.chung-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org" <a.kesavan-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On Thu, Mar 5, 2015 at 9:24 PM, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org> wrote:
> On Thu, Mar 05, 2015 at 05:38:23AM +0000, Chanwoo Choi wrote:
>> This patch adds new Exynos5433 dtsi to support 64-bit Exynos5433 SoC based on
>> Octal core CPUs (quad Cortex-A57 and quad Cortex-A53). And Exynos5433 supports
>> PSCI (Power State Coordination Interface) v0.1.
>>
>> This patch includes following dt node to support Exynos5433 SoC:
>> 1. Octa core for big.LITTLE architecture
>> - Cortex-A53 LITTLE Quad-core
>> - Cortex-A57 big Quad-core
>> - Support PSCI v0.1
>
> [...]
>
>> +       psci {
>> +               compatible = "arm,psci";
>> +               method = "smc";
>> +               cpu_off = <0x84000002>;
>> +               cpu_on = <0xC4000003>;
>> +       };
>
> Back at v2 you mentioned that CPU_OFF wasn't working [1].
>
> Do both CPU_ON and CPU_OFF work for all CPUs, including the boot CPU?

The CPU1 ~ CPU7 are well woking about CPU_ON/OFF.
CPU0 (boot CPU) is only well working for CPU_OFF.
But when I try to turn on the CPU0 after CPU_OFF, I failed it.

>
> I take it CPUs boot at EL2?
>
> [...]
>
>> +               timer {
>> +                       compatible = "arm,armv8-timer";
>> +                       interrupts = <1 13 0xff04>,
>> +                                    <1 14 0xff04>,
>> +                                    <1 11 0xff04>,
>> +                                    <1 10 0xff04>;
>> +               };
>
> The timer node should be moved under the root node. It doesn't live on
> the bus; it's a component of the CPU.

OK. I'll move it according to your comment.

Thanks,
Chanwoo Choi
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
