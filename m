From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [RFC PATCH v2 03/21] exynos/dsim: add DT bindings
Date: Fri, 07 Mar 2014 11:54:14 +0100
Message-ID: <5319A556.7000907@samsung.com>
References: <1392204688-4591-1-git-send-email-a.hajda@samsung.com>
	<1392204688-4591-4-git-send-email-a.hajda@samsung.com>
	<CAAQKjZPO80-+-9kMufJGimjS8bAJBgHBS=DNESro_cvMmzqbgg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <CAAQKjZPO80-+-9kMufJGimjS8bAJBgHBS=DNESro_cvMmzqbgg@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, DRI mailing list <dri-devel@lists.freedesktop.org>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

On 03/05/2014 06:56 AM, Inki Dae wrote:
> 2014-02-12 20:31 GMT+09:00 Andrzej Hajda <a.hajda@samsung.com>:
>> The patch adds DT bindings for Exynos DSI Master. DSIM follows rules
>> for DSI bus host bindings [1].
>> Properties describes its resources: memory, interrupt, clocks,
>> phy, regulators and frequencies of clocks.
>>
>> [1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
>>
>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>> ---
>> v2
>> - added burst and esc clock frequency properties
>> - add samsung prefix to all frequency props
>> ---
>>  .../devicetree/bindings/video/exynos_dsim.txt      | 53 ++++++++++++++++++++++
>>  1 file changed, 53 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/video/exynos_dsim.txt
>>
>> diff --git a/Documentation/devicetree/bindings/video/exynos_dsim.txt b/Documentation/devicetree/bindings/video/exynos_dsim.txt
>> new file mode 100644
>> index 0000000..2a49704
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/video/exynos_dsim.txt
>> @@ -0,0 +1,53 @@
>> +Exynos MIPI DSI Master
>> +
>> +Required properties:
>> +  - compatible: "samsung,exynos4210-mipi-dsi"
>> +  - reg: physical base address and length of the registers set for the device
>> +  - interrupts: should contain DSI interrupt
>> +  - clocks: list of clock specifiers, must contain an entry for each required
>> +    entry in clock-names
>> +  - clock-names: should include "bus_clk"and "pll_clk" entries
>> +  - phys: list of phy specifiers, must contain an entry for each required
>> +    entry in phy-names
>> +  - phy-names: should include "dsim" entry
>> +  - vddcore-supply: MIPI DSIM Core voltage supply (e.g. 1.1V)
>> +  - vddio-supply: MIPI DSIM I/O and PLL voltage supply (e.g. 1.8V)
>> +  - samsung,pll-clock-frequency: specifies frequency of the "pll_clk" clock
>> +  - samsung,burst-clock-frequency: specifies DSI frequency in high-speed burst
>> +    mode
>> +  - samsung,esc-clock-frequency: specifies DSI frequency in escape mode
>> +  - #address-cells, #size-cells: should be set respectively to <1> and <0>
>> +    according to DSI host bindings (see MIPI DSI bindings [1])
>> +
>> +Optional properties:
>> +  - samsung,power-domain: a phandle to DSIM power domain node
>> +
>> +Child nodes:
>> +  Should contain DSI peripheral nodes (see DSI bindings [1])
>> +
>> +[1]: Documentation/devicetree/bindings/mipi/dsi/mipi-dsi-bus.txt
>> +
>> +Example:
>> +
>> +       dsi@11C80000 {
>> +               compatible = "samsung,exynos4210-mipi-dsi";
>> +               reg = <0x11C80000 0x10000>;
>> +               interrupts = <0 79 0>;
>> +               clocks = <&clock 286>, <&clock 143>;
>> +               clock-names = "bus_clk", "pll_clk";
>> +               phys = <&mipi_phy 1>;
>> +               phy-names = "dsim";
>> +               vddcore-supply = <&vusb_reg>;
>> +               vddio-supply = <&vmipi_reg>;
>> +               samsung,power-domain = <&pd_lcd0>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +               samsung,pll-clock-frequency = <24000000>;
>> +               samsung,burst-clock-frequency = <500000000>;
>> +               samsung,esc-clock-frequency = <20000000>;
> Isn't a property indicating cpu or video mode needed for the future
> even though now DSI driver doesn't support CPU interface yet? Which
> mode is used would depend on machine.
Mode is determined by panel, ie. by dsi slave.

Regards
Andrzej
>
>> +
>> +               panel@0 {
>> +                       reg = <0>;
>> +                       ...
>> +               };
>> +       };
>> --
>> 1.8.3.2
>>
>> _______________________________________________
>> dri-devel mailing list
>> dri-devel@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/dri-devel
