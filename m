From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] clk/samsung fixes for 4.1
Date: Mon, 04 May 2015 12:19:18 +0200
Message-ID: <554747A6.7030605@samsung.com>
References: <554105AC.8060800@samsung.com> <20150429231820.16410.26690@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48565 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344AbbEDKTo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 May 2015 06:19:44 -0400
In-reply-to: <20150429231820.16410.26690@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

Hello Mike,

On 30/04/15 01:18, Michael Turquette wrote:
> Quoting Sylwester Nawrocki (2015-04-29 09:24:12)

>> ----------------------------------------------------------------
>> clk/samsung fixes for 4.1
>>
>> Fixes of clk definitions in recently added clock controller driver for
>> exynos5433 SoC and enhancements for DVFS, proper system sleep and secure
>> monitor calls support in this SoC. The exynos5420 patch fixes a serious
>> system sleep regression introduced in 3.19.
>>
>> ----------------------------------------------------------------

>>       clk: exynos5433: Add CLK_SET_RATE_PARENT to support DVFS for big.LITTLE core
> 
> Above patch doesn't look like a fix for an introduced regression.

>> Hyungwon Hwang (1):
>>       clk: exynos5433: Add DIV_CPIF to the list of stored registers on suspend
> 
> Above patch doesn't look like a fix for an introduced regression.

>>       clk: exynos5433: Add CLK_IGNORE_UNUSED flag to clocks for SMC
> 
> Above patch doesn't look like a fix for an introduced regression.

>> Joonyoung Shim (1):
>>       clk: exynos5433: Add clock flag to support the DVFS of GPU
> 
> Above patch doesn't look like a fix for an introduced regression.

Apologies for mixing them up, I'm going to resend above 4 patches
for 4.2. The DVFS related patches are indeed not critical, I thought
especially the second and third patch above are good for early -rc,
since they fix bugs in a driver which was first added in 4.1-rc1.
Anyway, I'll resend the dropped patches for 4.2, thanks for queueing
the remaining ones.

-- 
Regards,
Sylwester
