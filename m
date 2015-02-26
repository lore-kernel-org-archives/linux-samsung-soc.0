From: Kukjin Kim <kgene@kernel.org>
Subject: Re: [PATCH] ARM: EXYNOS: Don't use LDREX and STREX after disabling
 cache coherency
Date: Fri, 27 Feb 2015 05:52:52 +0900
Message-ID: <54EF87A4.6090609@kernel.org>
References: <1424093802-5488-1-git-send-email-k.kozlowski@samsung.com> <54E3BFB3.5030801@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59954 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754297AbbBZUw7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 Feb 2015 15:52:59 -0500
In-Reply-To: <54E3BFB3.5030801@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, stable@vger.kernel.org

On 02/18/15 07:24, Stephen Boyd wrote:
> On 02/16/15 05:36, Krzysztof Kozlowski wrote:
>> During CPU shutdown the exynos_cpu_power_down() is called after
>> disabling cache coherency and it uses LDREX and STREX instructions (by
>> calling of_machine_is_compatible() -> kobject_get() -> kref_get()).
>>
>> The LDREX and STREX should not be used after disabling the cache
>> coherency so just use soc_is_exynos().
>>
>> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>> Fixes: adc548d77c22 ("ARM: EXYNOS: Use MCPM call-backs to support S2R on exynos5420")
>> Cc: <stable@vger.kernel.org>
>> Reported-by: Stephen Boyd <sboyd@codeaurora.org>
>> ---
> 
> Looks good to me.
> 
> Reviewed-by: Stephen Boyd <sboyd@codeaurora.org>
> 
Thanks for this fix, applied.

- Kukjin
