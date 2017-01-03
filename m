From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 3/4] ARM64: dts: exynos5433: use macros for pinctrl
 configuration on Exynos5433
Date: Tue, 3 Jan 2017 09:24:34 +0100
Message-ID: <CACRpkdbX_MuLSCerq08-1VZV6VJfynjkv1QOr7ssOCGvM5aB_Q@mail.gmail.com>
References: <CGME20161230041427epcas1p1151d6e28fac143c63efaf4f7c8ed432d@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com> <20161230041421.24448-4-andi.shyti@samsung.com>
 <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com> <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
Sender: stable-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 30, 2016 at 4:17 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On Fri, Dec 30, 2016 at 02:32:39PM +0100, Linus Walleij wrote:
>> On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti@samsung.com> wrote:
>>
>> > Use the macros defined in include/dt-bindings/pinctrl/samsung.h
>> > instead of hardcoded values.
>> >
>> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
>>
>> These look fine, but that this and the other DTS patch through ARM SoC.
>>
>> If you also need the headerfile patch (patch 2) to go through ARM SoC
>> that is fine,
>> I can take it out of pinctrl if you want.
>
> Yes, I need the header. It would be much appreciated if you could
> provide a tag or stable branch with it.

Nah better just merge that patch into the ARM SoC tree only.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

I'll remove it from the pinctrl tree.

Yours,
Linus Walleij
