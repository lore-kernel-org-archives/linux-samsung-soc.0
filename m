From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch 1/5] pinctrl: samsung: Remove bogus irq_[un]mask from
 resource management
Date: Fri, 30 Jun 2017 14:17:23 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1706301417080.1748@nanos>
References: <20170629213334.375848050@linutronix.de> <20170629214343.882576048@linutronix.de> <CACRpkdYO2bRT8104AbT_w9-=eXDNAr=csYUtmkYKE7bM+BsV9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYO2bRT8104AbT_w9-=eXDNAr=csYUtmkYKE7bM+BsV9A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 30 Jun 2017, Linus Walleij wrote:
> On Thu, Jun 29, 2017 at 11:33 PM, Thomas Gleixner <tglx@linutronix.de> wrote:
> 
> > The irq chip callbacks irq_request/release_resources() have absolutely no
> > business with masking and unmasking the irq.
> >
> > The core code unmasks the interrupt after complete setup and masks it
> > before invoking irq_release_resources().
> >
> > The unmask is actually harmful as it happens before the interrupt is
> > completely initialized in __setup_irq().
> >
> > Remove it.
> >
> > Fixes: f6a8249f9e55 ("pinctrl: exynos: Lock GPIOs as interrupts when used as EINTs")
> > Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Tomasz Figa <tomasz.figa@gmail.com>
> > Cc: Krzysztof Kozlowski <krzk@kernel.org>
> > Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Kukjin Kim <kgene@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-samsung-soc@vger.kernel.org
> > Cc: linux-gpio@vger.kernel.org
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> Does this patch have a dependency on the rest of the series or should
> I just apply it as-is?

Has no dependecies at all.
