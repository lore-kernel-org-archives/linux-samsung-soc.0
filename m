From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Thu, 01 Mar 2012 08:54:54 +0530
Message-ID: <4F4EEC06.8010400@linaro.org>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org> <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org> <CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:58228 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753166Ab2CADZD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 22:25:03 -0500
Received: by dado14 with SMTP id o14so246352dad.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 19:25:03 -0800 (PST)
In-Reply-To: <CAJuYYwTW6rBiSJdeFYMui96t6nszjADW4t+14XakRkc=_4DbBA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Sangwook Lee <sangwook.lee@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, ben-linux@fluff.org, gregkh@suse.de, kgene.kim@samsung.com, stern@rowland.harvard.edu, jg1.han@samsung.com, jy0922.shim@samsung.com, patches@linaro.org, linaro-dev@lists.linaro.org, linux@arm.linux.org.uk

On 02/29/2012 06:31 PM, Thomas Abraham wrote:
> Hi Sangwook,
> 
> On 29 February 2012 18:11, Sangwook Lee <sangwook.lee@linaro.org> wrote:
>> Enable burst transfer from AHB for EHCI.
>> This fixes data transfer of USB Ethernet with EHCI.
>> Without this patch, scp hardly works.
>>
>> Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
>> ---
>>  arch/arm/mach-exynos/setup-usb-phy.c      |    6 ++++++
>>  arch/arm/plat-samsung/devs.c              |    2 ++
>>  arch/arm/plat-samsung/include/plat/ehci.h |   19 +++++++++++++++++++
>>  3 files changed, 27 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
>> index 41743d2..5a20460 100644
>> --- a/arch/arm/mach-exynos/setup-usb-phy.c
>> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
>> @@ -18,6 +18,7 @@
>>  #include <mach/regs-usb-phy.h>
>>  #include <plat/cpu.h>
>>  #include <plat/usb-phy.h>
>> +#include <plat/ehci.h>
>>
>>  static atomic_t host_usage;
>>
>> @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>>
>>        return -EINVAL;
>>  }
>> +
>> +void s5p_ehci_burst_enable(struct platform_device *pdev, void __iomem *base)
>> +{
>> +       writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNREG00);
>> +}
> 
> This functionality can be added in ehci-s5p itself and avoid adding a
> new platform callback in platform data. If this is specific to exynos,
> driver data could be added in ehci-s5p to indicate platforms that need
> this to be enabled.
> 
Am I right in assuming that ehci-s5p driver can also be used for
mach-s5pv210?

The related bit-fields are reserved in S5PV210. So, won't it cause any
side-effects?


> Thanks,
> Thomas.
> 
> [...]
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Tushar Behera
