From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Thu, 5 Jan 2017 18:59:52 +0200
Message-ID: <20170105165952.yj5m4cm7zejvnayx@kozik-lap>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
 <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
 <43019997-a6cf-30df-2437-306055ea6a78@linaro.org>
 <20170105134104.zzjdirdiuqj6efyy@gangnam.samsung>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170105134104.zzjdirdiuqj6efyy@gangnam.samsung>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Chanwoo Choi <cw00.choi@samsung.com>, krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 05, 2017 at 10:41:04PM +0900, Andi Shyti wrote:
> Hi Daniel,
> 
> > > +ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES
> > > +M:	Chanwoo Choi <cw00.choi@samsung.com>
> > > +R:	Andi Shyti <andi.shyti@samsung.com>
> > > +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> > > +S:	Supported
> > > +F:	arch/arm64/boot/dts/exynos/exynos5433*
> > > +
> > 
> > Does it make sense to add a MAINTAINER entry for some dts files ?
> 
> I think it does considering that exynos5433* files are more then
> the half of the arm64/.../exynos/ directory.
> 
> Besides Chanwoo has authored all of them (almost) and doesn't
> appear from the get_maintainers script.

He appears:
1. Kukjin Kim <kgene@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES)

2. Krzysztof Kozlowski <krzk@kernel.org> (maintainer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES,commit_signer:26/24=100%,authored:4/24=17%)

3. Javier Martinez Canillas <javier@osg.samsung.com> (reviewer:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES,commit_signer:6/24=25%)

4. Marek Szyprowski <m.szyprowski@samsung.com> (commit_signer:12/24=50%,authored:8/24=33%)

5. Chanwoo Choi <cw00.choi@samsung.com> (commit_signer:9/24=38%,authored:3/24=12%)

6. Sylwester Nawrocki <s.nawrocki@samsung.com> (commit_signer:9/24=38%)

(sorry if lines are wrapped)

Best regards,
Krzysztof
