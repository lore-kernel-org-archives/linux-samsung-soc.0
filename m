From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/4] pinctrl: samsung: Fix the width of PINCFG_TYPE_DRV
 bitfields for Exynos5433
Date: Fri, 30 Dec 2016 14:28:52 +0100
Message-ID: <CACRpkdbR3x14h38Gg7qpeWnswwD9qsS0zDUrrXCEJH-AdEB+cQ@mail.gmail.com>
References: <CGME20161230041426epcas1p1f827d3cee8b607d81e9921b412ddf301@epcas1p1.samsung.com>
 <20161230041421.24448-1-andi.shyti@samsung.com> <20161230041421.24448-2-andi.shyti@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20161230041421.24448-2-andi.shyti@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andi Shyti <andi.shyti@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Andi Shyti <andi@etezian.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 30, 2016 at 5:14 AM, Andi Shyti <andi.shyti@samsung.com> wrote:

> From: Chanwoo Choi <cw00.choi@samsung.com>
>
> This patch fixes the wrong width of PINCFG_TYPE_DRV bitfields for Exynos5433
> because PINCFG_TYPE_DRV of Exynos5433 has 4bit fields in the *_DRV
> registers. Usually, other Exynos have 2bit field for PINCFG_TYPE_DRV.
>
> Fixes: 3c5ecc9ed353 ("pinctrl: exynos: Add support for Exynos5433")
> Cc: stable@vger.kernel.org
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Nominally I think you should sign this off too Andi, as you are in the delivery
path.

Patch applied for fixes.

Yours,
Linus Walleij
