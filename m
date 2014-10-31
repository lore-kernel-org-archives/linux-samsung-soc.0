From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCHv3 0/2] clk: samsung: Add clock controller driver for
 Exynos4415 SoC
Date: Fri, 31 Oct 2014 11:03:12 +0100
Message-ID: <54535E60.4080802@samsung.com>
References: <1414372318-594-1-git-send-email-cw00.choi@samsung.com>
 <544E20E3.5030609@samsung.com> <02dd01cff265$0a846060$1f8d2120$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47493 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756003AbaJaKDR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Oct 2014 06:03:17 -0400
In-reply-to: <02dd01cff265$0a846060$1f8d2120$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Chanwoo Choi' <cw00.choi@samsung.com>, tomasz.figa@gmail.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, inki.dae@samsung.com, geunsik.lim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

On 28/10/14 05:09, Kukjin Kim wrote:
> Sylwester Nawrocki wrote:
>>
>> On 27/10/14 02:11, Chanwoo Choi wrote:
>>> Chanwoo Choi (2):
>>>   clk: samsung: exynos4415: Add clocks using common clock framework
>>>   clk: samsung: Document binding for Exynos4415 clock controller
[...]
> 
> Can you please provide a topic branch for clk-exynos4415? Because exynos4415 dt
> file needs inclusion of following header files.
> 
> +#include <dt-bindings/clock/exynos4415.h>
> +#include <dt-bindings/clock/exynos-audss-clk.h>

Hi Kukjin,

AFAICS there is more clk patches that will be a dependency for the dts
changes, for instance recent exynos7 clock controller driver addition.
Unfortunately the patchset is written so almost every patch touches
header file at include/dt-bindings/clock/.

I'm inclined to send the collected exynos4415 and exynos7 patches to
Mike in a pull request and then he could make a topic branch which could
then be pulled as a dependency for dts.

Alternatively you could use my branch which can be found at:
git://linuxtv.org/snawrocki/samsung.git for-v3.19-exynos-clk

What would be your preference, Mike ?

-- 
Regards,
Sylwester
