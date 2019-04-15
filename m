From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ARM: dts: exynos: add CCI-400 PMU nodes support to
 Exynos542x SoCs
Date: Mon, 15 Apr 2019 17:54:31 +0530
Message-ID: <CANAwSgSX6q4M2EcWvEA3B6zQuY0DBrh-0_r3v__R--p7dzjs7w@mail.gmail.com>
References: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412172545.fkxnpnymhcw7xncc@macpro-scc.lancs.ac.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Wolff <willy.mh.wolff.ml@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree <devicetree@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc@vger.kernel.org, Linux Kernel <linux-kernel@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Hi Willy,

On Fri, 12 Apr 2019 at 22:55, Willy Wolff <willy.mh.wolff.ml@gmail.com> wrote:
>
> Add device tree entries for PMU of ARM CCI-400.
>
> $ sudo ./perf stat -a -C 0 -e CCI_400/config=0xff,name=cycles/ sleep 1
>
>  Performance counter stats for 'system wide':
>
>        420,303,619      cycles
>
>        1.019058775 seconds time elapsed
>
> Tested on Odroid-xu3 and 4.
>
> Signed-off-by: Willy Wolff <willy.mh.wolff.ml@gmail.com>
> ---
>  arch/arm/boot/dts/exynos5420.dtsi | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index aaff15880761..be58650aca35 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -158,7 +158,7 @@
>                         #address-cells = <1>;
>                         #size-cells = <1>;
>                         reg = <0x10d20000 0x1000>;
> -                       ranges = <0x0 0x10d20000 0x6000>;
> +                       ranges = <0x0 0x10d20000 0x10000>;
>
>                         cci_control0: slave-if@4000 {
>                                 compatible = "arm,cci-400-ctrl-if";
> @@ -170,6 +170,16 @@
>                                 interface-type = "ace";
>                                 reg = <0x5000 0x1000>;
>                         };
> +
> +                       pmu@9000 {
> +                               compatible = "arm,cci-400-pmu,r0";
> +                               reg = <0x9000 0x5000>;

As per Exynos 5422 user manual below interrupts should be as follow.

+                               interrupts = <GIC_SPI 176
IRQ_TYPE_LEVEL_HIGH>, /* CCI_N_EVENT_CNT0_OVF */
+                                       <GIC_SPI 177
IRQ_TYPE_LEVEL_HIGH>, /* CCI_N_EVENT_CNT1_OVF */
+                                       <GIC_SPI 178
IRQ_TYPE_LEVEL_HIGH>, /* CCI_N_EVENT_CNT2_OVF */
+                                       <GIC_SPI 179
IRQ_TYPE_LEVEL_HIGH>, /* CCI_N_EVENT_CNT3_OVF */
+                                       <GIC_SPI 180
IRQ_TYPE_LEVEL_HIGH>, /* CCI_N_EVENT_CNT4_OVF */
+                                       <GIC_SPI 181
IRQ_TYPE_LEVEL_HIGH>; /* CCI_NERR */

> +                               interrupts = <0 105 4>,
> +                                            <0 101 4>,
> +                                            <0 102 4>,
> +                                            <0 103 4>,
> +                                            <0 104 4>;
> +                       };
>                 };
>
>                 clock: clock-controller@10010000 {
> --
> 2.11.0
>

But I am observing follow kernel warning after I enable
CONFIG_ARM_CCI_PMU + exynos_defconfig.

[    4.557701]  mmcblk0: p1
[    4.561036] BUG: sleeping function called from invalid context at
kernel/locking/mutex.c:908
[    4.568075] in_atomic(): 1, irqs_disabled(): 0, pid: 1, name: swapper/0
[    4.574656] 1 lock held by swapper/0/1:
[    4.578397]  #0: (ptrval) (&dev->mutex){....}, at:
device_driver_attach+0x18/0x60
[    4.585900] Preemption disabled at:
[    4.585909] [<c077eca8>] cci_pmu_probe+0x1cc/0x4a0
[    4.594122] CPU: 4 PID: 1 Comm: swapper/0 Not tainted 5.1.0-rc5-dirty #11
[    4.600853] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
[    4.606928] [<c011255c>] (unwind_backtrace) from [<c010de98>]
(show_stack+0x10/0x14)
[    4.614642] [<c010de98>] (show_stack) from [<c0a6ee0c>]
(dump_stack+0x98/0xc4)
[    4.621832] [<c0a6ee0c>] (dump_stack) from [<c0156e68>]
(___might_sleep+0x20c/0x2c0)
[    4.629545] [<c0156e68>] (___might_sleep) from [<c0a8a470>]
(__mutex_lock+0x3c/0xa34)
[    4.637343] [<c0a8a470>] (__mutex_lock) from [<c0a8ae84>]
(mutex_lock_nested+0x1c/0x24)
[    4.645318] [<c0a8ae84>] (mutex_lock_nested) from [<c021b498>]
(perf_pmu_register+0x20/0x40c)
[    4.653812] [<c021b498>] (perf_pmu_register) from [<c077edd0>]
(cci_pmu_probe+0x2f4/0x4a0)
[    4.662044] [<c077edd0>] (cci_pmu_probe) from [<c0591880>]
(platform_drv_probe+0x48/0x98)
[    4.670186] [<c0591880>] (platform_drv_probe) from [<c058f1b8>]
(really_probe+0x24c/0x410)
[    4.678418] [<c058f1b8>] (really_probe) from [<c058f530>]
(driver_probe_device+0x78/0x1c0)
[    4.686651] [<c058f530>] (driver_probe_device) from [<c058f8d4>]
(device_driver_attach+0x58/0x60)
[    4.695492] [<c058f8d4>] (device_driver_attach) from [<c058f994>]
(__driver_attach+0xb8/0x158)
[    4.704070] [<c058f994>] (__driver_attach) from [<c058d1f4>]
(bus_for_each_dev+0x74/0xb4)
[    4.712213] [<c058d1f4>] (bus_for_each_dev) from [<c058e398>]
(bus_add_driver+0x1c0/0x200)
[    4.720446] [<c058e398>] (bus_add_driver) from [<c0590850>]
(driver_register+0x74/0x108)
[    4.728507] [<c0590850>] (driver_register) from [<c010315c>]
(do_one_initcall+0x90/0x434)
[    4.736655] [<c010315c>] (do_one_initcall) from [<c0f0131c>]
(kernel_init_freeable+0x448/0x4ec)
[    4.745319] [<c0f0131c>] (kernel_init_freeable) from [<c0a87c44>]
(kernel_init+0x8/0x110)
[    4.753460] [<c0a87c44>] (kernel_init) from [<c01010b4>]
(ret_from_fork+0x14/0x20)
[    4.760995] Exception stack(0xe88e1fb0 to 0xe88e1ff8)
[    4.766011] 1fa0:                                     00000000
00000000 00000000 00000000
[    4.774170] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[    4.782315] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    4.789337] ARM CCI_400 PMU driver probed
[    4.797261] NET: Registered protocol family 10

Hi Krzysztof,

Cache Coherent Interface (CCI) among Cortex-A15 and Cortex-A7, G2D, G3D and SSS

Level 0 > CPU blocks such as Cortex-A15 (CA15), Cortex-A7 (CA7) are
joined as the member of Level 0 CCI bus

Level 1 > Display engine block (DISP) and 2D graphic engines (G2D) are
directly connected to Level 1.
  DISP, MDMA, SSS.

Level 2 > While all the other IP is connected to Level 1 bus via Level 2 bus
   G3D, MSCL, MFC, ISP, JPEG/Rotator/DMA/PERI, NAND/SD/EMMC.

So my question is the mapped with the cci ip block correct.
Level 0 (cci_control0)
Level 1 (cci_control1)
Level 2 (cci_control1)

Best Regards

-Anand
