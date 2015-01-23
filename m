From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 01/12] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Fri, 23 Jan 2015 18:40:10 +0100
Message-ID: <54C2877A.3040500@samsung.com>
References: <1421821618-8627-1-git-send-email-cw00.choi@samsung.com>
 <1421821618-8627-2-git-send-email-cw00.choi@samsung.com>
 <54C129B0.1090404@samsung.com> <54C1FBF6.4040405@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <54C1FBF6.4040405@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org, pankaj.dubey@samsung.com, inki.dae@samsung.com, chanho61.park@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

On 23/01/15 08:44, Chanwoo Choi wrote:
>>> +	cmu_top: clock-controller@0x10030000 {
>>> >> +		compatible = "samsung,exynos5433-cmu-top";
>>> >> +		reg = <0x10030000 0x0c04>;
>>> >> +		#clock-cells = <1>;
>>> >> +	};
>>> >> +

>>> >> +	cmu_fsys: clock-controller@0x156e0000 {
>>> >> +		compatible = "samsung,exynos5433-cmu-fsys";
>>> >> +		reg = <0x156e0000 0x0b04>;
>>> >> +		#clock-cells = <1>;
>>> >> +	};
>> > 
>> > What are the reasons to split the whole clock controller into separate
>> > device nodes with different compatible strings like this? I doubt drivers
>> > associated with each of those compatible strings could be ever reused on
>> > different Exynos SoCs.
>
> No special reason. I added the clock controller according to clock domain
> separately. As I knew, samsung clk drivers use this way to support various
> clock domains. For exmaple, drivers/clk/samsung/clk-exynos7.c.

I'm afraid exynos7 has that initialization ordering issue, unfortunately I
didn't notice it before.

>> > There are hardware dependencies between these clock domains, which are
>> > not currently modelled in DT with your binding.
>
> Right. current samsung clock drivers cannot show the hierarchy among clock 
> domains in DT.
> 
>> > IOW, there is currently
>> > no way to ensure proper registration order of the CMUs (clock domains).
>> > This may be important in some cases.
>> > 
>> > To address this we could either add clocks/clock-names properties in
>> > respective CMU device nodes, pointing to any clocks in other CMU(s) or
>> > make a single device node for the whole clock controller, with an
>> > aggregated reg entry, e.g.
>> > 
>> >  cmu: clock-controller@0x10030000 {
>> > 	compatible = "samsung,exynos5433-cmu";
>> > 	reg =   <0x10030000 0x0c04>,
>> > 		<0x10fc0000 0x0c04>,
>> > 		<0x105b0000 0x100c>,
>> > 		<0x14c80000 0x0b08>,
>> > 		<0x10040000 0x0b20>,
>> > 		<0x156e0000 0x0b04>,
>> > 			...
>> > 	reg-names = "top", "cpif", "mif", "peric", "peris", "fsys"...
>> > 	#clock-cells = <1>;
>> >  };
>
> If you make a single device node to support various clock domain,
> How are you indicate the specific clock in some clock domain?

This might be an issue, we would need to make all the clk indexes a one
contiguous set. I'm wondering if there is really any use of having such
information expressed explicitly in DT, or it would just make the DT
binding closer resembling the SoC's documentation ?

Similarly, the clock controller is divided into subdomains in older SoCs,
like exynos4, yet we do not create separate device nodes for each domain.
Is reference to each individual clock domain required in any other SoC's
part in case of exynos5433 ?

> For example,
> The serial dt node in exynos7.dtsi. serial_0 dt node use the uart clocks
> in 'clock_peric0' clock domain and serial_1 dt node use the uart clocks
> in 'clock-peric1' clock domain.
>
> When using the clock in specific clock domain,
> we need to phandle(e.g., clock_peric0, clock_peric1) of clock domain.
> 
> 		serial_0: serial@13630000 {
> 			compatible = "samsung,exynos4210-uart";
> 			reg = <0x13630000 0x100>;
> 			interrupts = <0 440 0>;
> 			clocks = <&clock_peric0 PCLK_UART0>,
> 				 <&clock_peric0 SCLK_UART0>;
> 			clock-names = "uart", "clk_uart_baud0";
> 			status = "disabled";
> 		};
> 
> 		serial_1: serial@14c20000 {
> 			compatible = "samsung,exynos4210-uart";
> 			reg = <0x14c20000 0x100>;
> 			interrupts = <0 456 0>;
> 			clocks = <&clock_peric1 PCLK_UART1>,
> 				 <&clock_peric1 SCLK_UART1>;
> 			clock-names = "uart", "clk_uart_baud0";
> 			status = "disabled";
> 		};
>
>> > Then we could modify samsung_cmu_register_one() function by adding
>> > the reg entry index or name argument. What do you think ?
>
> If there is more reasonable way to show the dependency between clock domains,
> I will agree.

The other option I mentioned is specifying all parent clocks of a given
clock domain in its device node with clocks(/clock-names) properties.
But it might be a bit hard to list all the clock domain dependencies
this way

--
Regards,
Sylwester
