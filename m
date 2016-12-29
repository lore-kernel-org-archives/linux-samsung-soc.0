From: Andi Shyti <andi@etezian.org>
Subject: Re: [PATCH 1/4] pinctrl: dt-bindings: samsung: add drive strength
 macros for Exynos5433
Date: Thu, 29 Dec 2016 22:41:04 +0900
Message-ID: <20161229134104.gq2spgtpwbkx7mpd@jack.zhora.eu>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084221epcas5p43926b87dccbee0db4045faa5ddca565d@epcas5p4.samsung.com>
 <20161229084211.20442-2-andi.shyti@samsung.com>
 <20161229115059.ncvtakz32vhcfsij@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20161229115059.ncvtakz32vhcfsij@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andi Shyti <andi.shyti@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

> >  #define EXYNOS5420_PIN_DRV_LV3		2
> >  #define EXYNOS5420_PIN_DRV_LV4		3
> >  
> > +/* Drive strengths for Exynos5433 */
> > +#define EXYNOS5433_PIN_DRV_LV1		0
> > +#define EXYNOS5433_PIN_DRV_LV2		1
> > +#define EXYNOS5433_PIN_DRV_LV3		2
> > +#define EXYNOS5433_PIN_DRV_LV4		3
> 
> Same values as existing. No need to re-define these.

Yes, I was in doubt when I prepared this patch as on one hand it
didn't look right to use EXYNOS5420_* for exynos5433, on the other
hand it didn't look right to duplicate the macros.

In anycase this values need to be fixed as Chanwoo wrote in the
other mail.

Thanks,
Andi
