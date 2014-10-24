From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCHv2 1/2] clk: samsung: exynos4415: Add clocks using common
 clock framework
Date: Fri, 24 Oct 2014 16:17:13 +0200
Message-ID: <544A5F69.7080406@samsung.com>
References: <1414148828-23719-1-git-send-email-cw00.choi@samsung.com>
 <1414148828-23719-2-git-send-email-cw00.choi@samsung.com>
 <544A402F.1010207@samsung.com> <544A5D2D.2040501@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32124 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755488AbaJXORb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Oct 2014 10:17:31 -0400
In-reply-to: <544A5D2D.2040501@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: tomasz.figa@gmail.com, kgene.kim@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Chanwoo,

On 24/10/14 16:07, Chanwoo Choi wrote:
[...]
>> How about prefixing the table names below with "exynos4415", rather than
>> "samsung" ?
> 
> 'struct samsung_fixed_factor_clock' is common for Exynos SoC.
> 
> Do you means that add 'exynos4415' prefix as following:
> - fixed_factor_clks -> exynos4415_fixed_factor_clks

Yes, it makes sense IMHO, even though those symbols are static.
It's done like that in other SoC drivers, e.g. exynos3250.

>>> +static struct samsung_fixed_factor_clock fixed_factor_clks[] __initdata = {
>>
>>> +};
>>> +
>>> +static struct samsung_fixed_rate_clock fixed_rate_clks[] __initdata = {
>>> +	FRATE(CLK_SCLK_HDMIPHY, "sclk_hdmiphy", NULL, CLK_IS_ROOT, 27000000),
>>> +};
>>> +
>>> +static struct samsung_mux_clock mux_clks[] __initdata = {
>>
>>> +};
>>> +
>>> +static struct samsung_div_clock div_clks[] __initdata = {
>>
>>> +};
>>> +
>>> +static struct samsung_gate_clock gate_clks[] __initdata = {
> 
> Do you want to change structure naming as following?
> fixed_factor_clks -> exynos4415_fixed_factor_clks
> fixed_rate_clks -> exynos4415_fixed_rate_clks
> mux_clks -> exynos4415_mux_clks
> div_clks -> exynos4415_div_clks
> gate_clks -> exynos4415_gate_clks

Yes, please.

-- 
Thanks,
Sylwester
