From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 5/6] ARM: dts: s3c2416: Use macros for pinctrl
 configuration
Date: Thu, 01 Sep 2016 13:17:13 +0200
Message-ID: <5137342.oSWmFr9Y8D@wuerfel>
References: <1472721715-2833-1-git-send-email-k.kozlowski@samsung.com>
 <1608454.1ZuTJsprje@amdc1976>
 <e37fbfa0-f30c-ab34-3428-fb9a66182089@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <e37fbfa0-f30c-ab34-3428-fb9a66182089@samsung.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, javier@osg.samsung.com, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thursday, September 1, 2016 1:12:18 PM CEST Krzysztof Kozlowski wrote:
> > 
> > Shouldn't macros that are also used by s3c* be named as
> > SAMSUNG_PIN_FUNC_2 etc. (s3c* SoCs are not Exynos)?
> 
> Right, this is the inconsistency. The problem with "samsung" prefix is
> that there is no guarantee it will be like that for newer SoCs. How
> about one of:
> 1. using the oldest prefix (S3C24XX in this case),
> 2. duplicating them per SoC family (so S3C24XX, S3C64XX, EXYNOS).
> ?

I'd suggest living with the inconsistency and using EXYNOS as the prefix,
as that is the most common one these days, even if the other ones
predate it.

	Arnd
