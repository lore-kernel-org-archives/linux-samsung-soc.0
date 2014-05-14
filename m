From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 15:18:01 +0200
Message-ID: <61090198.zodNL4xIig@wuerfel>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <1480209.xTrtNKOy7N@phil> <CAKohpo=mL4Wd3wajXQHnYW463-L1=QX=5krpPhOJ=NYet3xXoA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAKohpo=mL4Wd3wajXQHnYW463-L1=QX=5krpPhOJ=NYet3xXoA@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Viresh Kumar <viresh.kumar@linaro.org>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <rob.herring@linaro.org>, Grant Likely <grant.likely@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <ta.omasab@gmail.com>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 14 May 2014 18:44:46 Viresh Kumar wrote:
> On 14 May 2014 18:41, Heiko St=FCbner <heiko@sntech.de> wrote:
> > Am Mittwoch, 14. Mai 2014, 18:35:29 schrieb Viresh Kumar:
> >> On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
> >> > Could we please come up with a way to probe this from DT in the
> >> > cpufreq-cpu0 driver itself, so we don't have to add a device in =
every
> >> > platform using it?
>=20
> >> Its followed that way because DT Maintainers had strong objections
> >> to creating virtual device nodes and haven't allowed creation of n=
odes
> >> for cpufreq drivers.. For which there is no physical device, as CP=
U already
> >> has a separate node..
> >
> > as we already have the "enable-method" property for enabling/disabl=
ing cpus,
> > would something like a "scaling-method" be feasible?

Good idea to put it as a property into the CPU node.

> Lets see what DT maintainers have to say on this, I would rather go f=
or a
> more straight forward name: "scaling-driver"  ..

Both sound fine to me.

	Arnd
