From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 5/5] ARM: exynos: enable/disable cpuidle when cpu1 is
 down/up
Date: Fri, 18 Jan 2013 09:18:37 +0100
Message-ID: <50F9055D.8090708@linaro.org>
References: <1357318799-24378-1-git-send-email-daniel.lezcano@linaro.org> <1357318799-24378-5-git-send-email-daniel.lezcano@linaro.org> <CADGdYn7y_SSmLoEpeRjL8PDSZS-YJwC1QpRcUocSSnDyM8BRhQ@mail.gmail.com> <50EF3369.2060902@free.fr> <CADGdYn4eRbkZt_Rshqg-a_CoAmF5LBobzT3=3h09syaH0z6uJA@mail.gmail.com> <50F551F3.2060400@linaro.org> <00be01cdf52f$1bc907c0$535b1740$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f44.google.com ([209.85.214.44]:40115 "EHLO
	mail-bk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750750Ab3ARISl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Jan 2013 03:18:41 -0500
Received: by mail-bk0-f44.google.com with SMTP id w11so1804360bku.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Jan 2013 00:18:40 -0800 (PST)
In-Reply-To: <00be01cdf52f$1bc907c0$535b1740$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'amit daniel kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, linux-arm-kernel@lists.infradead.org, patches@linaro.org

On 01/18/2013 04:51 AM, Kukjin Kim wrote:
> Daniel Lezcano wrote:
>> On 01/10/2013 11:33 PM, amit daniel kachhap wrote:
>>> On Thu, Jan 10, 2013 at 1:32 PM, Daniel Lezcano <daniel.lezcano@fre=
e.fr>
>> wrote:
>>>> On 01/10/2013 09:07 PM, amit daniel kachhap wrote:
>>>>> Hi Daniel,
>>>> Hi Amit Daniel,
>>>>
>>>>> This hotplug noifiers looks fine. I suppose it should add extra s=
tate
>>>>> C1 in cpu0. If it is done like below than for normal cases(when a=
ll
>>>>> cpu's are online) there wont be any statistics for C0 state
>>>> I guess you meant state 0 which is WFI, right ?
>>>> C0 state is the intel semantic for cpu fully turned on.
>>> Yes I meant C0 as wfi
>>>>> also which
>>>>> is required. Other patches look good.
>>>> Ok, that makes sense to have statistics even if they are only doin=
g WFI.
>>>>
>>>> Then the patch 4/5 is not ok, no ?
>>> yes I suppose patch 4 and patch 5 are related and depends how you
>>> frame patch 5. I think it is better to create C0/C1 sysfs and other
>>> things in the beginning because it is a filesystem call and may
>>> increase the cpu hotplug time which is not worth. May be if cpuidle
>>> framework exposes some API to enable/disable states then it is bett=
er.
>>>
>>> For patch 1,2 and 3,
>>> Acked-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> Hi Kukjin,
>>
>> is it possible to take these patches [1-3/5] ?
>>
> Looks OK to me, I will apply with Amit's ack.

Cool Thanks !

>> The patches [3-4/5] could be ignored.
>>
> Probably, you mean [4-5/5] :-)

Oh, yes. Right ! :)

-- Daniel


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
