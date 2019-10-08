From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] regulator: core: Skip balancing of the enabled
 regulators in regulator_enable()
Date: Tue, 8 Oct 2019 14:38:55 +0200
Message-ID: <9268b455-ec66-97e1-909d-f964ac31c0ef@samsung.com>
References: <CGME20191008101720eucas1p2e0d1bca6e696848bf689067e05620679@eucas1p2.samsung.com>
        <20191008101709.13827-1-m.szyprowski@samsung.com>
        <20191008115025.GF4382@sirena.co.uk>
        <0e222fdd-4407-51ea-b75c-a62621cbe622@samsung.com>
        <20191008120611.GG4382@sirena.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008120611.GG4382@sirena.co.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Lucas Stach <l.stach@pengutronix.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-samsung-soc@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, Kamil Konieczny <k.konieczny@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Mark,

On 08.10.2019 14:06, Mark Brown wrote:
> On Tue, Oct 08, 2019 at 02:01:15PM +0200, Marek Szyprowski wrote:
>> On 08.10.2019 13:50, Mark Brown wrote:
>>> This then means that for users that might legitimately enable and
>>> disable regulators that need to be constrained are forced to change the
>>> voltage when they enable the regualtors in order to have their
>>> constraints take effect which seems bad.  I'd rather change the the
>>> cpufreq consumers to either not do the enable (since there really should
>>> be an always-on constraint this should be redundant, we might need to
>>> fix the core to take account of their settings though I think we lost
>>> that) or to set the voltage to whatever they need prior to doing their
>>> first enable, that seems more robust.
>> Well, I'm open for other ways of fixing this issue. Calling enable on
>> always-on regulator imho should not change its rate...
> Yes, although there is the whole "don't touch things until a consumer
> tells us to" thing going on.  I had expected that this was kicking in
> because we weren't paying attention to the constraints of disabled
> regulators but I can't see the code implementing that any more so I
> guess we removed it at some point (it was always debatable).

Then if I get it right, the issue is caused by the commit 7f93ff73f7c8 
("opp: core: add regulators enable and disable"). I've checked and 
indeed reverting it fixes Peach Pi to boot properly. The question is if 
this is desired behavior or not?

I've CC: Viresh, Kamil and Bartlomiej, here is the link to the beginning 
of this thread:

https://lkml.org/lkml/2019/10/8/265

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
