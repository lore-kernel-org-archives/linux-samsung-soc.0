From: Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0
 driver
Date: Wed, 14 May 2014 15:09:32 +0100
Message-ID: <5373791C.8070303@arm.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>	<6835645.2kTGeWTa9p@wuerfel>	<CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>	<1480209.xTrtNKOy7N@phil> <CAJuA9agJg3w6gmYOcB3HKYEHCDMfotQ1htWNscWYL_ONFyFKTQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([91.220.42.44]:38036 "EHLO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753122AbaENOJb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 10:09:31 -0400
In-Reply-To: <CAJuA9agJg3w6gmYOcB3HKYEHCDMfotQ1htWNscWYL_ONFyFKTQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <ta.omasab@gmail.com>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Viresh Kumar <viresh.kumar@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>


On 14/05/14 15:03, Thomas Abraham wrote:
> On Wed, May 14, 2014 at 6:41 PM, Heiko St=C3=BCbner <heiko@sntech.de>=
 wrote:
>> Am Mittwoch, 14. Mai 2014, 18:35:29 schrieb Viresh Kumar:
>>> On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
>>>> Could we please come up with a way to probe this from DT in the
>>>> cpufreq-cpu0 driver itself, so we don't have to add a device in ev=
ery
>>>> platform using it?
>>> Its followed that way because DT Maintainers had strong objections
>>> to creating virtual device nodes and haven't allowed creation of no=
des
>>> for cpufreq drivers.. For which there is no physical device, as CPU=
 already
>>> has a separate node..
>>
>> as we already have the "enable-method" property for enabling/disabli=
ng cpus,
>> would something like a "scaling-method" be feasible?
>>
>
> "scaling-method" also sounds like a software specific property. Would
> that be something that will be acceptable in dt?

How about dvfs-method ? But the value should not be based on the driver=
 they
use, but something more generic.

Regards,
Sudeep
