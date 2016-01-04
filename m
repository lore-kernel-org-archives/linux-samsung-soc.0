From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH v2 1/3] rtc: s5m: Cleanup by removing useless 'rtc' prefix
 from fields
Date: Tue, 05 Jan 2016 08:53:37 +0900
Message-ID: <568B0601.5020808@samsung.com>
References: <1451450847-928-1-git-send-email-k.kozlowski@samsung.com>
 <20160104170841.GD32724@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:46939 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752658AbcADXxn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jan 2016 18:53:43 -0500
In-reply-to: <20160104170841.GD32724@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Alim Akhtar <alim.akhtar@samsung.com>, Yadwinder Singh Brar <yadi.brar01@gmail.com>

On 05.01.2016 02:08, Alexandre Belloni wrote:
> Hi,
> 
> On 30/12/2015 at 13:47:25 +0900, Krzysztof Kozlowski wrote :
>> Remove the 'rtc' prefix from some of the fields in struct
>> s5m_rtc_reg_config because it is obvious - this is a RTC driver. No
>> functional changes.
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>>
> 
> I was going to apply those patches but they don't apply cleanly on
> rtc-next. Did I miss something?
> 

Probably that's my fault because I rebased it on linux-next. I will
rebase the patches on rtc-next and resend.

Best regards,
Krzysztof
