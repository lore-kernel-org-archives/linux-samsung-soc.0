From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH RFC 4/8] soc: samsung: Add Exynos Adaptive Supply Voltage driver
Date: Wed, 24 Apr 2019 10:20:29 +0200
Message-ID: <CAJKOXPccFqZv6nopRThi1+G1-5LWtFQu53rDXcsO2QXu2DWtwA@mail.gmail.com>
References: <CGME20190404172238epcas2p21ef28f46b728127dcd6e8ee72752a1b8@epcas2p2.samsung.com>
 <20190404171735.12815-1-s.nawrocki@samsung.com> <20190404171735.12815-5-s.nawrocki@samsung.com>
 <CAJKOXPc9v8bcQs9HmiDWECCkfQCh-Ktzk9Vqq01ccUm7UG54uQ@mail.gmail.com> <1d2238be-1758-2413-42f1-d571706de766@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1d2238be-1758-2413-42f1-d571706de766@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, Chanwoo Choi <cw00.choi@samsung.com>, myungjoo.ham@samsung.com, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?= <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, 24 Apr 2019 at 10:10, Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> On 4/23/19 12:50, Krzysztof Kozlowski wrote:
> >> +static int exynos5422_asv_get_table(void)
> >> +{
> >> +       unsigned int reg = exynos_chipid_read(EXYNOS_CHIPID_REG_PKG_ID);
> >
> > One more thought: you read this register multiple times in the same
> > function. I think it is not needed - just read once, store the value
> > and use the helpers to parse it.
>
> Yes, I have noticed that as well. I'm not sure though if it is worth
> to additionally cache registers manually like this when we use the
> regmap.  I have already converted that code to use the regmap API for
> v2.  And these are barely few registers reads at the driver
> initialization time, not any hot path.

By default regmap does not use caching so there is no benefit out of
it. In the same time reading with regmap involves its layer of
abstraction with locks, indirect calls etc... I agree that there is no
point for implementing specific "caching" but with the same code
readability/simplicity you can have it without multiple regmap
accesses one after another. Consider this:
    unsigned int pkgid = exynos_chipid_read(EXYNOS_CHIPID_REG_PKG_ID);
    asv->table = exynos5422_asv_get_table(pkgid);
    asv->is_bin2 = exynos5422_asv_check_bin2(pkgid);
(and probably renaming the helpers)
The code is equivalent. The same readability.

Best regards,
Krzysztof
