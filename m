From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] pinctrl: samsung: Fix missing object for S5Pv210
Date: Wed, 7 Jun 2017 20:43:10 +0200
Message-ID: <20170607184310.g4a7da5ems375klu@kozik-lap>
References: <20170531174244.31861-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170531174244.31861-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 31, 2017 at 07:42:44PM +0200, Krzysztof Kozlowski wrote:
> While splitting Samsung pinctrl drivers per ARMv7 and ARMv8
> architectures, the necessary CONFIG_PINCTRL_EXYNOS_ARM is not selected
> when building for S5Pv210 family of SoCs thus pinctrl was missing there
> entirely.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Fixes: 16340fd6dbc1 ("pinctrl: samsung: Split Exynos drivers per ARMv7 and ARMv8")
> 
> Fixed commit is in my tree but already applied and sitting in next for
> some time. This should be squashed though.
> ---
>  drivers/pinctrl/samsung/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

Applied and squashed with 16340fd6dbc1.

Best regards,
Krzysztof
