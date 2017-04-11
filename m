From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [GIT PULL] mfd: exynos-lpass: Pinctrl dependency
Date: Tue, 11 Apr 2017 12:59:07 +0100
Message-ID: <20170411115907.bpyvkd54olzed3tx@dell>
References: <1490256207-10061-1-git-send-email-m.szyprowski@samsung.com>
 <20170328154217.5405-1-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170328154217.5405-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On Tue, 28 Mar 2017, Krzysztof Kozlowski wrote:

> 
> Hi Lee,
> 
> 
> This is dependency for mfd/exynos-lpass driver changes from Marek Szyprowski.
> That's a material for v4.12 and I will be pushing this later to Linus Walleij.
> 
> 
> Best regards,
> Krzysztof
> 
> 
> 
> The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:
> 
>   Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-retention-4.12
> 
> for you to fetch changes up to e1d7eb0c8fc9c33ef60ac31172fb0fbb78c24271:
> 
>   pinctrl: samsung: Add support for pad retention control for Exynos5433 SoCs (2017-03-23 21:07:02 +0200)
> 
> ----------------------------------------------------------------
> Add retention control to Exynos5433 pinctrl driver, necessary for proper
> handling of runtime Power Management of Exynos Audio SubSystem and effectively
> allowing to power down the domain.
> 
> ----------------------------------------------------------------
> Marek Szyprowski (2):
>       pinctrl: samsung: Ensure that pad retention is disabled on driver init
>       pinctrl: samsung: Add support for pad retention control for Exynos5433 SoCs
> 
>  drivers/pinctrl/samsung/pinctrl-exynos.c | 63 ++++++++++++++++++++++++++++++++
>  1 file changed, 63 insertions(+)

Pulled into MFD -next.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
