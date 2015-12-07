From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/3] Device tree binding documentation for gpio-switch
Date: Mon, 7 Dec 2015 11:37:02 -0600
Message-ID: <20151207173702.GA17659@rob-hp-laptop>
References: <1449250275-23435-1-git-send-email-martyn.welch@collabora.co.uk>
 <1449250275-23435-2-git-send-email-martyn.welch@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1449250275-23435-2-git-send-email-martyn.welch@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Martyn Welch <martyn.welch@collabora.co.uk>, Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
List-Id: linux-samsung-soc@vger.kernel.org

+Linus W

On Fri, Dec 04, 2015 at 05:31:13PM +0000, Martyn Welch wrote:
> This patch adds documentation for the gpio-switch binding. This binding
> provides a mechanism to bind named links to gpio, with the primary
> purpose of enabling standardised access to switches that might be standard
> across a group of devices but implemented differently on each device.

This is good and what I suggested, but it now makes me wonder if switch 
is generic enough. This boils down to needing to expose single gpio 
lines to userspace with a defined function/use. IIRC, there's been some 
discussion about this before along with improving the userspace 
interface for GPIO in general. So I'd like to get Linus' thoughts on 
this.


> Signed-off-by: Martyn Welch <martyn.welch@collabora.co.uk>
> ---
>  .../devicetree/bindings/misc/gpio-switch.txt       | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/misc/gpio-switch.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/gpio-switch.txt b/Documentation/devicetree/bindings/misc/gpio-switch.txt
> new file mode 100644
> index 0000000..13528bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/gpio-switch.txt
> @@ -0,0 +1,47 @@
> +Device-Tree bindings for gpio attached switches.
> +
> +This provides a mechanism to provide a named link to specified gpios. This can
> +be useful in instances such as when theres a need to monitor a switch, which is
> +common across a family of devices, but attached to different gpios and even
> +implemented in different ways on differnet devices.
> +
> +Required properties:
> +	- compatible = "gpio-switch";
> +
> +Each signal is represented as a sub-node of "gpio-switch". The naming of
> +sub-nodes is arbitrary.
> +
> +Required sub-node properties:
> +
> +	- label: Name to be given to gpio switch.
> +	- gpios: OF device-tree gpio specification.
> +
> +Optional sub-node properties:
> +
> +	- read-only: Boolean flag to mark the gpio as read-only, i.e. the line
> +	  should not be driven by the host.

In terms a a switch use, allowing driving it would be an override of the 
switch. Is that the idea here?

> +
> +Example nodes:
> +
> +        gpio-switch {
> +                compatible = "gpio-switch";

Both from a binding and driver perspective, there is no point in 
grouping these. Each node can simply have this compatible string.

> +
> +                write-protect {
> +                        label = "write-protect";
> +                        gpios = <&gpx3 0 GPIO_ACTIVE_LOW>;
> +                        read-only;
> +                };
> +
> +                developer-switch {
> +                        label = "developer-switch";
> +                        gpios = <&gpx1 3 GPIO_ACTIVE_HIGH>;
> +                        read-only;
> +                };
> +
> +                recovery-switch {
> +                        label = "recovery-switch";
> +                        gpios = <&gpx0 7 GPIO_ACTIVE_LOW>;
> +                        read-only;
> +                };
> +        };
> +
> -- 
> 2.1.4
> 
