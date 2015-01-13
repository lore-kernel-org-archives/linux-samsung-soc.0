From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 1/6] ARM: Exynos: add support for sub-power domains
Date: Tue, 13 Jan 2015 15:44:47 +0100
Message-ID: <CAPDyKFp1mqLQmRmNtrATjiwwVe42barMtaT6gdsDqBg3pnpL+g@mail.gmail.com>
References: <1421141991-15155-1-git-send-email-m.szyprowski@samsung.com>
	<1421141991-15155-2-git-send-email-m.szyprowski@samsung.com>
	<CAPDyKFpVuoKN0EgZG2qso3GbYZFqEMet2Ca06J7u8YEO=-JfCg@mail.gmail.com>
	<54B4F947.1000704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f180.google.com ([209.85.216.180]:40907 "EHLO
	mail-qc0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752745AbbAMOos (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Jan 2015 09:44:48 -0500
Received: by mail-qc0-f180.google.com with SMTP id i8so2446094qcq.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 Jan 2015 06:44:48 -0800 (PST)
In-Reply-To: <54B4F947.1000704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Kyungmin Park <kyungmin.park@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>

On 13 January 2015 at 11:53, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Hello,
>
>
> On 2015-01-13 11:44, Ulf Hansson wrote:
>>
>> On 13 January 2015 at 10:39, Marek Szyprowski <m.szyprowski@samsung.com>
>> wrote:
>>>
>>> This patch adds support for making one power domain a sub-domain of
>>> other domain. This is useful for modeling power dependences for devices
>>> like TV Mixer or Camera ISP, which needs to have more than one power
>>> domain enabled to be operational.
>>>
>>> Based on previous work by Amit Daniel Kachhap <amit.daniel@samsung.com>.
>>>
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   .../bindings/arm/exynos/power_domain.txt           |  2 ++
>>>   arch/arm/mach-exynos/pm_domains.c                  | 28
>>> ++++++++++++++++++++++
>>>   2 files changed, 30 insertions(+)
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>>> b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>>> index f4445e5..28918a9 100644
>>> --- a/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>>> +++ b/Documentation/devicetree/bindings/arm/exynos/power_domain.txt
>>> @@ -22,6 +22,8 @@ Optional Properties:
>>>          - pclkN, clkN: Pairs of parent of input clock and input clock to
>>> the
>>>                  devices in this power domain. Maximum of 4 pairs (N = 0
>>> to 3)
>>>                  are supported currently.
>>> +- power-domains: generic power domain binding pointing to a master power
>>> domain
>>> +                that the given domain is a part of
>>
>> I would prefer this to be documented as a generic way to configure
>> power domain parents, in
>> Documentation/devicetree/bindings/power/power_domain.txt.
>
>
> Well, right now it is a specific feature of exynos power domains, however if
> you
> want I can add a note in
> Documentation/devicetree/bindings/power/power_domain.txt
> on defining child-parent relation. However it will be still up to the power
> domain
> providers to implement support for it.

We don't want one solution per provider to describe child-parent
relations of PM domains in DT, that why I think it's important that we
document this in
Documentation/devicetree/bindings/power/power_domain.txt

Kind regards
Uffe
