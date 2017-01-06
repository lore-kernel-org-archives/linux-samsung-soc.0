From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/4] ARM64: dts: exynos5433: use macros for pinctrl
 configuration on Exynos5433
Date: Fri, 6 Jan 2017 08:18:05 +0200
Message-ID: <20170106061805.6g57e6iulrclwieb@kozik-lap>
References: <CGME20161230041427epcas1p1151d6e28fac143c63efaf4f7c8ed432d@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com>
 <20161230041421.24448-4-andi.shyti@samsung.com>
 <CACRpkdaz9AyFJs1Th_SVexqKaP-=iPF0G-1YXOCoSmrQH8ZHDA@mail.gmail.com>
 <20161230151724.5wlp4hbphasmw3rg@kozik-lap>
 <CACRpkdbX_MuLSCerq08-1VZV6VJfynjkv1QOr7ssOCGvM5aB_Q@mail.gmail.com>
 <20170105200807.54j2ebve6kqd5bob@kozik-lap>
 <20170106022343.5w4d7pkydrfh2n75@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33743 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdAFGSS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 01:18:18 -0500
Content-Disposition: inline
In-Reply-To: <20170106022343.5w4d7pkydrfh2n75@gangnam.samsung>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>

On Fri, Jan 06, 2017 at 11:23:43AM +0900, Andi Shyti wrote:
> Hi Krzysztof,
> 
> > Andi,
> > Please fix missing Signed-off-by and resend with Linus' tags for #1 and
> > #2 and with other accumulated tags.
> 
> patch #1 has already been merged in mainline:
> 
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=1259feddd0f83649d5c48d730c140b4f7f3fa288
> 
> and patch #2 is in LinusW's -next branch.

Yes, but it is gone from devel so I suppose it will be removed from
for-next in the future as well.

> does it still make sense to send them again? If you want I can
> send again patch 3 and 4 as independent patches with Chanwoo's
> review (the only tags).

No, no need. I wanted resend only because of #1 but it is merged as you
said.

Best regards,
Krzysztof
