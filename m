From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 6/8] mfd: exynos-lpass: Add support for clocks
Date: Wed, 1 Feb 2017 07:24:56 -0600
Message-ID: <20170201132456.3dcprep7hwbii46n@rob-hp-laptop>
References: <1485419634-28331-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20170126083404eucas1p132ce7a0792505367f6a001f21e9d1632@eucas1p1.samsung.com>
 <1485419634-28331-7-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1485419634-28331-7-git-send-email-m.szyprowski@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Lee Jones <lee.jones@linaro.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, Jan 26, 2017 at 09:33:52AM +0100, Marek Szyprowski wrote:
> Exynos LPASS requires some clocks to be enabled to make any access to its
> registers. This patch adds code for handling such clocks. For current set
> of registers it is enough to keep sfr0_ctrl clock enabled. Till now it
> worked only because those clocks were enabled by bootloader and driver
> probe() happened before they were disabled by clock core because of lack
> of users. Handling those clocks is also needed to make it possible to
> enable support for audio power domain.
> 
> This patch requires adding sfr0_ctrl clock to device tree.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/mfd/samsung,exynos5433-lpass.txt       |  6 ++++++

Acked-by: Rob Herring <robh@kernel.org>

>  drivers/mfd/exynos-lpass.c                                     | 10 ++++++++++
>  2 files changed, 16 insertions(+)
