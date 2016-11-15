From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v4 2/2] pinctrl: samsung: Add GPF support for Exynos5433
Date: Tue, 15 Nov 2016 09:43:09 +0100
Message-ID: <CACRpkdbnUrcJk+78TiNi0eHQeFt0oLn_m_74NJCW9o+6LQS=3Q@mail.gmail.com>
References: <1478680811-24835-1-git-send-email-cw00.choi@samsung.com> <1478680811-24835-3-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1478680811-24835-3-git-send-email-cw00.choi@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Joonyoung Shim <jy0922.shim@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Nov 9, 2016 at 9:40 AM, Chanwoo Choi <cw00.choi@samsung.com> wrote:

> This patch add the support of GPF[1-5] pin of Exynos5433 SoC. The GPFx need
> to support the multiple memory map because the registers of GPFx are located
> in the different domain.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>

Patch applied.

Yours,
Linus Walleij
