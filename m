From: Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v7 1/4] Documentation: dt-bindings: Describe SROMc configuration
Date: Tue, 10 Nov 2015 08:24:05 -0600
Message-ID: <CAL_JsqLsD9gA2-AWYGaHvOuZhhDmE2BHmPMU2nJjPYEvQJdNHQ@mail.gmail.com>
References: <cover.1446799912.git.p.fedin@samsung.com> <0bc58ce0fd39767834f486c4c0cfbbd70044caed.1446799912.git.p.fedin@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:37294 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752323AbbKJOY2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Nov 2015 09:24:28 -0500
In-Reply-To: <0bc58ce0fd39767834f486c4c0cfbbd70044caed.1446799912.git.p.fedin@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pavel Fedin <p.fedin@samsung.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

On Fri, Nov 6, 2015 at 4:03 AM, Pavel Fedin <p.fedin@samsung.com> wrote:
> Add documentation for new subnode properties, allowing bank configuration.
> Based on u-boot implementation, but heavily reworked.
>
> Also, fix size of SROMc mapping in the example.
>
> Signed-off-by: Pavel Fedin <p.fedin@samsung.com>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  .../bindings/arm/samsung/exynos-srom.txt           | 71 +++++++++++++++++++++-
>  1 file changed, 69 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> index 33886d5..3ff2950 100644
> --- a/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> +++ b/Documentation/devicetree/bindings/arm/samsung/exynos-srom.txt
> @@ -5,8 +5,75 @@ Required properties:
>
>  - reg: offset and length of the register set
>
> -Example:
> +Optional properties:
> +The SROM controller can be used to attach external peripherals. In this case
> +extra properties, describing the bus behind it, should be specified as below:
> +
> +- #address-cells: Must be set to 2 to allow memory address translation

2 is for CS# and offset.

> +
> +- #size-cells: Must be set to 1 to allow CS address passing

size is the size, not the address.

> +
> +- ranges: Must be set up to reflect the memory layout with four integer values
> +         per bank:
> +               <bank-number> 0 <physical address of bank> <size>

s/physical/parent/

You could have another level of translation above for the parent.

> +
> +Sub-nodes:
> +The actual device nodes should be added as subnodes to the SROMc node. These
> +subnodes, except regular device specification, should contain the following
> +properties, describing configuration of the relevant SROM bank:
> +
> +Required properties:
> +- reg: bank number, base address (relative to start of the bank) and size of
> +       the memory mapped for the device. Note that base address will be
> +       typically 0 as this is the start of the bank.
> +
> +- samsung,srom-timing : array of 6 integers, specifying bank timings in the
> +                        following order: Tacp, Tcah, Tcoh, Tacc, Tcos, Tacs.
> +                        Each value is specified in cycles and has the following
> +                        meaning and valid range:
> +                        Tacp : Page mode access cycle at Page mode (0 - 15)
> +                        Tcah : Address holding time after CSn (0 - 15)
> +                        Tcoh : Chip selection hold on OEn (0 - 15)
> +                        Tacc : Access cycle (0 - 31, the actual time is N + 1)
> +                        Tcos : Chip selection set-up before OEn (0 - 15)
> +                        Tacs : Address set-up before CSn (0 - 15)

This is not easily extended. Perhaps a property per value instead.

> +
> +Optional properties:
> +- reg-io-width : data width in bytes (1 or 2). If omitted, default of 1 is used.
> +
> +- samsung,srom-page-mode : page mode configuration for the bank:
> +                          0 - normal (one data)
> +                          1 - four data
> +                          If omitted, default of 0 is used.
> +
> +Example: basic definition, no banks are configured
> +       sromc@12570000 {
> +               compatible = "samsung,exynos-srom";
> +               reg = <0x12570000 0x14>;
> +       };
> +
> +Example: SROMc with SMSC911x ethernet chip on bank 3
>         sromc@12570000 {
> +               #address-cells = <2>;
> +               #size-cells = <1>;
> +               ranges = <0 0 0x04000000 0x20000   // Bank0
> +                         1 0 0x05000000 0x20000   // Bank1
> +                         2 0 0x06000000 0x20000   // Bank2
> +                         3 0 0x07000000 0x20000>; // Bank3
> +
>                 compatible = "samsung,exynos-srom";
> -               reg = <0x12570000 0x10>;
> +               reg = <0x12570000 0x14>;
> +
> +               ethernet@3 {
> +                       compatible = "smsc,lan9115";
> +                       reg = <3 0 0x10000>;       // Bank 3, offset = 0
> +                       phy-mode = "mii";
> +                       interrupt-parent = <&gpx0>;
> +                       interrupts = <5 8>;
> +                       reg-io-width = <2>;
> +                       smsc,irq-push-pull;
> +                       smsc,force-internal-phy;
> +
> +                       samsung,srom-config = <1 9 12 1 9 1 1>;

This doesn't match the doc.

> +               };
>         };
> --
> 2.4.4
>
