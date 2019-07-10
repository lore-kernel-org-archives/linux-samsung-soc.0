From: Kamil Konieczny <k.konieczny@partner.samsung.com>
Subject: Re: [PATCH 0/3] add coupled regulators for Exynos5422/5800
Date: Wed, 10 Jul 2019 15:51:06 +0200
Message-ID: <631ffd68-7aab-2483-8799-2019bf3bb444@partner.samsung.com>
References: <CGME20190708141158eucas1p17d4b50978dbe1e5c876ce6d8f433cc95@eucas1p1.samsung.com>
        <20190708141140.24379-1-k.konieczny@partner.samsung.com>
        <CAJKOXPd+UZ2MdrTVfBv5UYzK5LgKNQHUFzRbRNeq271EaDSchg@mail.gmail.com>
        <91f65527-3440-90fd-4096-5824fba1df78@partner.samsung.com>
        <CAJKOXPc1rOyFujyWk4HwmQb6YEXd=CEHKwN8AH_pKxk-6CA08w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPc1rOyFujyWk4HwmQb6YEXd=CEHKwN8AH_pKxk-6CA08w@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 10.07.2019 12:14, Krzysztof Kozlowski wrote:
> On Wed, 10 Jul 2019 at 12:03, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> On 10.07.2019 11:00, Krzysztof Kozlowski wrote:
>>> On Mon, 8 Jul 2019 at 16:12, <k.konieczny@partner.samsung.com> wrote:
>>>>
>>>> From: Kamil Konieczny <k.konieczny@partner.samsung.com>
>>>>
>>>> Hi,
>>>>
>>>> The main purpose of this patch series is to add coupled regulators for
>>>> Exynos5422/5800 to keep constrain on voltage difference between vdd_arm
>>>> and vdd_int to be at most 300mV. In exynos-bus instead of using
>>>> regulator_set_voltage_tol() with default voltage tolerance it should be
>>>> used regulator_set_voltage_triplet() with volatege range, and this is
>>>> already present in opp/core.c code, so it can be reused. While at this,
>>>> move setting regulators into opp/core.
>>>>
>>>> This patchset was tested on Odroid XU3.
>>>>
>>>> The last patch depends on two previous.
>>>
>>> So you break the ABI... I assume that patchset maintains
>>> bisectability. However there is no explanation why ABI break is needed
>>> so this does not look good...
>>
>> Patchset is bisectable, first one is simple and do not depends on others,
>> second depends on first, last depends on first and second.
>>
>> What do you mean by breaking ABI ?
> 
> I mean, that Linux kernel stops working with existing DTBs... or am I
> mistaken and there is no problem? Maybe I confused the order...

It is not ABI break, it should work with existing DTBs

-- 
Best regards,
Kamil Konieczny
Samsung R&D Institute Poland
