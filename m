From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled regulators
 in regulator_enable()
Date: Tue, 8 Oct 2019 18:02:36 +0300
Message-ID: <be8d3280-9855-ed18-b2ab-d7fb28d80b82@gmail.com>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
 <20191008101709.13827-1-m.szyprowski@samsung.com>
 <20191008115025.GF4382@sirena.co.uk>
 <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
 <20191008120611.GG4382@sirena.co.uk>
 <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
 <20191008124736.GJ4382@sirena.co.uk>
 <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Mark Brown <broonie@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

08.10.2019 16:24, Bartlomiej Zolnierkiewicz пишет:
> 
> On 10/8/19 2:47 PM, Mark Brown wrote:
>> On Tue, Oct 08, 2019 at 02:38:55PM +0200, Marek Szyprowski wrote:
>>
>>> Then if I get it right, the issue is caused by the commit 7f93ff73f7c8 
>>> ("opp: core: add regulators enable and disable"). I've checked and 
>>> indeed reverting it fixes Peach Pi to boot properly.

Yes, please note that the "ww_mutex" patch didn't change the original logic and only
rearranged the code a tad.

 The question is if
>>> this is desired behavior or not?
>>
>> That doesn't seem ideal - either it's redundant for regulators that need
>> to be marked as always-on anyway or it's going to force the regulators
>> on when a device could do runtime PM (eg, if the same code can run on
>> something like a GPU which can be turned off while the screen is off or
>> is displaying a static image).
> 
> Commit 7f93ff73f7c8 ("opp: core: add regulators enable and disable")
> currently can be safely reverted as all affected users use always-on
> regulators. However IMHO it should be possible to enable always-on
> regulator without side-effects.
> 
> When it comes to setting regulator constraints before doing enable
> operation, it also seems to be possible solution but would require
> splitting regulator_set_voltage() operation on two functions:
> 
> - one for setting constraints (before regulator_enable() operation)
> 
> - the other one actually setting voltage (after enable operation)
> 
> Unfortunately this is much bigger task and doesn't seem to be -rc
> time material so I'm in favor of just applying Marek's fix as it is
> for now.

That OPP patch caused the same problem for the NVIDIA Tegra20 CPUFreq driver (in-progress)
and I resolved it in the coupler's code [0]. Perhaps the generic coupler could do the same
thing by assuming that min_uV=current_uV until any consumer sets the voltage, i.e. if
regulator_check_consumers(min_uV=0) returns min_uV=0.

[0] https://lkml.org/lkml/2019/7/25/892
