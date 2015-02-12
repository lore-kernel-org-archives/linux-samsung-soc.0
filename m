From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v3 1/8] arm64: exynos5433: Enable ARMv8 based Exynos5433
 (SoC) support
Date: Thu, 12 Feb 2015 20:03:27 +0900
Message-ID: <54DC887F.5050406@samsung.com>
References: <1423724158-23632-1-git-send-email-cw00.choi@samsung.com>
 <1423724158-23632-2-git-send-email-cw00.choi@samsung.com>
 <20150212110208.GB1028@e104818-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:64959 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752518AbbBLLD3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 06:03:29 -0500
In-reply-to: <20150212110208.GB1028@e104818-lin.cambridge.arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, jh80.chung@samsung.com, arnd@arndb.de, marc.zyngier@arm.com, will.deacon@arm.com, a.kesavan@samsung.com, inki.dae@samsung.com, sw0312.kim@samsung.com, devicetree@vger.kernel.org, kgene@kernel.org, sangbae90.lee@samsung.com, olof@lixom.net, chanho61.park@samsung.com, linux-arm-kernel@lists.infradead.org

Hi Catalin,

On 02/12/2015 08:02 PM, Catalin Marinas wrote:
> On Thu, Feb 12, 2015 at 03:55:51PM +0900, Chanwoo Choi wrote:
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 15e8e74..4fc08d1 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -153,6 +153,19 @@ config ARCH_EXYNOS
>>  	help
>>  	  This enables support for Samsung Exynos SoC family
>>  
>> +config ARCH_EXYNOS5433
>> +	bool "ARMv8 based Samsung Exynos5433"
>> +	select ARCH_EXYNOS
>> +	select ARM_AMBA
>> +	select ARM_GIC
> 
> ARM_GIC and ARM_AMBA are already selected by the top ARM64 config.
> 

OK, I'll remove two configurations.

Thanks,
Chanwoo Choi
