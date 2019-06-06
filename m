From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v8 07/13] dt-bindings: memory-controllers: add
 Exynos5422 DMC device description
Date: Thu, 6 Jun 2019 12:15:29 +0200
Message-ID: <658d4f9a-633e-e64f-ea10-fbf9e758b80e@partner.samsung.com>
References: <CGME20190605165433eucas1p1214f65106df03ae74bbdc95e3eee71f1@eucas1p1.samsung.com>
        <20190605165410.14606-1-l.luba@partner.samsung.com>
        <20190605165410.14606-8-l.luba@partner.samsung.com>
        <CAJKOXPdg9Fr2Y16RJ4gbRnL6PiyWw2J3e46ybkRWTKOEd28GJA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPdg9Fr2Y16RJ4gbRnL6PiyWw2J3e46ybkRWTKOEd28GJA@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 6/6/19 10:29 AM, Krzysztof Kozlowski wrote:
> On Wed, 5 Jun 2019 at 18:54, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> The patch adds description for DT binding for a new Exynos5422 Dynamic
>> Memory Controller device.
>>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   .../memory-controllers/exynos5422-dmc.txt     | 84 +++++++++++++++++++
>>   1 file changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>>
>> diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>> new file mode 100644
>> index 000000000000..989ee0839fdf
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
>> @@ -0,0 +1,84 @@
>> +* Exynos5422 frequency and voltage scaling for Dynamic Memory Controller device
>> +
>> +The Samsung Exynos5422 SoC has DMC (Dynamic Memory Controller) to which the DRAM
>> +memory chips are connected. The driver is to monitor the controller in runtime
>> +and switch frequency and voltage. To monitor the usage of the controller in
>> +runtime, the driver uses the PPMU (Platform Performance Monitoring Unit), which
>> +is able to measure the current load of the memory.
>> +When 'userspace' governor is used for the driver, an application is able to
>> +switch the DMC and memory frequency.
>> +
>> +Required properties for DMC device for Exynos5422:
>> +- compatible: Should be "samsung,exynos5422-dmc".
>> +- clocks : list of clock specifiers, must contain an entry for each
>> +  required entry in clock-names for CLK_FOUT_SPLL, CLK_MOUT_SCLK_SPLL,
>> +  CLK_FF_DOUT_SPLL2, CLK_FOUT_BPLL, CLK_MOUT_BPLL, CLK_SCLK_BPLL,
>> +  CLK_MOUT_MX_MSPLL_CCORE, CLK_MOUT_MX_MSPLL_CCORE_PHY, CLK_MOUT_MCLK_CDREX,
>> +  CLK_DOUT_CLK2X_PHY0, CLK_CLKM_PHY0, CLK_CLKM_PHY1
>> +- clock-names : should include "fout_spll", "mout_sclk_spll", "ff_dout_spll2",
>> +  "fout_bpll", "mout_bpll", "sclk_bpll", "mout_mx_mspll_ccore",
>> +  "mout_mx_mspll_ccore_phy", "mout_mclk_cdrex", "dout_clk2x_phy0", "clkm_phy0",
>> +  "clkm_phy1" entries
>> +- devfreq-events : phandles for PPMU devices connected to this DMC.
>> +- vdd-supply : phandle for voltage regulator which is connected.
>> +- reg : registers of two CDREX controllers.
>> +- operating-points-v2 : phandle for OPPs described in v2 definition.
>> +- device-handle : phandle of the connected DRAM memory device. For more
>> +       information please refer to documentation file:
>> +       Documentation/devicetree/bindings/ddr/lpddr3.txt
>> +- devfreq-events : phandles of the PPMU events used by the controller.
>> +- samsung,syscon-clk : phandle of the clock register set used by the controller,
>> +       these registers are used for enabling a 'pause' feature and are not
>> +       exposed by clock framework but they must be used in a safe way.
>> +       The register offsets are in the driver code and specyfic for this SoC
>> +       type.
>> +
>> +Example:
>> +
>> +       ppmu_dmc0_0: ppmu@10d00000 {
>> +               compatible = "samsung,exynos-ppmu";
>> +               reg = <0x10d00000 0x2000>;
>> +               clocks = <&clock CLK_PCLK_PPMU_DREX0_0>;
>> +               clock-names = "ppmu";
>> +               events {
>> +                       ppmu_event_dmc0_0: ppmu-event3-dmc0_0 {
>> +                               event-name = "ppmu-event3-dmc0_0";
>> +                       };
>> +               };
>> +       };
>> +
>> +       dmc: memory-controller@10c20000 {
>> +               compatible = "samsung,exynos5422-dmc";
>> +               reg = <0x10c20000 0x100>, <0x10c30000 0x100>,
>> +               clocks =        <&clock CLK_FOUT_SPLL>,
> 
> I think you should not have tab after '='. Instead align consecutive
> lines with the first one.
I will change it, since there is a need of removing the duplicates below
> 
>> +                               <&clock CLK_MOUT_SCLK_SPLL>,
>> +                               <&clock CLK_FF_DOUT_SPLL2>,
>> +                               <&clock CLK_FOUT_BPLL>,
>> +                               <&clock CLK_MOUT_BPLL>,
>> +                               <&clock CLK_SCLK_BPLL>,
>> +                               <&clock CLK_MOUT_MX_MSPLL_CCORE>,
>> +                               <&clock CLK_MOUT_MX_MSPLL_CCORE_PHY>,
>> +                               <&clock CLK_MOUT_MCLK_CDREX>,
>> +                               <&clock CLK_DOUT_CLK2X_PHY0>,
>> +                               <&clock CLK_CLKM_PHY0>,
>> +                               <&clock CLK_CLKM_PHY1>;
>> +               clock-names =   "fout_spll",
>> +                               "mout_sclk_spll",
>> +                               "ff_dout_spll2",
>> +                               "fout_bpll",
>> +                               "mout_bpll",
>> +                               "sclk_bpll",
>> +                               "mout_mx_mspll_ccore",
>> +                               "mout_mx_mspll_ccore_phy",
>> +                               "mout_mclk_cdrex",
>> +                               "dout_clk2x_phy0",
>> +                               "clkm_phy0",
>> +                               "clkm_phy1";
>> +               operating-points-v2 = <&dmc_opp_table>;
>> +               devfreq-events = <&ppmu_event3_dmc0_0>, <&ppmu_event3_dmc0_1>,
>> +                               <&ppmu_event3_dmc1_0>, <&ppmu_event3_dmc1_1>;
>> +               operating-points-v2 = <&dmc_opp_table>;
> 
> Duplicated property.
Right, I will remove it and re-send it.
> 
> Beside that:
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Thank you

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
>> +               device-handle = <&samsung_K3QF2F20DB>;
>> +               vdd-supply = <&buck1_reg>;
>> +               samsung,syscon-clk = <&clock>;
>> +       };
>> --
>> 2.17.1
>>
> 
> 
