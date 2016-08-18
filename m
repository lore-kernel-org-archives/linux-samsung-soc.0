From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 4/7] pinctrl: samsung: Add GPFx support of Exynos5433
Date: Thu, 18 Aug 2016 14:00:43 -0500
Message-ID: <20160818190043.GA11359@rob-hp-laptop>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471328843-26653-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <1471328843-26653-5-git-send-email-cw00.choi@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: mark.rutland@arm.com, k.kozlowski@samsung.com, chanwoo@kernel.org, catalin.marinas@arm.com, Linus Walleij <linus.walleij@linaro.org>, will.deacon@arm.com, Tomasz Figa <tomasz.figa@gmail.com>, a.hajda@samsung.com, s.nawrocki@samsung.com, beomho.seo@samsung.com, m.szyprowski@samsung.com, jonghwa3.lee@samsung.com, linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com, krzk@kernel.org, jh80.chung@samsung.com, kgene@kernel.org, devicetree@vger.kernel.org, inki.dae@samsung.com, linux-gpio@vger.kernel.org, ingi2.kim@samsung.com, linux-arm-kernel@lists.infradead.org, jaewon02.kim@samsung.com, sw0312.kim@samsung.com, linux-kernel@vger.kernel.org, human.hwang@samsung.com, ideal.song@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, Aug 16, 2016 at 03:27:20PM +0900, Chanwoo Choi wrote:
> From: Joonyoung Shim <jy0922.shim@samsung.com>
> 
> This patch add the support of GPFx pin of Exynos5433 SoC. Exynos5433 has
> different memory map of GPFx from previous Exynos SoC. Exynos GPIO has
> following register to control gpio funciton. Usually, all registers of GPIO
> are included in same domain.
> - CON / DAT / PUD / DRV / CONPDN / PUDPDN
> - EINT_CON/ EINT_FLTCON0, EINT_FLTCON1 / EINT_MASK / EINT_PEND
> 
> But, GPFx are included in two domain as following. So, this patch supports
> the GPFx pin which handle the on separate two domains.
> - ALIVE domain : CON / DAT / PUD / DRV / CONPDN / PUDPDN
> - IMEM domain  : EINT_CON/ EINT_FLTCON0, EINT_FLTCON1 / EINT_MASK / EINT_PEND
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> ---
>  .../bindings/pinctrl/samsung-pinctrl.txt           |  1 +

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/pinctrl/samsung/pinctrl-exynos.c           |  5 +++
>  drivers/pinctrl/samsung/pinctrl-exynos.h           | 11 ++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c          | 43 ++++++++++++++++++----
>  drivers/pinctrl/samsung/pinctrl-samsung.h          |  5 +++
>  5 files changed, 57 insertions(+), 8 deletions(-)
