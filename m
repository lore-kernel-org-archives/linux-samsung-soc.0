From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 2/3] ARM: SAMSUNG: Consolidate uncompress subroutine
Date: Mon, 17 Jun 2013 06:03:44 +0900
Message-ID: <51BE2830.2070702@samsung.com>
References: <1370319552-17694-1-git-send-email-tushar.behera@linaro.org> <1370319552-17694-3-git-send-email-tushar.behera@linaro.org> <51B960D6.7080901@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f52.google.com ([209.85.160.52]:60755 "EHLO
	mail-pb0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752602Ab3FPVDt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 16 Jun 2013 17:03:49 -0400
In-Reply-To: <51B960D6.7080901@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, arnd@arndb.de, olof@lixom.net, patches@linaro.org

On 06/13/13 15:04, Tushar Behera wrote:
> On 06/04/2013 09:49 AM, Tushar Behera wrote:
>> For mach-exynos, uart_base is a pointer and the value is calculated
>> in the machine folder. For other machines, uart_base is defined as
>> a macro in platform directory. For symmetry, the uart_base macro
>> definition is removed and the uart_base calculation is moved to
>> specific machine folders.
>>
>> This would help us consolidating uncompress subroutine for s5p64x0.
>>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>> Changes for v2:
>> * Remove ifdef's while calculating uart_base value.
>>
>
> Kukjin,
>
> Would you please queue this up for 3.11?
>
Sure, applied this and 3rd for 3.11.

Thanks,
- Kukjin
