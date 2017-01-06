From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Fri, 6 Jan 2017 08:15:15 +0200
Message-ID: <20170106061515.or6utefsj252ndyc@kozik-lap>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
 <20170105134104.zzjdirdiuqj6efyy@gangnam.samsung>
 <20170105165952.yj5m4cm7zejvnayx@kozik-lap>
 <586F0D48.9050104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:35050 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750991AbdAFGYC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 01:24:02 -0500
Content-Disposition: inline
In-Reply-To: <586F0D48.9050104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti <andi.shyti@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, Jan 06, 2017 at 12:21:44PM +0900, Chanwoo Choi wrote:
> On 2017년 01월 06일 01:59, Krzysztof Kozlowski wrote:
> > On Thu, Jan 05, 2017 at 10:41:04PM +0900, Andi Shyti wrote:
> >> Hi Daniel,
> >>
> >>>> +ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES
> >>>> +M:	Chanwoo Choi <cw00.choi@samsung.com>
> >>>> +R:	Andi Shyti <andi.shyti@samsung.com>
> >>>> +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> >>>> +S:	Supported
> >>>> +F:	arch/arm64/boot/dts/exynos/exynos5433*
> >>>> +
> >>>
> >>> Does it make sense to add a MAINTAINER entry for some dts files ?
> >>
> >> I think it does considering that exynos5433* files are more then
> >> the half of the arm64/.../exynos/ directory.
> >>
> >> Besides Chanwoo has authored all of them (almost) and doesn't
> >> appear from the get_maintainers script.
> > 
> > He appears:
> > 1. Kukjin Kim <kgene@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
> > 
> > 2. Krzysztof Kozlowski <krzk@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES,commit_signer:26/24=100%,authored:4/24=17%)
> > 
> > 3. Javier Martinez Canillas <javier@osg.samsung.com> (reviewer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES,commit_signer:6/24=25%)
> > 
> > 4. Marek Szyprowski <m.szyprowski@samsung.com> (commit_signer:12/24=50%,authored:8/24=33%)
> > 
> > 5. Chanwoo Choi <cw00.choi@samsung.com> (commit_signer:9/24=38%,authored:3/24=12%)
> > 
> > 6. Sylwester Nawrocki <s.nawrocki@samsung.com> (commit_signer:9/24=38%)
> > 
> > (sorry if lines are wrapped)
> 
> I have a question.
> 
> When I tested the get_maintainer script with Exynos5444 patch,
> I cannot get the same result from you.

The behavior of get_maintainers.pl changed few months ago and now it
prints recent GIT activity only when there are no maintainers. To me
personally, this is desired because otherwise a lot of people will be
spammed on every patch. If someone wants to notify not only maintainers
but also other people then he should use --git (which was used for
output above).

Best regards,
Krzysztof

> 
> I tested the following patch[1] which was already merged by Marek.
> [1] commit-id: 74c78036d5b5970266fa2075a17c9b89cabf873e
> - ("arm64: dts: exynos: TM2 - add support for MFC video codec device"
> 
> ./scripts/get_maintainer.pl 0001-arm64-dts-exynos-TM2-add-support-for-MFC-video-codec.patch 
> Rob Herring <robh+dt@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Mark Rutland <mark.rutland@arm.com> (maintainer:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> Catalin Marinas <catalin.marinas@arm.com> (maintainer:ARM64 PORT (AARCH64 ARCHITECTURE))
> Will Deacon <will.deacon@arm.com> (maintainer:ARM64 PORT (AARCH64 ARCHITECTURE))
> Kukjin Kim <kgene@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
> Krzysztof Kozlowski <krzk@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
> Javier Martinez Canillas <javier@osg.samsung.com> (reviewer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
> devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS)
> linux-arm-kernel@lists.infradead.org (moderated list:ARM64 PORT (AARCH64 ARCHITECTURE))
> linux-samsung-soc@vger.kernel.org (moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)
> linux-kernel@vger.kernel.org (open list)
> 
> Also, when I tested the exynos5433-tm2e.dts patch, I got the same result.
> 
> > 
> > Best regards,
> > Krzysztof
> > 
> > 
> > 
> 
> 
> -- 
> Best Regards,
> Chanwoo Choi
> Samsung Electronics

> null
