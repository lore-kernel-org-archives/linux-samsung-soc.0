From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 19:33:56 +0530
Message-ID: <CAJuA9agJg3w6gmYOcB3HKYEHCDMfotQ1htWNscWYL_ONFyFKTQ@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<6835645.2kTGeWTa9p@wuerfel>
	<CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>
	<1480209.xTrtNKOy7N@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33677 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755383AbaENOD7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 May 2014 10:03:59 -0400
In-Reply-To: <1480209.xTrtNKOy7N@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>

On Wed, May 14, 2014 at 6:41 PM, Heiko St=C3=BCbner <heiko@sntech.de> w=
rote:
> Am Mittwoch, 14. Mai 2014, 18:35:29 schrieb Viresh Kumar:
>> On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
>> > Could we please come up with a way to probe this from DT in the
>> > cpufreq-cpu0 driver itself, so we don't have to add a device in ev=
ery
>> > platform using it?
>> Its followed that way because DT Maintainers had strong objections
>> to creating virtual device nodes and haven't allowed creation of nod=
es
>> for cpufreq drivers.. For which there is no physical device, as CPU =
already
>> has a separate node..
>
> as we already have the "enable-method" property for enabling/disablin=
g cpus,
> would something like a "scaling-method" be feasible?
>

"scaling-method" also sounds like a software specific property. Would
that be something that will be acceptable in dt?
