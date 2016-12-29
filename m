From: Andi Shyti <andi@smida.it>
Subject: Re: [PATCH 4/4] ARM64: dts: exynos5433: remove unused code
Date: Thu, 29 Dec 2016 22:41:46 +0900
Message-ID: <20161229134146.kolvpxrdo2epfav4@jack.zhora.eu>
References: <20161229084211.20442-1-andi.shyti@samsung.com>
 <CGME20161229084222epcas5p41dacaeed3e2d4f10b07eee3930f7531c@epcas5p4.samsung.com>
 <20161229084211.20442-5-andi.shyti@samsung.com>
 <20161229115421.pq52ab57e53xntoz@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20161229115421.pq52ab57e53xntoz@kozik-lap>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Andi Shyti <andi@etezian.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Tomasz Figa <tomasz.figa@gmail.com>, Andi Shyti <andi.shyti@samsung.com>, linux-kernel@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

> >  #include <dt-bindings/pinctrl/samsung.h>
> >  
> > -#define PIN_PULL_NONE		0
> > -#define PIN_PULL_DOWN		1
> > -#define PIN_PULL_UP		3
> > -
> > -#define PIN_DRV_LV1		0
> > -#define PIN_DRV_LV2		2
> > -#define PIN_DRV_LV3		1
> > -#define PIN_DRV_LV4		3
> > -
> > -#define PIN_IN			0
> > -#define PIN_OUT			1
> > -#define PIN_FUNC1		2
> > -
> 
> This should be squashed with 3/4 because logically it is strictly
> related to it and splitting it does not bring any benefits. Actually
> while looking at 3/4 I was surprised to see them not removed.

Yes, right :)

Thanks,
Andi
