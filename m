From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 16:33:46 +0200
Message-ID: <11343238.VgTHVsC3iv@wuerfel>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com> <61090198.zodNL4xIig@wuerfel> <CAL_JsqL0Yi=SjAm0BtS_2SO2xg8kOaLsydo9m6qcZgb+Pcpa8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <CAL_JsqL0Yi=SjAm0BtS_2SO2xg8kOaLsydo9m6qcZgb+Pcpa8Q@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robherring2@gmail.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Abraham <ta.omasab@gmail.com>, Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, Rob Herring <rob.herring@linaro.org>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Thomas P Abraham <thomas.ab@samsung.com>, Grant Likely <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday 14 May 2014 08:45:23 Rob Herring wrote:
> On Wed, May 14, 2014 at 8:18 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> > On Wednesday 14 May 2014 18:44:46 Viresh Kumar wrote:
> >> On 14 May 2014 18:41, Heiko St=FCbner <heiko@sntech.de> wrote:
> >> > Am Mittwoch, 14. Mai 2014, 18:35:29 schrieb Viresh Kumar:
> >> >> On 14 May 2014 18:20, Arnd Bergmann <arnd@arndb.de> wrote:
> >> >> > Could we please come up with a way to probe this from DT in t=
he
> >> >> > cpufreq-cpu0 driver itself, so we don't have to add a device =
in every
> >> >> > platform using it?
> >>
> >> >> Its followed that way because DT Maintainers had strong objecti=
ons
> >> >> to creating virtual device nodes and haven't allowed creation o=
f nodes
> >> >> for cpufreq drivers.. For which there is no physical device, as=
 CPU already
> >> >> has a separate node..
> >> >
> >> > as we already have the "enable-method" property for enabling/dis=
abling cpus,
> >> > would something like a "scaling-method" be feasible?
> >
> > Good idea to put it as a property into the CPU node.
>=20
> We already have properties which indicate this driver can be used by =
a
> platform: opp table and a clock for the cpu. If this information is
> not sufficient to determine whether you can use this driver or not,
> then you simply need to match against the platform. Perhaps the match
> list should be a blacklist rather than a whitelist, so new platforms
> work without a kernel change.

We'd not only need a blacklist, but also a way to tell whether we
want to use the cpu0 or the big/little implementation, which currently
have indistinguishable bindings.

> Alternatively, create a new OPP binding that addresses this and all
> the other limitations in the current OPP binding.

Yes.

> >> Lets see what DT maintainers have to say on this, I would rather g=
o for a
> >> more straight forward name: "scaling-driver"  ..
> >
> > Both sound fine to me.
>=20
> The fact that linux needs a way to create a platform device to enable
> a certain driver is not a DT problem. I proposed a solution for how t=
o
> get this out of the platform code [1], but evidently we want people t=
o
> open code the exceptions and adding boilerplate helpers will just
> encourage the exceptions.

I think the only benefit we have from using platform devices at all
for cpufreq (not for cpuidle, which has a similar problem) is module
autoloading. I think your patch doesn't actually help with that.

	Arnd
