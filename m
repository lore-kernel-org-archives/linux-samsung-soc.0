From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH V2 1/2] arm: dts: exynos: Add GPU/Mali T604 node to
 exynos5250
Date: Thu, 25 Jul 2019 13:19:12 +0200
Message-ID: <CAJKOXPejSxxH5DJPyEHTt=VEOdVgiXOm1c3MKKir-qRxtDcLLA@mail.gmail.com>
References: <20190724072008.6272-1-guillaume.gardet@free.fr>
 <20190725083433.6505-1-guillaume.gardet@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190725083433.6505-1-guillaume.gardet@arm.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Guillaume <guillaume.gardet@arm.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

On Thu, 25 Jul 2019 at 10:34, Guillaume <guillaume.gardet@arm.com> wrote:
>
> From: Guillaume GARDET <guillaume.gardet@arm.com>
>
> Add nodes for GPU (Mali T604) to Exynos5250.
> Tested with kmscube and glmark2-es2-drm on Chromebook snow.
> Load tested on arndale board.
>
> Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>
>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> ---
> V2 changes:
>   * move mali node as /soc sub-node
>   * move gpu_opp_table as mali sub-node
>   * minor style updates
>   * test on arndale board
>   * enable by default

I was not specific enough. It can stay disabled in the DTSI because
not all resources are provided. The board DTSes (all or ones which are
tested) will enable it and provide missing resources - mali-supply.
Just like:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f0a6208b90bdd44f48f5718c8bb0eb1e763d14c0

>   * add dt bindings, in a separate patch

Put the bindings before DTS change.

>
>  arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
>
> diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
> index d5e0392b409e..f7f34d469bde 100644
> --- a/arch/arm/boot/dts/exynos5250.dtsi
> +++ b/arch/arm/boot/dts/exynos5250.dtsi
> @@ -328,6 +328,52 @@
>                         iommus = <&sysmmu_rotator>;
>                 };
>
> +               mali: gpu@11800000 {
> +                       compatible = "samsung,exynos5250-mali", "arm,mali-t604";
> +                       reg = <0x11800000 0x5000>;
> +                       interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
> +                                    <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
> +                       interrupt-names = "job", "mmu", "gpu";
> +                       clocks = <&clock CLK_G3D>;
> +                       clock-names = "g3d";

According to bindings this is not proper clock name. I wonder why it
was working... it seems the driver expects first clock to be always
the core clock.

Best regards,
Krzysztof
