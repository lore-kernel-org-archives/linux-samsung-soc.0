From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 1/2] ARM: s3c64xx: cpuidle: convert to platform driver
Date: Wed, 30 Oct 2013 15:50:24 -0700
Message-ID: <52718D30.8010509@linaro.org>
References: <1382685074-16502-1-git-send-email-daniel.lezcano@linaro.org> <526AEF6B.2000404@linaro.org> <52717D97.8090905@linaro.org> <1807659.lxGmRkUGnf@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f53.google.com ([209.85.219.53]:56539 "EHLO
	mail-oa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751848Ab3J3Wu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 18:50:26 -0400
Received: by mail-oa0-f53.google.com with SMTP id n12so2193415oag.26
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Oct 2013 15:50:26 -0700 (PDT)
In-Reply-To: <1807659.lxGmRkUGnf@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 10/30/2013 03:40 PM, Tomasz Figa wrote:
> Hi Daniel,
>
> On Wednesday 30 of October 2013 14:43:51 Daniel Lezcano wrote:
>> On 10/25/2013 03:23 PM, Daniel Lezcano wrote:
>>
>> [ ... ]
>>
>>>>> Won't it be worth to add a new WFI_SLEEP state to the cpuidle dri=
ver
>>>>> ?
>>>>
>>>> I don't think so. How a suspend-to-RAM specific thing like WFI_SLE=
EP
>>>> could
>>>> be relevant to a cpuidle driver? (Unless there are some plans to
>>>> consolidate STR with cpuidle that I haven't heard about...)
>>>
>>> I finally found a documentation for the s3c6410x and the descriptio=
n
>>> of
>>> the different modes. Indeed, the sleep mode is not adequate for a
>>> cpuidle state. What about the 'stop' and 'deep stop' state ?
>>
>> Hi Thomas,
>>
>> just a reminder about the question above, so I can go ahead: fix wha=
t
>> you pointed out or remove the driver directly.
>>
>> You mentionned in the previous email the STOP is not usful because i=
t
>> can be controlled by manually outside of the cpuidle driver. But I s=
ee
>> in the documentation, the stop states power gates the cpu and deep-s=
top
>> stops the regulator.
>
> STOP clock-gates the CPU and DEEP-STOP power-gates it by stopping the
> regulator.
>
> There are some interesting aspects of those modes, like memory self-
> refresh, PLL power-off and system-wide down clocking, but I believe t=
hey
> are too tricky to handle (coupling with device PM, stopped timers) an=
d
> with too little possible power saving to justify the effort of adding
> support for them.
>
> In the end, I haven't seen support for them implemented even in stran=
ge
> vendor kernels used even on production devices, like Android phones.
>
>>
>> If these states have to been added later, still it worth to remove t=
he
>> driver ?
>
> I don't think that anybody is even going to add support for them and =
by
> anybody I should probably mean myself, since I'm currently the only p=
erson
> actively adding new code for this platform, as a part of my hobby.

Ok, I will kill the driver then.

Thanks
   -- Daniel


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
