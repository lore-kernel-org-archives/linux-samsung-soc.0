From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v2 3/4] ARM: dts: exynos: add initial data for coupled
 regulators for Exynos5422/5800
Date: Tue, 16 Jul 2019 12:30:50 +0200
Message-ID: <0d31e847-b490-2c0f-abf8-db37b881cb6d@samsung.com>
References: <CGME20190715120432eucas1p1b32d72d239420b861bf8596d4e8a053d@eucas1p1.samsung.com>
        <20190715120416.3561-1-k.konieczny@partner.samsung.com>
        <20190715120416.3561-4-k.konieczny@partner.samsung.com>
        <CAJKOXPd6a5aLf1CEhx9m7khPQOwruSuA22efkJb41BsaWXjM3A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPd6a5aLf1CEhx9m7khPQOwruSuA22efkJb41BsaWXjM3A@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


On 7/16/19 11:22 AM, Krzysztof Kozlowski wrote:
> On Mon, 15 Jul 2019 at 14:04, Kamil Konieczny
> <k.konieczny@partner.samsung.com> wrote:
>>
>> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
>> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
>> be in 300mV range.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> 
> This one was previously from Marek, now it is from you. Any changes here?

Hmmm, it seems that "From:" tag somehow got lost in v2 compared to v1?

Also the note about adding patch description (which was the only update to
original Marek's patch IIRC) should be added, something like:

...
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
[k.konieczny: add missing patch description]
Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
