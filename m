From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Fri, 11 Dec 2015 13:39:32 +0100
Message-ID: <CACRpkdYZ-PK9Fb2uq+EMz5RTrtX-isxYkiNvWm2QqAh5WZhpOw@mail.gmail.com>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
 <1449250275-23435-2-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1449250275-23435-2-git-send-email-martyn.welch@collabora.co.uk>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Rob Herring <robh+dt@kernel.org>, Kukjin Kim <kgene@kernel.org>, Kumar Gala <galak@codeaurora.org>, Olof Johansson <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, Dec 4, 2015 at 6:31 PM, Martyn Welch
<martyn.welch@collabora.co.uk> wrote:

> This patch adds documentation for the gpio-switch binding. This binding
> provides a mechanism to bind named links to gpio, with the primary
> purpose of enabling standardised access to switches that might be standard
> across a group of devices but implemented differently on each device.
>
> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>

As mentioned in the comment to the second patch, this solves the
following generic problem:

Expose a GPIO line to userspace using a specific name

That means basically naming GPIO lines and marking them as
"not used by the operating system".

This is something that has been proposed before, and postponed
because the kernel lacks the right infrastructure.

Markus Pargmann also did a series that add initial values to
hogs, which is the inverse usecase of this, where you want to
*output* something by default, then maybe also make it available
to userspace.

So what we need to see here is a patch series that does all of these
things:

- Name lines

- Sets them to initial values

- Mark them as read-only

- Mark them as "not used by the operating system" so that they
  can be default-exported to userspace.

Making *USE* of this naming etc inside the Linux kernel

> +        gpio-switch {
> +                compatible = "gpio-switch";
> +
> +                write-protect {
> +                        label = "write-protect";
> +                        gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
> +                        read-only;
> +                };

This should not need new structures and nodes like this. It should
be part of Documentation/devicetree/bindings/gpio/gpio.txt
and put directly in the gpiochip node.

Maybe as an extension of the existing hogs, but that has already
been tried.

While we can agree on a device tree binding, the kernel still needs
major refactoring to actually expose named GPIOs to userspace,
and that should be done using the new chardev, not with sysfs
links.

Yours,
Linus Walleij
