From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v7 1/7] ARM: common: vic: Parse interrupt and resume masks
 from device tree
Date: Thu, 22 Aug 2013 01:19:34 +0200
Message-ID: <CACRpkdboi3MUiUSDuhjwsjzVH3y9bYf9VpyfWK6PCkV-0fUZzw@mail.gmail.com>
References: <1377120111-25601-1-git-send-email-tomasz.figa@gmail.com>
	<1377120111-25601-2-git-send-email-tomasz.figa@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1377120111-25601-2-git-send-email-tomasz.figa@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thomas Gleixner <tglx@linutronix.de>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Mark Brown <broonie@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, Aug 21, 2013 at 11:21 PM, Tomasz Figa <tomasz.figa@gmail.com> wrote:

> +++ b/Documentation/devicetree/bindings/arm/vic.txt
> @@ -18,6 +18,9 @@ Required properties:
>  Optional properties:
>
>  - interrupts : Interrupt source for parent controllers if the VIC is nested.
> +- interrupt-mask : Bit mask of valid interrupt sources (defaults to all valid)
> +- wakeup-mask : Bit mask of interrupt sources that can wake up the system
> +  (defaults to all allowed)

The "interrupt-mask" is called "valid-mask" on the FPGA IRQ controller
See
Documentation/devicetree/bindings/arm/versatile-fpga-irq.txt

Example:

                reg = <0x10000040 0x100>;
                clear-mask = <0xffffffff>;
                valid-mask = <0x00000007>;

Please use the same name.

(wakeup-mask is fine).

Yours,
Linus Walleij
