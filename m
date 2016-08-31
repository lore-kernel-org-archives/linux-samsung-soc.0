From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/9] ARM: dts: exynos: Add macros for GPIO configuration
Date: Wed, 31 Aug 2016 14:58:41 +0200
Message-ID: <6113443.1q3Xq4YM82@wuerfel>
References: <1472645613-5362-1-git-send-email-k.kozlowski@samsung.com>
 <28320955.k33BrW2NEN@wuerfel>
 <07ddb8f8-a9e1-6105-ace9-edb5c8cc2f57@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <07ddb8f8-a9e1-6105-ace9-edb5c8cc2f57@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wednesday, August 31, 2016 2:53:02 PM CEST Krzysztof Kozlowski wrote:
> On 08/31/2016 02:42 PM, Arnd Bergmann wrote:
> > On Wednesday, August 31, 2016 2:13:25 PM CEST Krzysztof Kozlowski wrote:
> >>
> >> +#define PIN_PULL_NONE          0
> >> +#define PIN_PULL_DOWN          1
> >> +#define PIN_PULL_UP            3
> >> +
> >> +#define PIN_DRV_LV1            0
> >> +#define PIN_DRV_LV2            2
> >> +#define PIN_DRV_LV3            1
> >> +#define PIN_DRV_LV4            3
> >> +
> >> +#define PIN_FUNC_INPUT         0
> >> +#define PIN_FUNC_OUTPUT                1
> >> +#define PIN_FUNC_SPC_2         2
> >> +#define PIN_FUNC_SPC_3         3
> >> +#define PIN_FUNC_SPC_4         4
> >> +#define PIN_FUNC_SPC_5         5
> >> +#define PIN_FUNC_SPC_F         0xf
> > 
> > Any reason for having a copy in each of those files instead of one
> > that is shared across all of them?
> 
> The drive strengths differ between some of them. There are three groups
> of drive strengths:
> 1. Exynos3250, Exynos4 (all) and Exynos5250,
> 2. Exynos5260,
> 3. Exynos5410, 542x and 5800.

I see. That sounds like an even stronger reason to not duplicate
the definitions, as this is very confusing.

> Rest (functions and pull up/down) is the same so sharing the defines is
> possible but not that obvious. Solution would be for example adding a
> SoC-family prefix for PIN_DRV_LVx. Not that good...
> 
> I could put it into three DTSI:
>  - exynos3-pinctrl.dtsi (new file)
>  - exynos5260-pinctrl.dtsi (like it is now)
>  - exynos54xx-pinctrl.dtsi (new file)
> 
> which would reduce the duplication. Other ideas?

I think having the soc-family prefix is better, as it avoids
defining the same symbol to a different value. Better make this
as explicit as possible.

I think overall, a better solution would have been to define the
constants globally (shared with non-exynos) to start with,
and have the driver translate generic numbers into vendor
specific ones. Obviously it's too late for that now.

	Arnd
