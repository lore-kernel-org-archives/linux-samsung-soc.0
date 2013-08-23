From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v8 1/7] irqchip: vic: Parse interrupt and resume masks
 from device tree
Date: Fri, 23 Aug 2013 16:11:18 -0600
Message-ID: <5217DE06.3070005@wwwdotorg.org>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com> <1377120111-25601-2-git-send-email-tomasz.figa@gmail.com> <1500724.07LRpFtgcx@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1500724.07LRpFtgcx@flatron>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-gpio@vger.kernel.org, Ian Campbell <ian.campbell@citrix.com>, Linus Walleij <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On 08/22/2013 05:22 PM, Tomasz Figa wrote:
> This patch extends vic_of_init to parse valid interrupt sources
> and resume sources masks from device tree.
> 
> If mask values are not specified in device tree, all sources
> are assumed to be valid, as before this patch.

Can you explain further why the VIC needs this information up-front?
Presumably it can accumulate it as devices request interrupts.

> diff --git a/Documentation/devicetree/bindings/arm/vic.txt b/Documentation/devicetree/bindings/arm/vic.txt

> +- valid-mask : Bit mask of valid interrupt sources (defaults to all valid)

Until a device requests an interrupt, it can be left disabled. Once
something does request it, it gets enabled. If nothing requests it, it
never gets enabled. Doesn't the result of that logic end up being the
same thing as valid-mask represents? The only difference would be if
some device requests an invalid interrupt source, but then why not just
fix the interrupt client instead of adding this property to reject the
request?

> +- wakeup-mask : Bit mask of interrupt sources that can wake up the system
> +  (defaults to all allowed)

Shouldn't drivers for end-devices request interrupts, and then set wake
enable on those interrupts, which would then trickle up the IRQ chain to
tell the VIC which interrupts to enable wakeup on?
