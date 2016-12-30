From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/4] ARM64: dts: exynos5433: use macros for pinctrl
 configuration on Exynos5433
Date: Fri, 30 Dec 2016 17:17:24 +0200
Message-ID: <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
References: <CGME20161230041427epcas1p1151d6e28fac143c63efaf4f7c8ed432d@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-4-andi.shyti@samsung.com>
 <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:33463 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753984AbcL3PRc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Dec 2016 10:17:32 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andi Shyti <andi.shyti@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>

On Fri, Dec 30, 2016 at 02:32:39PM +0100, Linus Walleij wrote:
> On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti@samsung.com> wrote:
> 
> > Use the macros defined in include/dt-bindings/pinctrl/samsung.h
> > instead of hardcoded values.
> >
> > Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
> 
> These look fine, but that this and the other DTS patch through ARM SoC.
> 
> If you also need the headerfile patch (patch 2) to go through ARM SoC
> that is fine,
> I can take it out of pinctrl if you want.

Yes, I need the header. It would be much appreciated if you could
provide a tag or stable branch with it.

BTW, Andi, please follow the subject prefix convention (git log
--oneline arch/arm64/boot/dts/exynos).

Best regards,
Krzysztof
