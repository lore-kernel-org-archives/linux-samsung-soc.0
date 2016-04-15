From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] clk: samsung: exynos7: Don't gate CMU_{CCORE,
 FSYS0} blocks clock
Date: Fri, 15 Apr 2016 18:07:22 +0530
Message-ID: <5710E082.2050303@samsung.com>
References: <1460608972-13878-1-git-send-email-alim.akhtar@samsung.com>
 <570F4BE0.1010102@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36703 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751436AbcDOMhJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Apr 2016 08:37:09 -0400
In-reply-to: <570F4BE0.1010102@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com
Cc: thomas.ab@samsung.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, sboyd@codeaurora.org, mturquette@baylibre.com, tomasz.figa@gmail.com



On 04/14/2016 01:20 PM, Krzysztof Kozlowski wrote:
> On 04/14/2016 06:42 AM, Alim Akhtar wrote:
>> This patch adds CLK_IS_CRITICAL flag to ACLK_CCORE_133 and ACLK_FSYS0_200
>> clocks. These clocks are critical for accessing CMU_CCORE and CMU_FSYS0
>> blocks registers. Let these clocks to be enabled all the time.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/clk/samsung/clk-exynos7.c |    5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>
Thanks Krzysztof,
Sylwester, do you have any concern here?

> Best regards,
> Krzysztof
>
>
