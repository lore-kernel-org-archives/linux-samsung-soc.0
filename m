From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 1/5] pinctrl: samsung: Add the support the multiple
 IORESOURCE_MEM for one pin-bank
Date: Tue, 8 Nov 2016 10:34:25 +0100
Message-ID: <CACRpkdZ3JmvbEkLK77V9x44WZ0tfmJWLv5CW7QkTM5-aw6M-4g@mail.gmail.com>
References: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com> <1478155149-28527-2-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478155149-28527-2-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, sw0312.kim@samsung.com, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Nov 3, 2016 at 7:39 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch supports the multiple IORESOURCE_MEM resources for one pin-bank.
> In the pre-existing Exynos series, the registers of the gpio bank are included
> in the one memory map. But, some gpio bank need to support the one more memory
> map (IORESOURCE_MEM) because the registers of gpio bank are separated into
> the different memory map.
>
> For example,
> The both ALIVE and IMEM domain have the different memory base address.
> The GFP[1-5] of exynos5433 are composed as following:
> - ALIVE domain : WEINT_* registers
> - IMEM domain  : CON/DAT/PUD/DRV/CONPDN/PUDPDN register
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Suggested-by: Tomasz Figa <tomasz.figa@gmail.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Patch applied with Krzysztof's review tag.

Yours,
Linus Walleij
