From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 17/17] ARM: exynos: config: Enable cpuidle
Date: Fri, 04 Apr 2014 11:16:08 +0200
Message-ID: <533E7858.2030403@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>	<1396597683-6969-18-git-send-email-daniel.lezcano@linaro.org> <CAKohpo=Dbp1uSCpOMhAx5vk9ddYP=DK14Od6_aoAuyX3mrwzew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:57289 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbaDDJPy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:15:54 -0400
Received: by mail-wg0-f48.google.com with SMTP id l18so3151568wgh.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:15:53 -0700 (PDT)
In-Reply-To: <CAKohpo=Dbp1uSCpOMhAx5vk9ddYP=DK14Od6_aoAuyX3mrwzew@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 04/04/2014 11:10 AM, Viresh Kumar wrote:
> On 4 April 2014 13:18, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>> The cpuidle driver is broken since v3.11 and now we are at v3.14.
>>
>> Default the cpuidle driver to favorize a better detection next time.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>   arch/arm/configs/exynos_defconfig |    1 +
>>   1 file changed, 1 insertion(+)
>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

Thanks Viresh for the review !


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
