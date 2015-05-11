From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2] clocksource: exynos_mct: fix for sleeping in atomic
 ctx handling cpu hotplug notif.
Date: Mon, 11 May 2015 09:30:15 +0200
Message-ID: <55505A87.3030807@linaro.org>
References: <1426151496-5509-1-git-send-email-d.eppel@samsung.com> <CAJKOXPcXk+xiYUoy6QnfRC2bPsNpTqLYp6-0X1xgCvZ4s5nGGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPcXk+xiYUoy6QnfRC2bPsNpTqLYp6-0X1xgCvZ4s5nGGw@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, tglx@linutronix.de
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, kyungmin.park@samsung.com, kgene@kernel.org, Damian Eppel <d.eppel@samsung.com>, m.jabrzyk@samsung.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On 05/11/2015 03:33 AM, Krzysztof Kozlowski wrote:
> 2015-03-12 18:11 GMT+09:00 Damian Eppel <d.eppel@samsung.com>:
>> This is to fix an issue of sleeping in atomic context when processin=
g
>> hotplug notifications in Exynos MCT(Multi-Core Timer).
>> The issue was reproducible on Exynos 3250 (Rinato board) and Exynos =
5420
>> (Arndale Octa board).
>>
>> Whilst testing cpu hotplug events on kernel configured with DEBUG_PR=
EEMPT
>> and DEBUG_ATOMIC_SLEEP we get following BUG message, caused by calli=
ng
>> request_irq() and free_irq() in the context of hotplug notification
>> (which is in this case atomic context).
>>
>> root@target:~# echo 0 > /sys/devices/system/cpu/cpu1/online
>>
>> [   25.157867] IRQ18 no longer affine to CPU1
>> ...
>> [   25.158445] CPU1: shutdown
>>
>> root@target:~# echo 1 > /sys/devices/system/cpu/cpu1/online
>>
>> [   40.785859] CPU1: Software reset
>> [   40.786660] BUG: sleeping function called from invalid context at=
 mm/slub.c:1241
>> [   40.786668] in_atomic(): 1, irqs_disabled(): 128, pid: 0, name: s=
wapper/1
>> [   40.786678] Preemption disabled at:[<  (null)>]   (null)
>> [   40.786681]
>> [   40.786692] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 3.19.0-rc4-=
00024-g7dca860 #36
>> [   40.786698] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [   40.786728] [<c0014a00>] (unwind_backtrace) from [<c0011980>] (sh=
ow_stack+0x10/0x14)
>> [   40.786747] [<c0011980>] (show_stack) from [<c0449ba0>] (dump_sta=
ck+0x70/0xbc)
>> [   40.786767] [<c0449ba0>] (dump_stack) from [<c00c6124>] (kmem_cac=
he_alloc+0xd8/0x170)
>> [   40.786785] [<c00c6124>] (kmem_cache_alloc) from [<c005d6f8>] (re=
quest_threaded_irq+0x64/0x128)
>> [   40.786804] [<c005d6f8>] (request_threaded_irq) from [<c0350b8c>]=
 (exynos4_local_timer_setup+0xc0/0x13c)
>> [   40.786820] [<c0350b8c>] (exynos4_local_timer_setup) from [<c0350=
ca8>] (exynos4_mct_cpu_notify+0x30/0xa8)
>> [   40.786838] [<c0350ca8>] (exynos4_mct_cpu_notify) from [<c003b330=
>] (notifier_call_chain+0x44/0x84)
>> [   40.786857] [<c003b330>] (notifier_call_chain) from [<c0022fd4>] =
(__cpu_notify+0x28/0x44)
>> [   40.786873] [<c0022fd4>] (__cpu_notify) from [<c0013714>] (second=
ary_start_kernel+0xec/0x150)
>> [   40.786886] [<c0013714>] (secondary_start_kernel) from [<40008764=
>] (0x40008764)
>>
>> Solution:
>> Clockevent irqs cannot be requested/freed every time cpu is
>> hot-plugged/unplugged as CPU_STARTING/CPU_DYING notifications
>> that signals hotplug or unplug events are sent with both preemption
>> and local interrupts disabled. Since request_irq() may sleep it is
>> moved to the initialization stage and performed for all possible
>> cpus prior putting them online. Then, in the case of hotplug event
>> the irq asociated with the given cpu will simply be enabled.
>> Similarly on cpu unplug event the interrupt is not freed but just
>> disabled.
>>
>> Note that after successful request_irq() call for a clockevent devic=
e
>> associated to given cpu the requested irq is disabled (via disable_i=
rq()).
>> That is to make things symmetric as we expect hotplug event as a nex=
t
>> thing (which will enable irq again). This should not pose any proble=
ms
>> because at the time of requesting irq the clockevent device is not
>> fully initialized yet, therefore should not produce interrupts at th=
at point.
>>
>> For disabling an irq at cpu unplug notification disable_irq_nosync()=
 is
>> chosen which is a non-blocking function. This again shouldn't be a p=
roblem as
>> prior sending CPU_DYING notification interrupts are migrated away
>> from the cpu.
>>
>> Fixes: 7114cd749a12 ("clocksource: exynos_mct: use (request/free)_ir=
q calls for local timer registration")
>> Signed-off-by: Damian Eppel <d.eppel@samsung.com>
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> (Tested on Arndale Octa Board)
>> Tested-by: Marcin Jabrzyk <m.jabrzyk@samsung.com>
>> (Tested on Rinato B2 (Exynos 3250) board)
>
> Hi Daniel and Thomas,
>
> Do you have any comments on this patch? Could you pick it up?

Not yet.


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
