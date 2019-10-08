From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 18:02:08 +0200
Message-ID: <86eb668d-7bcf-798b-dabb-95071d16cbb6@samsung.com>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
        <20191008101709.13827-1-m.szyprowski@samsung.com>
        <20191008115025.GF4382@sirena.co.uk>
        <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
        <20191008120611.GG4382@sirena.co.uk>
        <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
        <20191008124736.GJ4382@sirena.co.uk>
        <86b9b4b5-cca5-9052-7c87-c5679dfffff4@samsung.com>
        <20191008154844.GM4382@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008154844.GM4382@sirena.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org


On 10/8/19 5:48 PM, Mark Brown wrote:
> On Tue, Oct 08, 2019 at 03:24:17PM +0200, Bartlomiej Zolnierkiewicz wrote:
> 
>> Commit 7f93ff73f7c8 ("opp: core: add regulators enable and disable")
>> currently can be safely reverted as all affected users use always-on
>> regulators. However IMHO it should be possible to enable always-on
>> regulator without side-effects.
> 
> With coupled regulators you might have something kicking in because a
> change was made on a completely different regulator...  If we don't take
> account of coupling requirements we'd doubtless have issues with that at
> some point.

OK, I have not considered this.

>> When it comes to setting regulator constraints before doing enable
>> operation, it also seems to be possible solution but would require
>> splitting regulator_set_voltage() operation on two functions:
> 
>> - one for setting constraints (before regulator_enable() operation)
> 
>> - the other one actually setting voltage (after enable operation)
> 
> I don't follow?  What would a "constraint" be in this context and how
> would it be different to the voltage range you'd set in normal operation?

The constraint here would be just the voltage range. I just wanted to
point out that the actual voltage set operation (on the hardware itself
not the internal subsystem bookkeeping) shouldn't be done before enable
operation (especially in context of non-coupled regulators).

Taking into account your remark about enable operation on coupled
regulators and Dmitry's mail about cpufreq issue I think now that just
dropping opp change is the most straightforward fix.

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
