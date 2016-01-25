From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 10/10] ARM: plat-samsung: use to_platform_device()
Date: Mon, 25 Jan 2016 16:09:08 +0900
Message-ID: <56A5CA14.5010509@samsung.com>
References: <a554e6af3a3528c2206c94dab62b7800f96caa4b.1451221174.git.geliangtang@163.com>
 <ad91078d5cbe93341709b249a83ae81c00eaa3d4.1451221174.git.geliangtang@163.com>
 <568097E4.8010708@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:24449 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458AbcAYHJO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Jan 2016 02:09:14 -0500
In-reply-to: <568097E4.8010708@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Geliang Tang <geliangtang@163.com>, Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 28.12.2015 11:01, Krzysztof Kozlowski wrote:
> On 27.12.2015 22:17, Geliang Tang wrote:
>> Use to_platform_device() instead of open-coding it.
>>
>> Signed-off-by: Geliang Tang <geliangtang@163.com>
>> ---
>>  arch/arm/plat-samsung/adc.c | 6 ++----
>>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> Thanks!
> 
> Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Applied, thanks,
https://git.kernel.org/cgit/linux/kernel/git/krzk/linux.git/log/?h=next/soc


Best regards,
Krzysztof
