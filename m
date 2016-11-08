From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 2/5] pinctrl: samsung: Add GPF support for Exynos5433
Date: Tue, 8 Nov 2016 10:36:04 +0100
Message-ID: <CACRpkdaBWBy__DhpUW0vKy90YWR8rHFjVkPDAC8rL05ZMnn6OQ@mail.gmail.com>
References: <1478155149-28527-1-git-send-email-cw00.choi@samsung.com> <1478155149-28527-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478155149-28527-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, sw0312.kim@samsung.com, Joonyoung Shim <jy0922.shim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, beomho.seo@samsung.com, jaewon02.kim@samsung.com, human.hwang@
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Nov 3, 2016 at 7:39 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch add the support of GPF[1-5] pin of Exynos5433 SoC. The GPFx need
> to support the multiple memory map because the registers of GPFx are located
> in the different domain.
>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Patch applied.

Yours,
Linus Walleij
