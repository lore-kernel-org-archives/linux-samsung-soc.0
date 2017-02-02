From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/7] soc: smasung: pmu: Add register defines for pad
 retention control
Date: Thu, 2 Feb 2017 20:01:25 +0200
Message-ID: <20170202180125.vhastfic3shs3wdl@kozik-lap>
References: <1485779908-32147-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170130123837eucas1p1056a57f23b1e3bf089e5bc55bb2cf2d4@eucas1p1.samsung.com>
 <1485779908-32147-2-git-send-email-m.szyprowski@samsung.com>
 <20170130194329.duudcv5oxu2q2td4@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170130194329.duudcv5oxu2q2td4@kozik-lap>
Sender: linux-kernel-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jan 30, 2017 at 09:43:29PM +0200, Krzysztof Kozlowski wrote:
> On Mon, Jan 30, 2017 at 01:38:22PM +0100, Marek Szyprowski wrote:
> > Add PMU defines related to pad retention control. Will be later used
> > by the Exynos pin controller driver.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >  include/linux/soc/samsung/exynos-regs-pmu.h | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> 
> Thanks Marek.
>

I applied this one (with fix of typo) and I will provide a stable tag
with the header.

Best regards,
Krzysztof
