From: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/4] arm: topology: remove cpu_efficiency
Date: Wed, 6 Sep 2017 14:40:12 +0200
Message-ID: <CAKfTPtAvhujS1wpP1JE8OqCfsKXcrFxLQ0207WFg3ZhZjoHnBA@mail.gmail.com>
References: <20170830144120.9312-1-dietmar.eggemann@arm.com>
 <20170830144120.9312-2-dietmar.eggemann@arm.com> <CAKfTPtBXkAyAc1aqqqEn6Yt14_Y7LFp3oySY-=G3ZTuG-DR_nA@mail.gmail.com>
 <303d3f7b-5d64-e13a-c4f9-dd575958cafa@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <303d3f7b-5d64-e13a-c4f9-dd575958cafa-5wv7dgnIgG8@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
Cc: linux-kernel <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, LAK <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-samsung-soc <linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-renesas-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Kukjin Kim <kgene-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Krzysztof Kozlowski <krzk-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 6 September 2017 at 13:43, Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org> wrote:
> Hi Vincent,
>
> On 04/09/17 08:49, Vincent Guittot wrote:
>> Hi Dietmar,
>>
>> Removing cpu effificiency table looks good to me. Nevertheless, i have
>> some comments below for this patch.
>
> Thanks for the review!
>
>> On 30 August 2017 at 16:41, Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org> wrote:
>>> Remove the 'cpu_efficiency/clock-frequency dt property' based solution
>>> to set cpu capacity which was only working for Cortex-A15/A7 arm
>>> big.LITTLE systems.
>>>
>>> I.e. the 'capacity-dmips-mhz' based solution is now the only one. It is
>>> shared between arm and arm64 and works for every big.LITTLE system no
>>> matter which core types it consists of.
>>>
>>> Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
>>> Cc: Vincent Guittot <vincent.guittot-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>>> Cc: Juri Lelli <juri.lelli-5wv7dgnIgG8@public.gmane.org>
>>> Signed-off-by: Dietmar Eggemann <dietmar.eggemann-5wv7dgnIgG8@public.gmane.org>
>>> ---
>>>  arch/arm/kernel/topology.c | 113 ++-------------------------------------------
>>>  1 file changed, 3 insertions(+), 110 deletions(-)
>
> [...]
>
>>> @@ -115,73 +70,13 @@ static void __init parse_dt_topology(void)
>>>                         of_node_put(cn);
>>>                         continue;
>>
>> AFAICT, this continue is now useless as it was there to skipe the cpu
>> table efficiency method
>
> You're right ... will remove it.
>
> [...]
>
>>> -       if (cap_from_dt)
>>> -               topology_normalize_cpu_scale();
>>
>> Why have you moved the call to topology_normalize_cpu_scale() from
>> parse_dt_topology() to update_cpu_capacity() ?
>
> Didn't move it ? It's still called from parse_dt_topology().
>
>> You should keep it in parse_dt_topology() as itis part of the dt
>> parsing sequence
>
> Yes, this should be the case.
>
> [...]
>
>>> -/*
>>> - * Look for a customed capacity of a CPU in the cpu_capacity table during the
>>> - * boot. The update of all CPUs is in O(n^2) for heteregeneous system but the
>>> - * function returns directly for SMP system.
>>> - */
>>> -static void update_cpu_capacity(unsigned int cpu)
>>> -{
>>> -       if (!cpu_capacity(cpu) || cap_from_dt)
>>> -               return;
>>> -
>>> -       topology_set_cpu_scale(cpu, cpu_capacity(cpu) / middle_capacity);
>>> -
>>> -       pr_info("CPU%u: update cpu_capacity %lu\n",
>>> -               cpu, topology_get_cpu_scale(NULL, cpu));
>>> +       topology_normalize_cpu_scale();
>>>  }
>>
>> You can probably just removed update_cpu_capacity()
>
> I did remove update_cpu_capacity(). Maybe the patch layout is confusing?

yes you're right I have been confused by the layout

>
> [...]
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
