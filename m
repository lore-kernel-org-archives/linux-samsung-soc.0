From: Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH 1/3] dt-bindings: regulator/clock/mfd: Reorganize
 S2MPS-family bindings
Date: Wed, 23 Dec 2015 23:20:35 -0800
Message-ID: <CAEG3pNBan53mFu8kN6Kr_AdHsYmmz-AA1-YiaTXYhJi-bsvTxw@mail.gmail.com>
References: <1449191405-3344-1-git-send-email-k.kozlowski@samsung.com> <1449191405-3344-2-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f178.google.com ([209.85.220.178]:35948 "EHLO
	mail-qk0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754387AbbLXHVH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Dec 2015 02:21:07 -0500
Received: by mail-qk0-f178.google.com with SMTP id t125so168157906qkh.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 23 Dec 2015 23:21:06 -0800 (PST)
In-Reply-To: <1449191405-3344-2-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Lee Jones <lee.jones@linaro.org>, Kukjin Kim <kgene@kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, Stephen Boyd <sboyd@codeaurora.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, linux-clk <linux-clk@vger.kernel.org>

On Thu, Dec 3, 2015 at 5:10 PM, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> Bindings for Samsung S2M and S5M family PMICs are in mess. They are
> spread over different files and subdirectories in a non-consistent way.
> The devices and respective drivers for them share a lot in common so
> everything could be organized in a more readable way.
>
> Reorganize the S2MPS11/13/14/15 Device Tree bindings to match the
> drivers for this family of devices:
>  - move mfd/s2mps11.txt to mfd/samsung,sec-core.txt for the main MFD
>    driver (common for entire family),
>  - split clock block to clock/samsung,s2mps11.txt,
>  - split regulator block to regulator/samsung,s2mps11.txt.
>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Acked-by: Michael Turquette <mturquette@baylibre.com>

> ---
>  .../devicetree/bindings/clock/samsung,s2mps11.txt  |  49 +++++++
>  Documentation/devicetree/bindings/mfd/s2mps11.txt  | 153 ---------------------
>  .../devicetree/bindings/mfd/samsung,sec-core.txt   |  84 +++++++++++
>  .../bindings/regulator/samsung,s2mps11.txt         | 102 ++++++++++++++
>  MAINTAINERS                                        |   4 +-
>  5 files changed, 238 insertions(+), 154 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
>  delete mode 100644 Documentation/devicetree/bindings/mfd/s2mps11.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
> new file mode 100644
> index 000000000000..2726c1d58a79
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
> @@ -0,0 +1,49 @@
> +Binding for Samsung S2M and S5M family clock generator block
> +============================================================
> +
> +This is a part of device tree bindings for S2M and S5M family multi-function
> +devices.
> +More information can be found in bindings/mfd/sec-core.txt file.
> +
> +The S2MPS11/13/15 and S5M8767 provide three(AP/CP/BT) buffered 32.768 kHz
> +outputs. The S2MPS14 provides two (AP/BT) buffered 32.768 KHz outputs.
> +
> +To register these as clocks with common clock framework instantiate under
> +main device node a sub-node named "clocks".
> +
> +It uses the common clock binding documented in:
> + - Documentation/devicetree/bindings/clock/clock-bindings.txt
> +
> +
> +Required properties of the "clocks" sub-node:
> + - #clock-cells: should be 1.
> + - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
> +               "samsung,s2mps14-clk", "samsung,s5m8767-clk"
> +   The S2MPS15 uses the same compatible as S2MPS13, as both provides similar
> +   clocks.
> +
> +
> +Each clock is assigned an identifier and client nodes use this identifier
> +to specify the clock which they consume.
> +    Clock               ID           Devices
> +    ----------------------------------------------------------
> +    32KhzAP            0            S2MPS11/13/14/15, S5M8767
> +    32KhzCP            1            S2MPS11/13/15, S5M8767
> +    32KhzBT            2            S2MPS11/13/14/15, S5M8767
> +
> +Include dt-bindings/clock/samsung,s2mps11.h file to use preprocessor defines
> +in device tree sources.
> +
> +
> +Example:
> +
> +       s2mps11_pmic@66 {
> +               compatible = "samsung,s2mps11-pmic";
> +               reg = <0x66>;
> +
> +               s2m_osc: clocks {
> +                       compatible = "samsung,s2mps11-clk";
> +                       #clock-cells = <1>;
> +                       clock-output-names = "xx", "yy", "zz";
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/mfd/s2mps11.txt b/Documentation/devicetree/bindings/mfd/s2mps11.txt
> deleted file mode 100644
> index 09b94c97faac..000000000000
> --- a/Documentation/devicetree/bindings/mfd/s2mps11.txt
> +++ /dev/null
> @@ -1,153 +0,0 @@
> -
> -* Samsung S2MPS11/13/14/15 and S2MPU02 Voltage and Current Regulator
> -
> -The Samsung S2MPS11 is a multi-function device which includes voltage and
> -current regulators, RTC, charger controller and other sub-blocks. It is
> -interfaced to the host controller using an I2C interface. Each sub-block is
> -addressed by the host system using different I2C slave addresses.
> -
> -Required properties:
> -- compatible: Should be one of the following
> -       - "samsung,s2mps11-pmic"
> -       - "samsung,s2mps13-pmic"
> -       - "samsung,s2mps14-pmic"
> -       - "samsung,s2mps15-pmic"
> -       - "samsung,s2mpu02-pmic".
> -- reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
> -
> -Optional properties:
> -- interrupt-parent: Specifies the phandle of the interrupt controller to which
> -  the interrupts from s2mps11 are delivered to.
> -- interrupts: Interrupt specifiers for interrupt sources.
> -- samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC is pulled
> -  down. When the system is suspended it will always go down thus triggerring
> -  unwanted buck warm reset (setting buck voltages to default values).
> -- samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
> -  connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
> -  register to turn off the power. Usually the ACOKB is pulled up to VBATT so
> -  when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
> -
> -Optional nodes:
> -- clocks: s2mps11, s2mps13, s2mps15 and s5m8767 provide three(AP/CP/BT) buffered 32.768
> -  KHz outputs, so to register these as clocks with common clock framework
> -  instantiate a sub-node named "clocks". It uses the common clock binding
> -  documented in :
> -  [Documentation/devicetree/bindings/clock/clock-bindings.txt]
> -  The s2mps14 provides two (AP/BT) buffered 32.768 KHz outputs.
> -  - #clock-cells: should be 1.
> -
> -  - The following is the list of clocks generated by the controller. Each clock
> -    is assigned an identifier and client nodes use this identifier to specify
> -    the clock which they consume.
> -    Clock               ID           Devices
> -    ----------------------------------------------------------
> -    32KhzAP            0            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
> -    32KhzCP            1            S2MPS11, S2MPS13, S2MPS15, S5M8767
> -    32KhzBT            2            S2MPS11, S2MPS13, S2MPS14, S2MPS15, S5M8767
> -
> -  - compatible: Should be one of: "samsung,s2mps11-clk", "samsung,s2mps13-clk",
> -               "samsung,s2mps14-clk", "samsung,s5m8767-clk"
> -    The s2msp15 uses the same compatible as s2mps13, as both provides similar clocks.
> -
> -- regulators: The regulators of s2mps11 that have to be instantiated should be
> -included in a sub-node named 'regulators'. Regulator nodes included in this
> -sub-node should be of the format as listed below.
> -
> -       regulator_name {
> -               [standard regulator constraints....];
> -       };
> -
> - regulator-ramp-delay for BUCKs = [6250/12500/25000(default)/50000] uV/us
> -
> - BUCK[2/3/4/6] supports disabling ramp delay on hardware, so explicitly
> - regulator-ramp-delay = <0> can be used for them to disable ramp delay.
> - In the absence of the regulator-ramp-delay property, the default ramp
> - delay will be used.
> -
> -NOTE: Some BUCKs share the ramp rate setting i.e. same ramp value will be set
> -for a particular group of BUCKs. So provide same regulator-ramp-delay<value>.
> -Grouping of BUCKs sharing ramp rate setting is as follow : BUCK[1, 6],
> -BUCK[3, 4], and BUCK[7, 8, 10]
> -
> -On S2MPS14 the LDO10, LDO11 and LDO12 can be configured to external control
> -over GPIO. To turn this feature on this property must be added to the regulator
> -sub-node:
> -       - samsung,ext-control-gpios: GPIO specifier for one GPIO
> -               controlling this regulator (enable/disable);
> -Example:
> -       LDO12 {
> -               regulator-name = "V_EMMC_2.8V";
> -               regulator-min-microvolt = <2800000>;
> -               regulator-max-microvolt = <2800000>;
> -               samsung,ext-control-gpios = <&gpk0 2 0>;
> -       };
> -
> -
> -The regulator constraints inside the regulator nodes use the standard regulator
> -bindings which are documented elsewhere.
> -
> -The following are the names of the regulators that the s2mps11 pmic block
> -supports. Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
> -as per the datasheet of s2mps11.
> -
> -       - LDOn
> -                 - valid values for n are:
> -                       - S2MPS11: 1 to 38
> -                       - S2MPS13: 1 to 40
> -                       - S2MPS14: 1 to 25
> -                       - S2MPS15: 1 to 27
> -                       - S2MPU02: 1 to 28
> -                 - Example: LDO1, LDO2, LDO28
> -       - BUCKn
> -                 - valid values for n are:
> -                       - S2MPS11: 1 to 10
> -                       - S2MPS13: 1 to 10
> -                       - S2MPS14: 1 to 5
> -                       - S2MPS15: 1 to 10
> -                       - S2MPU02: 1 to 7
> -                 - Example: BUCK1, BUCK2, BUCK9
> -
> -Example:
> -
> -       s2mps11_pmic@66 {
> -               compatible = "samsung,s2mps11-pmic";
> -               reg = <0x66>;
> -
> -               s2m_osc: clocks {
> -                       compatible = "samsung,s2mps11-clk";
> -                       #clock-cells = <1>;
> -                       clock-output-names = "xx", "yy", "zz";
> -               };
> -
> -               regulators {
> -                       ldo1_reg: LDO1 {
> -                               regulator-name = "VDD_ABB_3.3V";
> -                               regulator-min-microvolt = <3300000>;
> -                               regulator-max-microvolt = <3300000>;
> -                       };
> -
> -                       ldo2_reg: LDO2 {
> -                               regulator-name = "VDD_ALIVE_1.1V";
> -                               regulator-min-microvolt = <1100000>;
> -                               regulator-max-microvolt = <1100000>;
> -                               regulator-always-on;
> -                       };
> -
> -                       buck1_reg: BUCK1 {
> -                               regulator-name = "vdd_mif";
> -                               regulator-min-microvolt = <950000>;
> -                               regulator-max-microvolt = <1350000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                       };
> -
> -                       buck2_reg: BUCK2 {
> -                               regulator-name = "vdd_arm";
> -                               regulator-min-microvolt = <950000>;
> -                               regulator-max-microvolt = <1350000>;
> -                               regulator-always-on;
> -                               regulator-boot-on;
> -                               regulator-ramp-delay = <50000>;
> -                       };
> -               };
> -       };
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> new file mode 100644
> index 000000000000..ef0166d0f643
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> @@ -0,0 +1,84 @@
> +Binding for Samsung S2M and S5M family multi-function device
> +============================================================
> +
> +This is a part of device tree bindings for S2M and S5M family multi-function
> +devices.
> +
> +The Samsung S2MPS11/13/14/15, S2MPU02 and S5M8767 is a family
> +of multi-function devices which include voltage and current regulators, RTC,
> +charger controller, clock outputs and other sub-blocks. It is interfaced
> +to the host controller using an I2C interface. Each sub-block is usually
> +addressed by the host system using different I2C slave addresses.
> +
> +
> +This document describes bindings for main device node. Optional sub-blocks
> +must be a sub-nodes to it. Bindings for them can be found in:
> + - bindings/regulator/samsung,s2mps11.txt
> + - bindings/clock/samsung,s2mps11.txt
> +
> +
> +Required properties:
> + - compatible: Should be one of the following
> +       - "samsung,s2mps11-pmic",
> +       - "samsung,s2mps13-pmic",
> +       - "samsung,s2mps14-pmic",
> +       - "samsung,s2mps15-pmic",
> +       - "samsung,s2mpu02-pmic".
> + - reg: Specifies the I2C slave address of the pmic block. It should be 0x66.
> +
> +Optional properties:
> + - interrupt-parent: Specifies the phandle of the interrupt controller to which
> +   the interrupts from s2mps11 are delivered to.
> + - interrupts: Interrupt specifiers for interrupt sources.
> + - samsung,s2mps11-wrstbi-ground: Indicates that WRSTBI pin of PMIC is pulled
> +   down. When the system is suspended it will always go down thus triggerring
> +   unwanted buck warm reset (setting buck voltages to default values).
> + - samsung,s2mps11-acokb-ground: Indicates that ACOKB pin of S2MPS11 PMIC is
> +   connected to the ground so the PMIC must manually set PWRHOLD bit in CTRL1
> +   register to turn off the power. Usually the ACOKB is pulled up to VBATT so
> +   when PWRHOLD pin goes low, the rising ACOKB will trigger power off.
> +
> +Example:
> +
> +       s2mps11_pmic@66 {
> +               compatible = "samsung,s2mps11-pmic";
> +               reg = <0x66>;
> +
> +               s2m_osc: clocks {
> +                       compatible = "samsung,s2mps11-clk";
> +                       #clock-cells = <1>;
> +                       clock-output-names = "xx", "yy", "zz";
> +               };
> +
> +               regulators {
> +                       ldo1_reg: LDO1 {
> +                               regulator-name = "VDD_ABB_3.3V";
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       ldo2_reg: LDO2 {
> +                               regulator-name = "VDD_ALIVE_1.1V";
> +                               regulator-min-microvolt = <1100000>;
> +                               regulator-max-microvolt = <1100000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck1_reg: BUCK1 {
> +                               regulator-name = "vdd_mif";
> +                               regulator-min-microvolt = <950000>;
> +                               regulator-max-microvolt = <1350000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       buck2_reg: BUCK2 {
> +                               regulator-name = "vdd_arm";
> +                               regulator-min-microvolt = <950000>;
> +                               regulator-max-microvolt = <1350000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-ramp-delay = <50000>;
> +                       };
> +               };
> +       };
> diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
> new file mode 100644
> index 000000000000..27a48bf1b185
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
> @@ -0,0 +1,102 @@
> +Binding for Samsung S2M family regulator block
> +==============================================
> +
> +This is a part of device tree bindings for S2M family multi-function devices.
> +More information can be found in bindings/mfd/sec-core.txt file.
> +
> +The S2MPS11/13/14/15 and S2MPU02 devices provide buck and LDO regulators.
> +
> +To register these with regulator framework instantiate under main device node
> +a sub-node named "regulators" with more sub-nodes for each regulator using the
> +common regulator binding documented in:
> + - Documentation/devicetree/bindings/regulator/regulator.txt
> +
> +
> +Names of regulators supported by different devices:
> +       - LDOn
> +                 - valid values for n are:
> +                       - S2MPS11: 1 to 38
> +                       - S2MPS13: 1 to 40
> +                       - S2MPS14: 1 to 25
> +                       - S2MPS15: 1 to 27
> +                       - S2MPU02: 1 to 28
> +                 - Example: LDO1, LDO2, LDO28
> +       - BUCKn
> +                 - valid values for n are:
> +                       - S2MPS11: 1 to 10
> +                       - S2MPS13: 1 to 10
> +                       - S2MPS14: 1 to 5
> +                       - S2MPS15: 1 to 10
> +                       - S2MPU02: 1 to 7
> +                 - Example: BUCK1, BUCK2, BUCK9
> +Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
> +as per the datasheet of device.
> +
> +
> +Optional properties of the nodes under "regulators" sub-node:
> + - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500,
> +   25000 (default) or 50000.
> +
> +   Additionally S2MPS11 supports disabling ramp delay for BUCK{2,3,4,6}
> +   by setting it to <0>.
> +
> +   Note: On S2MPS11 some bucks share the ramp rate setting i.e. same ramp value
> +   will be set for a particular group of bucks so provide the same
> +   regulator-ramp-delay value for them.
> +   Groups sharing ramp rate:
> +    - buck{1,6},
> +    - buck{3,4},
> +    - buck{7,8,10}.
> +
> + - samsung,ext-control-gpios: On S2MPS14 the LDO10, LDO11 and LDO12 can be
> +   configured to external control over GPIO. To turn this feature on this
> +   property must be added to the regulator sub-node:
> +    - samsung,ext-control-gpios: GPIO specifier for one GPIO
> +                                 controlling this regulator (enable/disable)
> +  Example:
> +       LDO12 {
> +               regulator-name = "V_EMMC_2.8V";
> +               regulator-min-microvolt = <2800000>;
> +               regulator-max-microvolt = <2800000>;
> +               samsung,ext-control-gpios = <&gpk0 2 0>;
> +       };
> +
> +
> +Example:
> +
> +       s2mps11_pmic@66 {
> +               compatible = "samsung,s2mps11-pmic";
> +               reg = <0x66>;
> +
> +               regulators {
> +                       ldo1_reg: LDO1 {
> +                               regulator-name = "VDD_ABB_3.3V";
> +                               regulator-min-microvolt = <3300000>;
> +                               regulator-max-microvolt = <3300000>;
> +                       };
> +
> +                       ldo2_reg: LDO2 {
> +                               regulator-name = "VDD_ALIVE_1.1V";
> +                               regulator-min-microvolt = <1100000>;
> +                               regulator-max-microvolt = <1100000>;
> +                               regulator-always-on;
> +                       };
> +
> +                       buck1_reg: BUCK1 {
> +                               regulator-name = "vdd_mif";
> +                               regulator-min-microvolt = <950000>;
> +                               regulator-max-microvolt = <1350000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                       };
> +
> +                       buck2_reg: BUCK2 {
> +                               regulator-name = "vdd_arm";
> +                               regulator-min-microvolt = <950000>;
> +                               regulator-max-microvolt = <1350000>;
> +                               regulator-always-on;
> +                               regulator-boot-on;
> +                               regulator-ramp-delay = <50000>;
> +                       };
> +               };
> +       };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f3de00113ae8..137284e37250 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9234,7 +9234,9 @@ F:        drivers/clk/clk-s2mps11.c
>  F:     drivers/rtc/rtc-s5m.c
>  F:     include/linux/mfd/samsung/
>  F:     Documentation/devicetree/bindings/regulator/s5m8767-regulator.txt
> -F:     Documentation/devicetree/bindings/mfd/s2mp*.txt
> +F:     Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
> +F:     Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
> +F:     Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
>
>  SAMSUNG S5P/EXYNOS4 SOC SERIES CAMERA SUBSYSTEM DRIVERS
>  M:     Kyungmin Park <kyungmin.park@samsung.com>
> --
> 1.9.1
>



-- 
Michael Turquette
CEO
BayLibre - At the Heart of Embedded Linux
http://baylibre.com/
