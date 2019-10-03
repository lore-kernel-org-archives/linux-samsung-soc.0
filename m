From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [RESEND PATCH v5 3/4] ARM: dts: exynos: add initial data for
 coupled regulators for Exynos5422/5800
Date: Thu, 3 Oct 2019 12:04:20 +0200
Message-ID: <2fbc9880-3dfe-145c-e036-16276c314353@samsung.com>
References: <20190808090234.12577-1-k.konieczny@partner.samsung.com>
        <CGME20190808090252eucas1p2afec3e288965bb7e7aa6f96f67686273@eucas1p2.samsung.com>
        <20190808090234.12577-4-k.konieczny@partner.samsung.com>
        <20191002142704.GA15827@pi3>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191002142704.GA15827@pi3>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Kukjin Kim <kgene@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, Mark Rutland <mark.rutland@arm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <vireshk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 02.10.2019 16:27, Krzysztof Kozlowski wrote:
> On Thu, Aug 08, 2019 at 11:02:33AM +0200, Kamil Konieczny wrote:
>> From: Marek Szyprowski <m.szyprowski@samsung.com>
>>
>> Declare Exynos5422/5800 voltage ranges for opp points for big cpu core and
>> bus wcore and couple their voltage supllies as vdd_arm and vdd_int should
>> be in 300mV range.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> [k.konieczny: add missing patch description]
>> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> The bindings were acked. Can I pick it up?

All needed fixes have been merged to v5.4-rc1, so it is okay to merge 
this patch. However I've checked and it doesn't apply now, so I will 
send a rebased version.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
