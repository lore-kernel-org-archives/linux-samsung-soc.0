From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 01/12] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Fri, 23 Jan 2015 16:44:54 +0900
Message-ID: <54C1FBF6.4040405@samsung.com>
References: <1421821618-8627-1-git-send-email-cw00.choi@samsung.com>
 <1421821618-8627-2-git-send-email-cw00.choi@samsung.com>
 <54C129B0.1090404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:48783 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751432AbbAWHo5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 02:44:57 -0500
In-reply-to: <54C129B0.1090404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Sylwester,

On 01/23/2015 01:47 AM, Sylwester Nawrocki wrote:
> Hi Chanwoo,
> 
> On 21/01/15 07:26, Chanwoo Choi wrote:
>> This patch adds the support for CMU (Clock Management Units) of Exynos5433
>> which is 64bit SoC and has Octa-cores. This patch supports necessary clocks
>> (PLL/MMC/UART/MCT/I2C/SPI) for kernel boot and includes binding documentation
>> for Exynos5433 clock controller.
> 
>> diff --git a/Documentation/devicetree/bindings/clock/exynos5433-clock.txt b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> new file mode 100644
>> index 0000000..72cd0ba
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/exynos5433-clock.txt
>> @@ -0,0 +1,106 @@
>> +* Samsung Exynos5433 CMU (Clock Management Units)
>> +
>> +The Exynos5433 clock controller generates and supplies clock to various
>> +controllers within the Exynos5433 SoC.
>> +
>> +Required Properties:
>> +
>> +- compatible: should be one of the following.
>> +  - "samsung,exynos5433-cmu-top"   - clock controller compatible for CMU_TOP
>> +    which generates clocks for IMEM/FSYS/G3D/GSCL/HEVC/MSCL/G2D/MFC/PERIC/PERIS
>> +    domains and bus clocks.
>> +  - "samsung,exynos5433-cmu-cpif"  - clock controller compatible for CMU_CPIF
>> +    which generates clocks for LLI (Low Latency Interface) IP.
>> +  - "samsung,exynos5433-cmu-mif"   - clock controller compatible for CMU_MIF
>> +    which generates clocks for DRAM Memory Controller domain.
>> +  - "samsung,exynos5433-cmu-peric" - clock controller compatible for CMU_PERIC
>> +    which generates clocks for UART/I2C/SPI/I2S/PCM/SPDIF/PWM/SLIMBUS IPs.
>> +  - "samsung,exynos5433-cmu-peris" - clock controller compatible for CMU_PERIS
>> +    which generates clocks for PMU/TMU/MCT/WDT/RTC/SECKEY/TZPC IPs.
>> +  - "samsung,exynos5433-cmu-fsys"  - clock controller compatible for CMU_FSYS
>> +    which generates clocks for USB/UFS/SDMMC/TSI/PDMA IPs.
>> +
>> +- reg: physical base address of the controller and length of memory mapped
>> +  region.
>> +
>> +- #clock-cells: should be 1.
>> +
>> +Each clock is assigned an identifier and client nodes can use this identifier
>> +to specify the clock which they consume.
>> +
>> +All available clocks are defined as preprocessor macros in
>> +dt-bindings/clock/exynos5433.h header and can be used in device
>> +tree sources.
>> +
>> +Example 1: Examples of clock controller nodes are listed below.
>> +
>> +	cmu_top: clock-controller@0x10030000 {
>> +		compatible = "samsung,exynos5433-cmu-top";
>> +		reg = <0x10030000 0x0c04>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	cmu_cpif: clock-controller@0x10fc0000 {
>> +		compatible = "samsung,exynos5433-cmu-cpif";
>> +		reg = <0x10fc0000 0x0c04>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	cmu_mif: clock-controller@0x105b0000 {
>> +		compatible = "samsung,exynos5433-cmu-mif";
>> +		reg = <0x105b0000 0x100c>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	cmu_peric: clock-controller@0x14c80000 {
>> +		compatible = "samsung,exynos5433-cmu-peric";
>> +		reg = <0x14c80000 0x0b08>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	cmu_peris: clock-controller@0x10040000 {
>> +		compatible = "samsung,exynos5433-cmu-peris";
>> +		reg = <0x10040000 0x0b20>;
>> +		#clock-cells = <1>;
>> +	};
>> +
>> +	cmu_fsys: clock-controller@0x156e0000 {
>> +		compatible = "samsung,exynos5433-cmu-fsys";
>> +		reg = <0x156e0000 0x0b04>;
>> +		#clock-cells = <1>;
>> +	};
> 
> What are the reasons to split the whole clock controller into separate
> device nodes with different compatible strings like this? I doubt drivers
> associated with each of those compatible strings could be ever reused on
> different Exynos SoCs.

No special reason. I added the clock controller according to clock domain
separately. As I knew, samsung clk drivers use this way to support various
clock domains. For exmaple, drivers/clk/samsung/clk-exynos7.c.

> 
> There are hardware dependencies between these clock domains, which are
> not currently modelled in DT with your binding.

Right. current samsung clock drivers cannot show the hierarchy among clock domains in DT.

IOW, there is currently
> no way to ensure proper registration order of the CMUs (clock domains).
> This may be important in some cases.
> 
> To address this we could either add clocks/clock-names properties in
> respective CMU device nodes, pointing to any clocks in other CMU(s) or
> make a single device node for the whole clock controller, with an
> aggregated reg entry, e.g.
> 
>  cmu: clock-controller@0x10030000 {
> 	compatible = "samsung,exynos5433-cmu";
> 	reg =   <0x10030000 0x0c04>,
> 		<0x10fc0000 0x0c04>,
> 		<0x105b0000 0x100c>,
> 		<0x14c80000 0x0b08>,
> 		<0x10040000 0x0b20>,
> 		<0x156e0000 0x0b04>,
> 			...
> 	reg-names = "top", "cpif", "mif", "peric", "peris", "fsys"...
> 	#clock-cells = <1>;
>  };

If you make a single device node to support various clock domain,
How are you indicate the specific clock in some clock domain?

For example,
The serial dt node in exynos7.dtsi. serial_0 dt node use the uart clocks
in 'clock_peric0' clock domain and serial_1 dt node use the uart clocks
in 'clock-peric1' clock domain.

When using the clock in specific clock domain,
we need to phandle(e.g., clock_peric0, clock_peric1) of clock domain.

		serial_0: serial@13630000 {
			compatible = "samsung,exynos4210-uart";
			reg = <0x13630000 0x100>;
			interrupts = <0 440 0>;
			clocks = <&clock_peric0 PCLK_UART0>,
				 <&clock_peric0 SCLK_UART0>;
			clock-names = "uart", "clk_uart_baud0";
			status = "disabled";
		};

		serial_1: serial@14c20000 {
			compatible = "samsung,exynos4210-uart";
			reg = <0x14c20000 0x100>;
			interrupts = <0 456 0>;
			clocks = <&clock_peric1 PCLK_UART1>,
				 <&clock_peric1 SCLK_UART1>;
			clock-names = "uart", "clk_uart_baud0";
			status = "disabled";
		};

> 
> Then we could modify samsung_cmu_register_one() function by adding
> the reg entry index or name argument. What do you think ?

If there is more reasonable way to show the dependency between clock domains,
I will agree.

Best Regards,
Chanwoo Choi
