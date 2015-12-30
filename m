From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [rtc-linux] Re: [PATCH v2 3/3] rtc: s5m: Make register
 configuration per S2MPS device to remove exceptions
Date: Wed, 30 Dec 2015 21:26:09 +0900
Message-ID: <CAJKOXPcf9uESKeEZS1+fSwuWRVWw=11tRNssk6oc46KQZk4yRQ@mail.gmail.com>
References: <1451450847-928-1-git-send-email-k.kozlowski@samsung.com>
	<1451450847-928-3-git-send-email-k.kozlowski@samsung.com>
	<5683AE8C.2050204@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f171.google.com ([209.85.223.171]:35487 "EHLO
	mail-io0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754704AbbL3M0K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Dec 2015 07:26:10 -0500
In-Reply-To: <5683AE8C.2050204@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Yadwinder Singh Brar <yadi.brar01@gmail.com>

2015-12-30 19:14 GMT+09:00 Alim Akhtar <alim.akhtar@samsung.com>:
>
> Hi Krzysztof,
>
> On 12/30/2015 10:17 AM, Krzysztof Kozlowski wrote:
>>
>> Before updating time and alarm the driver must set appropriate mask in
>> UDR register. For that purpose the driver uses common register
>> configuration and a lot of exceptions per device in the code. The
>> exceptions are not obvious, for example except the change in the logic
>> sometimes the fields are swapped (WUDR and AUDR between S2MPS14 and
>> S2MPS15). This leads to quite complicated code.
>>
>> Try to make it more obvious by:
>> 1. Documenting the UDR masks for devices and operations.
>> 2. Adding fields in register configuration structure for each operation
>>     (read time, write time and alarm).
>> 3. Splitting the configuration per S2MPS13, S2MPS14 and S2MPS15 thus
>>     removing exceptions for them.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
> Tested for s2mps15 pmic on exynos7-espresso board. rtc and timer works as expected.
> Fill free to add
> Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
> Tested-by: Alim Akhtar <alim.akhtar@samsung.com>
>

Thank you, I really appreciate this!

Best regards,
Krzysztof
