From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH] arm64: defconfig: Enable s2mps11 regulator clk and s3c rtc
 driver
Date: Fri, 08 Jul 2016 16:59:29 +0530
Message-ID: <577F8E99.80301@samsung.com>
References: <1467713211-16014-1-git-send-email-alim.akhtar@samsung.com>
 <577C9F2C.4040509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:45247 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754344AbcGHL3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Jul 2016 07:29:55 -0400
In-reply-to: <577C9F2C.4040509@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com



On 07/06/2016 11:33 AM, Krzysztof Kozlowski wrote:
> On 07/05/2016 12:06 PM, Alim Akhtar wrote:
>> The s3c rtc controller on exynos7 platform uses rtc source clock
>> from s2mps11 pmic. This patch enables the required bits to make
>> rtc work on exynos7-espresso board.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   arch/arm64/configs/defconfig |    2 ++
>>   1 file changed, 2 insertions(+)
>
> Thanks, applied, with changed commit title and message. Any more arm64
> defconfig changes coming soon?
>
Thanks Krzysztof,
May be we should enable CONFIG_S3C2410_WATCHDOG as well.
All the bits to enable this is there, even in exynos7 dts watchdog is 
enabled.
Let me know if you want me to send a patch or you can add in my last 
patch related with config changes, if this is not very difficult for you 
to handle.

> Best regards,
> Krzysztof
>
>
