From: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] ARM: dts: exynos: add cpu perf counters to Exynos54xx
 boards
Date: Fri, 20 Oct 2017 17:15:51 +0100
Message-ID: <e2b87fe2-bc04-242d-8f4f-9cd21743e3aa@arm.com>
References: <CAM3PiRxi8sxf6T990K8rd7UsOLd2D5TaLciF=c_wF=9gmpLKYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAM3PiRxi8sxf6T990K8rd7UsOLd2D5TaLciF=c_wF=9gmpLKYg@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marian Mihailescu <mihailescu2m@gmail.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 20/10/17 13:09, Marian Mihailescu wrote:
> Hi,
> 
> This patch enables support for ARM Performance Monitoring Units
> available in Cortex-A7
> and Cortex-A15 CPU cores for Exynos54xx SoCs (5410, 5420 and 5422/5800).
> 
> Exynos5410 currently has only Cortex-A7 nodes defined in the device tree,
> so the Cortex-A15 PMU is defined in the exynos5420 device tree file.

Huh? 5410 only has the *A15* cluster described (and for whatever reason
mainline cannot bring up the A7 cluster even if you do add it).

Also*, the interrupt affinity properties are bogus as presented - those
will need to be delegated to the SoC-variant-specific dtsi files in the
same manner as the "cpus" nodes, to cope with the different CPU numberings.

Robin.

*I'd like to have made this comment inline in the patch, but I can't :(

> Tested with perf on Odroid XU4 (Exynos5422):
> armv7_cortex_a7 PMU driver: 5 counters available
> armv7_cortex_a15 PMU driver: 7 counters available
> 
> Regards,
> Marian
> 
> --
> Either I've been missing something or nothing has been going on. (K. E. Gordon)
> 
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
