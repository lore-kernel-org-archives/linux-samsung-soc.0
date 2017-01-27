From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 3/8] pinctrl: samsung: Add support for pad retention
 control for Exynos5433 SoCs
Date: Fri, 27 Jan 2017 20:02:03 +0200
Message-ID: <20170127180203.eacwbyb2noqjpmgw@kozik-lap>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083402eucas1p187d3d31f62544fc46fae99fc5f74dbfe@eucas1p1.samsung.com>
 <1485419634-28331-4-git-send-email-m.szyprowski@samsung.com>
 <20170126194811.rori5j5hmclniqig@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170126194811.rori5j5hmclniqig@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 09:48:11PM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jan 26, 2017 at 09:33:49AM +0100, Marek Szyprowski wrote:
> > This patch adds support for retention control for Exynos5433 SoCs. Three
> > groups of pins has been defined for retention control: common shared group
> > for ALIVE, CPIF, eSE, FINGER, IMEM, NFC, PERIC, TOUCH pin banks and
> > separate control for FSYS and AUD pin banks, for which PMU retention
> > registers match whole banks.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  drivers/pinctrl/samsung/pinctrl-exynos.c    | 58 +++++++++++++++++++++++++++++
> >  include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++

I already have some non-conflicting changes to exynos-regs-pmu.h in my
branch. Now I want to add some more which will create conflicts.

How about splitting the header to separate patch, so I will take it to
my exynos-pmu branch?

Best regards,
Krzysztof
