From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [RFC PATCH v2 3/3] drivers: mfd: Add support for Exynos PMU driver
Date: Mon, 28 Apr 2014 21:08:21 +0900
Message-ID: <535E44B5.7030202@samsung.com>
References: <1396427085-4696-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-4-git-send-email-pankaj.dubey@samsung.com>
 <20140428112153.GT21279@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:15519 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752228AbaD1Lu0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 07:50:26 -0400
In-reply-to: <20140428112153.GT21279@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>

On 04/28/2014 08:21 PM, Lee Jones wrote:
> On Fri, 25 Apr 2014, Pankaj Dubey wrote:
>
>> This patch moves Exynos PMU driver implementation from
>> "arm/mach-exynos" to "drivers/mfd".
>> This driver is mainly used for setting misc bits of register from PMU IP
>> of Exynos SoC which will be required to configure before Suspend/Resume.
>> Currently all these settings are done in "arch/arm/mach-exynos/pmu.c" but
>> moving ahead for ARM64 based SoC support, there is a need of DT based
>> implementation of PMU driver.
>> This driver uses already existing DT binding information.
>>
>> CC: Sangbeom Kim <sbkim73@samsung.com>
>> CC: Samuel Ortiz <sameo@linux.intel.com>
>> CC: Lee Jones <lee.jones@linaro.org>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/Kconfig  |    2 +
>>   arch/arm/mach-exynos/Makefile |    2 -
>>   arch/arm/mach-exynos/pmu.c    |  521 -----------------------------------------
>>   drivers/mfd/Kconfig           |    9 +
>>   drivers/mfd/Makefile          |    1 +
>>   drivers/mfd/exynos-pmu.c      |  521 +++++++++++++++++++++++++++++++++++++++++
>>   6 files changed, 533 insertions(+), 523 deletions(-)
>>   delete mode 100644 arch/arm/mach-exynos/pmu.c
>>   create mode 100644 drivers/mfd/exynos-pmu.c
> Same with this patch, `git format-patch -M`.

OK, I will resubmit this series.



-- 
Best Regards,
Pankaj Dubey
