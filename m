From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [patch 1/5] pinctrl: samsung: Remove bogus irq_[un]mask from
 resource management
Date: Fri, 30 Jun 2017 16:58:13 +0200
Message-ID: <20170630145813.r4h346yi6iricslm@kozik-lap>
References: <20170629213334.375848050@linutronix.de>
 <20170629214343.882576048@linutronix.de>
 <CACRpkdazKNDdcoJxvJ9injibZmOTsdmN-Y0sTS5eyanwz=iFEA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACRpkdazKNDdcoJxvJ9injibZmOTsdmN-Y0sTS5eyanwz=iFEA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>, Brian Norris <briannorris@chromium.org>, Heiko Stuebner <heiko@sntech.de>, "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, Julia Cartwright <julia@ni.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, John Keeping <john@metanate.com>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kukjin Kim <kgene@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Jun 30, 2017 at 03:53:18PM +0200, Linus Walleij wrote:
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
> Patch applied directly since it has no deps and fixes queued stuff for v4.13.
> I guess Krysztof will make sure it doesn't break anything.

Everything seems to work fine with the patchset.

Best regards,
Krzysztof

