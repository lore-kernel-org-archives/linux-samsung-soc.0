From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 4/7] pinctrl: samsung: Add GPFx support of Exynos5433
Date: Tue, 16 Aug 2016 15:42:38 +0900
Message-ID: <CA+Ln22ESSK2tK=jiRU94H=sFz23Eoh0Z96k3rBoaz9xnZS9iJg@mail.gmail.com>
References: <1471328843-26653-1-git-send-email-cw00.choi@samsung.com>
 <1471328843-26653-5-git-send-email-cw00.choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, chanwoo@kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Will Deacon <will.deacon@arm.com>, Andrzej Hajda <a.hajda@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Beomho Seo <beomho.seo@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Jonghwa Lee <jonghwa3.lee@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>, Kukjin Kim <kgene@kernel.org>, devicetree <devicetree@vger.kernel.org>, InKi Dae <inki.dae@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, ingi2.kim@samsung.comlinux-arm-kernel <li>
List-Id: linux-samsung-soc@vger.kernel.org

Hi,

2016-08-16 15:27 GMT+09:00 Chanwoo Choi <cw00.choi@samsung.com>:
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

I'm afraid I don't get anything from the description above. Could you
describe the layout of registers in memory map and IRQ routing of the
pins?

Best regards,
Tomasz
