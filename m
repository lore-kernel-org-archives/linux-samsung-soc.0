From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: Re: [PATCH v8 02/13] clk: samsung: add new clocks for DMC for
 Exynos5422 SoC
Date: Thu, 6 Jun 2019 11:12:42 +0200
Message-ID: <d0bbb864-5803-fe5e-0673-f05654d31099@partner.samsung.com>
References: <CGME20190605165428eucas1p11849754e0d0aa8f8d445ceb0cd6c2f61@eucas1p1.samsung.com>
        <20190605165410.14606-1-l.luba@partner.samsung.com>
        <20190605165410.14606-3-l.luba@partner.samsung.com>
        <CAJKOXPfW3QUH+6+g3NXPuogNxtr_uOtWKOwbgPwBVdqn4Y7a_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJKOXPfW3QUH+6+g3NXPuogNxtr_uOtWKOwbgPwBVdqn4Y7a_Q@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?= <b.zolnierkie@samsung.com>, kgene@kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, kyungmin.park@samsung.com, Marek Szyprowski <m.szyprowski@samsung.com>, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, willy.mh.wolff.ml@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 6/6/19 10:34 AM, Krzysztof Kozlowski wrote:
> On Wed, 5 Jun 2019 at 18:54, Lukasz Luba <l.luba@partner.samsung.com> wrote:
>>
>> This patch provides support for clocks needed for Dynamic Memory Controller
>> in Exynos5422 SoC. It adds CDREX base register addresses, new DIV, MUX and
>> GATE entries.
>>
>> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos5420.c | 57 ++++++++++++++++++++++++++--
>>   1 file changed, 53 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
>> index 34cce3c5898f..eecbfcc6b3cf 100644
>> --- a/drivers/clk/samsung/clk-exynos5420.c
>> +++ b/drivers/clk/samsung/clk-exynos5420.c
>> @@ -134,6 +134,8 @@
>>   #define SRC_CDREX              0x20200
>>   #define DIV_CDREX0             0x20500
>>   #define DIV_CDREX1             0x20504
>> +#define GATE_BUS_CDREX0                0x20700
>> +#define GATE_BUS_CDREX1                0x20704
>>   #define KPLL_LOCK              0x28000
>>   #define KPLL_CON0              0x28100
>>   #define SRC_KFC                        0x28200
>> @@ -248,6 +250,8 @@ static const unsigned long exynos5x_clk_regs[] __initconst = {
>>          DIV_CDREX1,
>>          SRC_KFC,
>>          DIV_KFC0,
>> +       GATE_BUS_CDREX0,
>> +       GATE_BUS_CDREX1,
>>   };
>>
>>   static const unsigned long exynos5800_clk_regs[] __initconst = {
>> @@ -425,6 +429,9 @@ PNAME(mout_group13_5800_p)  = { "dout_osc_div", "mout_sw_aclkfl1_550_cam" };
>>   PNAME(mout_group14_5800_p)     = { "dout_aclk550_cam", "dout_sclk_sw" };
>>   PNAME(mout_group15_5800_p)     = { "dout_osc_div", "mout_sw_aclk550_cam" };
>>   PNAME(mout_group16_5800_p)     = { "dout_osc_div", "mout_mau_epll_clk" };
>> +PNAME(mout_mx_mspll_ccore_phy_p) = { "sclk_bpll", "mout_sclk_dpll",
>> +                                       "mout_sclk_mpll", "ff_dout_spll2",
>> +                                       "mout_sclk_spll", "mout_sclk_epll"};
>>
>>   /* fixed rate clocks generated outside the soc */
>>   static struct samsung_fixed_rate_clock
>> @@ -450,7 +457,7 @@ static const struct samsung_fixed_factor_clock
>>   static const struct samsung_fixed_factor_clock
>>                  exynos5800_fixed_factor_clks[] __initconst = {
>>          FFACTOR(0, "ff_dout_epll2", "mout_sclk_epll", 1, 2, 0),
>> -       FFACTOR(0, "ff_dout_spll2", "mout_sclk_spll", 1, 2, 0),
>> +       FFACTOR(CLK_FF_DOUT_SPLL2, "ff_dout_spll2", "mout_sclk_spll", 1, 2, 0),
>>   };
>>
>>   static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
>> @@ -472,11 +479,14 @@ static const struct samsung_mux_clock exynos5800_mux_clks[] __initconst = {
>>          MUX(0, "mout_aclk300_disp1", mout_group5_5800_p, SRC_TOP2, 24, 2),
>>          MUX(0, "mout_aclk300_gscl", mout_group5_5800_p, SRC_TOP2, 28, 2),
>>
>> +       MUX(CLK_MOUT_MX_MSPLL_CCORE_PHY, "mout_mx_mspll_ccore_phy",
>> +               mout_mx_mspll_ccore_phy_p, SRC_TOP7, 0, 3),
>> +
>>          MUX(CLK_MOUT_MX_MSPLL_CCORE, "mout_mx_mspll_ccore",
>> -                       mout_mx_mspll_ccore_p, SRC_TOP7, 16, 2),
>> +                       mout_mx_mspll_ccore_p, SRC_TOP7, 16, 3),
>>          MUX_F(CLK_MOUT_MAU_EPLL, "mout_mau_epll_clk", mout_mau_epll_clk_5800_p,
>>                          SRC_TOP7, 20, 2, CLK_SET_RATE_PARENT, 0),
>> -       MUX(0, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
>> +       MUX(CLK_SCLK_BPLL, "sclk_bpll", mout_bpll_p, SRC_TOP7, 24, 1),
>>          MUX(0, "mout_epll2", mout_epll2_5800_p, SRC_TOP7, 28, 1),
>>
>>          MUX(0, "mout_aclk550_cam", mout_group3_5800_p, SRC_TOP8, 16, 3),
>> @@ -648,7 +658,7 @@ static const struct samsung_mux_clock exynos5x_mux_clks[] __initconst = {
>>
>>          MUX(0, "mout_sclk_mpll", mout_mpll_p, SRC_TOP6, 0, 1),
>>          MUX(CLK_MOUT_VPLL, "mout_sclk_vpll", mout_vpll_p, SRC_TOP6, 4, 1),
>> -       MUX(0, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
>> +       MUX(CLK_MOUT_SCLK_SPLL, "mout_sclk_spll", mout_spll_p, SRC_TOP6, 8, 1),
>>          MUX(0, "mout_sclk_ipll", mout_ipll_p, SRC_TOP6, 12, 1),
>>          MUX(0, "mout_sclk_rpll", mout_rpll_p, SRC_TOP6, 16, 1),
>>          MUX_F(CLK_MOUT_EPLL, "mout_sclk_epll", mout_epll_p, SRC_TOP6, 20, 1,
>> @@ -806,8 +816,21 @@ static const struct samsung_div_clock exynos5x_div_clks[] __initconst = {
>>                          "mout_aclk400_disp1", DIV_TOP2, 4, 3),
>>
>>          /* CDREX Block */
>> +       /*
>> +        * The three clocks below are controlled using the same register and
>> +        * bits. They are put into one because there is a need of
>> +        * synchronization between the BUS and DREXs (two external memory
>> +        * interfaces).
>> +        * They are put here to show this HW assumption and for clock
>> +        * information summary completeness.
>> +        */
>>          DIV(CLK_DOUT_PCLK_CDREX, "dout_pclk_cdrex", "dout_aclk_cdrex1",
>>                          DIV_CDREX0, 28, 3),
>> +       DIV(CLK_DOUT_PCLK_DREX0, "dout_pclk_drex0", "dout_cclk_drex0",
>> +                       DIV_CDREX0, 28, 3),
>> +       DIV(CLK_DOUT_PCLK_DREX1, "dout_pclk_drex1", "dout_cclk_drex0",
>> +                       DIV_CDREX0, 28, 3),
> 
> Offline discussion with Marek and Sylwester suggested to add NOCACHE
> for the two clocks using the same bits. Otherwise I am fine:
Indeed, I have changed it and run some tests of these three clocks with:
-----------8<-------------------------
DIV_F(CLK_DOUT_PCLK_CDREX, "dout_pclk_cdrex", "dout_aclk_cdrex1",
	DIV_CDREX0, 28, 3, CLK_GET_RATE_NOCACHE, 0),
DIV_F(CLK_DOUT_PCLK_DREX0, "dout_pclk_drex0", "dout_cclk_drex0",
	DIV_CDREX0, 28, 3, CLK_GET_RATE_NOCACHE, 0),
DIV_F(CLK_DOUT_PCLK_DREX1, "dout_pclk_drex1", "dout_cclk_drex0",
	DIV_CDREX0, 28, 3, CLK_GET_RATE_NOCACHE, 0),
--------------->8---------------------
> 
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
Thank you for the review and ACK.

Regards,
Lukasz
> 
> Best regards,
> Krzysztof
> 
> 
