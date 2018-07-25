From: Rob Herring <robh@kernel.org>
Subject: Re: [RFT v2 03/10] pinctrl: samsung: Document hidden requirement
 about one external wakeup
Date: Wed, 25 Jul 2018 11:38:23 -0600
Message-ID: <20180725173823.GA25530@rob-hp-laptop>
References: <20180723175302.22535-1-krzk@kernel.org>
 <20180723175302.22535-4-krzk@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20180723175302.22535-4-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@armlinux.org.uk>, Kyungmin Park <kyungmin.park@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, =?utf-8?B?UGF3ZcWC?= Chmiel <pawel.mikolaj.chmiel@gmail.com>, Sylwester Nawrocki <snawrocki@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Pankaj Dubey <pankaj.dubey@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Mon, Jul 23, 2018 at 07:52:55PM +0200, Krzysztof Kozlowski wrote:
> Hardware (S5Pv210 and all Exynos SoCs) provides only 32 external
> interrupts which can wakeup device from deep sleep modes.  On S5Pv210
> these are gph0-gph3.  On all Exynos designs these are gpx0-gpx3.
> There is only one 32-bit register for controlling the external wakeup
> interrupt mask (masking and unmasking waking capability of these
> interrupts).
> 
> This lead to implementation in pinctrl driver and machine code which was
> using static memory for storing the mask value and not caring about
> multiple devices of pin controller... because only one pin controller
> device will be handling this.
> 
> Since each pin controller node in Device Tree maps onto one device, this
> corresponds to hidden assumption in parsing the Device Tree: external
> wakeup interrupts can be defined only once.  Make this assumption an
> explicit requirement.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Tomasz Figa <tomasz.figa@gmail.com>
> Cc: Sylwester Nawrocki <snawrocki@kernel.org>
> Acked-by: Tomasz Figa <tomasz.figa@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
