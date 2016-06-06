From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 5/9] clocksource/drivers/exynos_mct: Convert init function
 to return error
Date: Mon, 6 Jun 2016 13:23:54 +0200
Message-ID: <57555D4A.8010001@linaro.org>
References: <1464770093-12667-1-git-send-email-daniel.lezcano@linaro.org>
 <1464770093-12667-6-git-send-email-daniel.lezcano@linaro.org>
 <575555CC.1020906@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f45.google.com ([74.125.82.45]:36566 "EHLO
	mail-wm0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750878AbcFFLX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2016 07:23:57 -0400
Received: by mail-wm0-f45.google.com with SMTP id n184so87291318wmn.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2016 04:23:57 -0700 (PDT)
In-Reply-To: <575555CC.1020906@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org, Kukjin Kim <kgene@kernel.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/SAMSUNG EXYNO..." <linux-samsung-soc@vger.kernel.org>

On 06/06/2016 12:51 PM, Krzysztof Kozlowski wrote:
> On 06/01/2016 10:34 AM, Daniel Lezcano wrote:
>> The init functions do not return any error. They behave as the follo=
wing:
>>
>>   - panic, thus leading to a kernel crash while another timer may wo=
rk and
>>     make the system boot up correctly
>>
>>   or
>>
>>   - print an error and let the caller unaware if the state of the sy=
stem
>>
>> Change that by converting the init functions to return an error conf=
orming
>> to the CLOCKSOURCE_OF_RET prototype.
>>
>> Proper error handling (rollback, errno value) will be changed later =
case
>> by case, thus this change just return back an error or success in th=
e init
>> function.
>
> I don't see the benefits of this change alone. You are replacing one
> non-return code to another always-return-success code. The effect is
> exactly the same. It would make sense to change it to CLOCKSOURCE_OF_=
RET
> along with proper error handling.
>

Hi Krzysztof,

I can understand you expect an error handling but, as stated in the=20
changelog, proper error handling will be done later. Currently, there=20
are roughly 80 drivers to changes the init function to return a value i=
n=20
order change the CLOCKSOURCE_OF_DECLARE macro. That is a quite importan=
t=20
number and changing also the internals will introduce bugs.

So the series (and there is a huge one coming right after this one),=20
will focus only on changing the init function to return a value, so we=20
can swap the clocksource table and rename CLOCKSOURCE_OF_DECLARE_RET=20
without the '_RET'. I want this to be done before the next PR in order=20
to prevent to have a double clksrc table.

If error handling is already taken into account and is trivial, I try t=
o=20
do the change, otherwise I let the function to return a success value.

Regarding the important number of drivers, if you have time to change=20
the init function in the exynos_mct, that will be more than welcome :)

   -- Daniel




--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
