From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH RFC 4/8] soc: samsung: Add Exynos Adaptive Supply
 Voltage driver
Date: Wed, 24 Apr 2019 10:11:07 +0200
Message-ID: <1d2238be-1758-2413-42f1-d571706de766@samsung.com>
References: <CGME20190404172238epcas2p21ef28f46b728127dcd6e8ee72752a1b8@epcas2p2.samsung.com>
        <20190404171735.12815-1-s.nawrocki@samsung.com>
        <20190404171735.12815-5-s.nawrocki@samsung.com>
        <CAJKOXPc9v8bcQs9HmiDWECCkfQCh-Ktzk9Vqq01ccUm7UG54uQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPc9v8bcQs9HmiDWECCkfQCh-Ktzk9Vqq01ccUm7UG54uQ@mail.gmail.com>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 4/23/19 12:50, Krzysztof Kozlowski wrote:
>> +static int exynos5422_asv_get_table(void)
>> +{
>> +       unsigned int reg = exynos_chipid_read(EXYNOS_CHIPID_REG_PKG_ID);
>
> One more thought: you read this register multiple times in the same
> function. I think it is not needed - just read once, store the value
> and use the helpers to parse it.

Yes, I have noticed that as well. I'm not sure though if it is worth 
to additionally cache registers manually like this when we use the 
regmap.  I have already converted that code to use the regmap API for 
v2.  And these are barely few registers reads at the driver 
initialization time, not any hot path.

-- 
Thanks,
Sylwester
