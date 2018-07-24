From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [RFT v2 01/10] pinctrl: samsung: Define suspend and resume
 callbacks for all banks and SoCs
Date: Tue, 24 Jul 2018 21:41:09 +0200
Message-ID: <20180724194109.vbkahhcpi7avmj2m@kozik-lap>
References: <20180723175302.22535-1-krzk@kernel.org>
 <20180723175302.22535-2-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180723175302.22535-2-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jul 23, 2018 at 07:52:53PM +0200, Krzysztof Kozlowski wrote:
> Suspend and resume callbacks in Exynos/S5Pv210 pin controller drivers,
> save and restore state of registers.  This operations should be done for
> all banks which have external interrupts (as denoted by using
> EXYNOS_PIN_BANK_EINTG/EINTW macros).
> 
> Add all banks of Exynos5260 and Exynos5420.  This is necessary step for
> supporting suspend to RAM on these SoCs.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  drivers/pinctrl/samsung/pinctrl-exynos-arm.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Thanks, applied.

Best regards,
Krzysztof
