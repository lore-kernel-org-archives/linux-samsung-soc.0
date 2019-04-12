From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: about cci400 pmu
Date: Fri, 12 Apr 2019 17:12:59 +0100
Message-ID: <d03136bc-1a05-0df0-f91e-46fbac269d4a@arm.com>
References: <20190412160153.edbbe7mrwm7xsewa@macpro-scc.lancs.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190412160153.edbbe7mrwm7xsewa@macpro-scc.lancs.ac.uk>
Content-Language: en-GB
Sender: linux-kernel-owner@vger.kernel.org
To: Willy Wolff <willy.mh.wolff.ml@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 12/04/2019 17:01, Willy Wolff wrote:
> Hi,
> 
> I'm trying to add pmu support for CCI400 on an Odroid-XU3/4.
> Following https://www.kernel.org/doc/Documentation/devicetree/bindings/arm/cci.txt,
> and other dtsi, I end up with this patch:
> 
> diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
> index f4e8c5823bc2..8432f01fb463 100644
> --- a/arch/arm/boot/dts/exynos5420.dtsi
> +++ b/arch/arm/boot/dts/exynos5420.dtsi
> @@ -170,6 +170,16 @@
>                                  interface-type = "ace";
>                                  reg = <0x5000 0x1000>;
>                          };
> +
> +                       pmu@9000 {
> +                               compatible = "arm,cci-400-pmu,r0";
> +                               reg = <0x9000 0x5000>;
> +                               interrupts = <0 105 4>,
> +                                            <0 101 4>,
> +                                            <0 102 4>,
> +                                            <0 103 4>,
> +                                            <0 104 4>;
> +                       };
>                  };
>   
>                  clock: clock-controller@10010000 {
> 		
> Saddly, I got:
> [    5.375913] ARM-CCI PMU 10d20000.cci:pmu@9000: invalid resource

That message looks to come from devm_ioremap_resource(), which implies 
that platform_get_resource() is returning NULL in cci_pmu_probe(). 
Looking at the DT, you have a thing at offset 0x9000 under a parent 
"ranges" which is only 0x6000 long, so I'd guess the OF platform layer 
probably gave up on creating the resources when it couldn't translate 
the address.

Robin.

> [    5.389595] ARM-CCI PMU: probe of 10d20000.cci:pmu@9000 failed with error -12
> 
> By pluging some printk here and there in arm-cci.c in init and probe functions,
> all return 0. I assume that the driver initialisation is succesful.
> 
> I trace a bit more in really_probe function, however, I can't find the real
> cause of this error.
> 
> $ dmesg | grep cci
> [    0.070299] drivers/bus/arm-cci.c:569:cci_init()
> [    0.071484] drivers/bus/arm-cci.c:580:cci_init() cci_init_status = 0
> [    0.071610] drivers/bus/arm-cci.c:595:cci_probed() cci_init_status = 0
> [    0.113575] drivers/bus/arm-cci.c:569:cci_init()
> [    0.113684] drivers/bus/arm-cci.c:572:cci_init() cci_init_status = 0
> [    0.770287] drivers/bus/arm-cci.c:94:cci_platform_init() 0
> [    0.811655] drivers/base/dd.c:516:really_probe() ARM-CCI 10d20000.cci try probe drv = c1058908, drv->probe = c0593498, dev = e8b2f010
> [    0.811788] drivers/bus/arm-cci.c:72:cci_platform_probe()
> [    0.811866] drivers/bus/arm-cci.c:569:cci_init()
> [    0.811937] drivers/bus/arm-cci.c:572:cci_init() cci_init_status = 0
> [    0.812023] drivers/bus/arm-cci.c:595:cci_probed() cci_init_status = 0
> [    0.814718] drivers/bus/arm-cci.c:79:cci_platform_probe() 0
> [    6.738502] drivers/base/dd.c:516:really_probe() ARM-CCI PMU 10d20000.cci:pmu@9000 try probe drv = c10859f4, drv->probe = c0593498, dev = e8b2fc10
> [    6.747909] ARM-CCI PMU 10d20000.cci:pmu@9000: invalid resource
> [    6.753711] drivers/base/dd.c:522:really_probe() ARM-CCI PMU 10d20000.cci:pmu@9000 fail probe
> [    6.762416] drivers/base/dd.c:561:really_probe() ARM-CCI PMU 10d20000.cci:pmu@9000 probe_failed
> [    6.770940] ARM-CCI PMU: probe of 10d20000.cci:pmu@9000 failed with error -12
> 
> I don't know if the provided values for dtsi is correct either.
> 
> I would be very happy to have some help to make these pmu working.
> Many thanks in advance.
> 
> Best Regards,
> Willy
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
