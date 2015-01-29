From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH v3 01/12] clk: samsung: exynos5433: Add clocks using common
 clock framework
Date: Thu, 29 Jan 2015 13:53:17 +0100
Message-ID: <54CA2D3D.3070908@samsung.com>
References: <1421821618-8627-1-git-send-email-cw00.choi@samsung.com>
 <1421821618-8627-2-git-send-email-cw00.choi@samsung.com>
 <54C287A0.50407@samsung.com>
 <CAGTfZH0nXzDgFoMF4eSW71Sey44aY9gYRzX+uWP39ut2jY_Pfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:62467 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751851AbbA2Mxe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jan 2015 07:53:34 -0500
In-reply-to: <CAGTfZH0nXzDgFoMF4eSW71Sey44aY9gYRzX+uWP39ut2jY_Pfg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: cw00.choi@samsung.com
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Kukjin Kim <kgene@kernel.org>, "pankaj.dubey@samsung.com" <pankaj.dubey@samsung.com>, "inki.dae@samsung.com" <inki.dae@samsung.com>, "chanho61.park@samsung.com" <chanho61.park@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>

Hi Chanwoo,

On 23/01/15 21:54, Chanwoo Choi wrote:
> On Sat, Jan 24, 2015 at 2:40 AM, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>> On 21/01/15 07:26, Chanwoo Choi wrote:
>>> +/* list of all parent clock list */
>>
>>> +PNAME(mout_bus_pll_user_p)   = { "fin_pll", "sclk_bus_pll", };
>> ...
>>> +
>>> +static struct samsung_mux_clock top_mux_clks[] __initdata = {
>>
>>> +     MUX(CLK_MOUT_BUS_PLL_USER, "mout_bus_pll_user", mout_bus_pll_user_p,
>>> +                     MUX_SEL_TOP1, 0, 1),
>> ...
>>> +};
>>> +
>>> +static struct samsung_div_clock top_div_clks[] __initdata = {
>> ...
>>> +     /* DIV_TOP3 */
>>> +     DIV(CLK_DIV_ACLK_IMEM_SSSX_266, "div_aclk_imem_sssx_266",
>>> +                     "mout_bus_pll_user", DIV_TOP3, 24, 3),
>>
>> Shouldn't "fin_pll" be renamed to "oscclk" ? In the documentation
>> the root clock (from XXTI input pin) seems to be referred as OSCCLK.
>> And I can't see "fin_pll" clock registered anywhere. Shouldn't there
>> be a "fixed-rate-clock" as a parent of at least CMU_TOP? e.g.
> 
> Right,
> I added "fin_pll" fixed clock in DT as following:
> When I registered "fin_pll" fixed clock, I could use "fin_pll" clock
> for exynos5433 cmu without adding additional dt node.
> 
> fin_pll: xxti {
>         compatible = "fixed-clock";
>         clock-output-names = "fin_pll";
>         #clock-cells = <0>;
> };
> 
> I'll add the example of "fin_pll" dt node to documentation for exynos5433 cmu.

OK, thanks. But I think it needs to be named "oscclk", FIN_PLL is almost
not existent in the SoC's documentation.
I'd suggest to define the root oscillator clock (XXTI/OSCCLK) as "oscclk"
in DT, rather than registering "fin_pll" fixed clock in the driver.

>> xxti: xxti {
>>         compatible = "fixed-clock";
>>         #clock-cells = <0>;
>>         clock-output-names = "oscclk";
>>         clock-frequency = <24000000>;
>> };
>>
>> &cmu_top {
>>         clocks = <&xxti>;
>> };

--
Regards,
Sylwester
