From: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: Re: [PATCH v4 1/4] mfd: Add DT bindings documentation for Samsung
 Exynos LPASS
Date: Fri, 05 Aug 2016 17:44:33 +0200
Message-ID: <ac95ed3f-a4c5-e1a9-8470-8d00b14b1f95@samsung.com>
References: <1467738785-31410-1-git-send-email-s.nawrocki@samsung.com>
 <20160805133628.GG5243@dell>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <20160805133628.GG5243@dell>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ideal.song-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, inki.dae-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, b.zolnierkie-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

On 08/05/2016 03:36 PM, Lee Jones wrote:
> On Tue, 05 Jul 2016, Sylwester Nawrocki wrote:
> 
>> This patch adds documentation of the DT bindings for the Samsung
>> Exynos SoC Low Power Audio Subsystem.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>

>> new file mode 100644
>> index 0000000..7e97c0d
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/mfd/samsung,exynos5433-lpass.txt
>> @@ -0,0 +1,21 @@
>> +
> 
> Nit: This line is superfluous.
>
>> +Samsung Exynos SoC Low Power Audio Subsystem (LPASS)
>> +
>> +Required properties:
>> +
>> + - compatible : "samsung,exynos5433-lpass"
>> + - reg : should contain the LPASS top SFR region location and size
>> + - samsung,pmu-syscon : the phandle to the Power Management Unit node
>> + - #address-cells: should be 1
>> + - #size-cells: should be 1
>> + - ranges: must be present
> 
> These look so much better like:
> 
> - compatible  	  : "samsung,exynos5433-lpass"
> - reg		   	  : should contain the LPASS top SFR region location and size
> - samsung,pmu-syscon 	  : the phandle to the Power Management Unit node
> - #address-cells	  : should be 1
> - #size-cells		  : should be 1
> - ranges		  : must be present

OK, will rewrite it this way.

>> +Each IP block of the Low Power Audio Subsystem should be specified
>> +as an optional sub-node. For "samsung,exynos5433-lpass" compatible
>> +this includes: UART, SLIMBUS, PCM, I2S, DMAC, Timers 0...4, WDT 0...1
>> +devices.
>> +
>> +Bindings of the sub-nodes are described in:
>> + Documentation/devicetree/bindings/serial/samsung_uart.txt
>> + Documentation/devicetree/bindings/sound/samsung-i2s.txt
>> + Documentation/devicetree/bindings/dma/arm-pl330.txt
> 
> Use relative path names:
> 
> ../serial/samsung_uart.txt
> ../sound/samsung-i2s.txt
> ../dma/arm-pl330.txt

OK, actually I had it this way in one of the versions but somehow
with full paths it appeared better to me.

> Missing example?

Yes, omitted deliberately as that appeared quite many more lines
with fully specified subnodes.  Perhaps I will add it with omitted
all properties of the subnodes but compatible.


 audio-subsystem {
	compatible = "samsung,exynos5433-lpass";
	reg = <0x11400000 0x100>, <0x11500000 0x08>;
	samsung,pmu-syscon = <&pmu_system_controller>;
	#address-cells = <1>;
	#size-cells = <1>;
	ranges;

	adma: adma@11420000 {
		compatible = "arm,pl330", "arm,primecell";
		reg = <0x11420000 0x1000>;
		interrupts = <0 73 0>;
		clocks = <&cmu_aud CLK_ACLK_DMAC>;
		clock-names = "apb_pclk";
		#dma-cells = <1>;
		#dma-channels = <8>;
		#dma-requests = <32>;
        };

	i2s0: i2s0@11440000 {
		compatible = "samsung,exynos7-i2s";
		reg = <0x11440000 0x100>;
		dmas = <&adma 0 &adma 2>;
		dma-names = "tx", "rx";
		interrupts = <0 70 0>;
		clocks = <&cmu_aud CLK_PCLK_AUD_I2S>,
			 <&cmu_aud CLK_SCLK_AUD_I2S>,
			 <&cmu_aud CLK_SCLK_I2S_BCLK>;
		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
		pinctrl-names = "default";
		pinctrl-0 = <&i2s0_bus>;
		status = "disabled";
	};

	serial_3: serial@11460000 {
		compatible = "samsung,exynos5433-uart";
		reg = <0x11460000 0x100>;
		interrupts = <0 67 0>;
		clocks = <&cmu_aud CLK_PCLK_AUD_UART>,
			 <&cmu_aud CLK_SCLK_AUD_UART>;
		clock-names = "uart", "clk_uart_baud0";
		pinctrl-names = "default";
		pinctrl-0 = <&uart_aud_bus>;
		status = "disabled";
	};
 };
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
