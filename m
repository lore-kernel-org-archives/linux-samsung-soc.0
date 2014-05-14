From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 18:44:46 +0530
Message-ID: <CAKohpo=mL4Wd3wajXQHnYW463-L1=QX=5krpPhOJ=NYet3xXoA@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<6835645.2kTGeWTa9p@wuerfel>
	<CAKohpom_zuQoJ9xABJ2nJGbrubR=_iuE7_EtY6b41mhuhEtMsg@mail.gmail.com>
	<1480209.xTrtNKOy7N@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <1480209.xTrtNKOy7N@phil>
Sender: cpufreq-owner@vger.kernel.org
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Rob Herring <rob.herring@linaro.org>, Grant Likely <grant.likely@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Thomas Abraham <ta.omasab@gmail.com>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 14 May 2014 18:41, Heiko St=C3=BCbner <heiko@sntech.de> wrote:
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

Lets see what DT maintainers have to say on this, I would rather go for=
 a
more straight forward name: "scaling-driver" :) ..
