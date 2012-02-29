From: Sangwook Lee <sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
Date: Wed, 29 Feb 2012 14:21:32 +0000
Message-ID: <4F4E346C.3020400@linaro.org>
References: <1330519283-4722-1-git-send-email-sangwook.lee@linaro.org> <1330519283-4722-2-git-send-email-sangwook.lee@linaro.org> <000701ccf6e5$63bb6170$2b322450$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <000701ccf6e5$63bb6170$2b322450$%han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, gregkh-l3A5Bk7waGM@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hi Jingoo

On 29/02/12 13:23, Jingoo Han wrote:
> Hi, Sangwook.
>
> I know what you want to add.
> I'll send new patch which can enable EHCI burst mode.

Great !

Thanks
Sangwook

> This new patch will not use platform data callback and different machine directory
> file to include EHCI INSNREG00 definitions.
> Also, comment will be modified properly.
>
>
> Thank you.
>
> Best regards,
> Jingoo Han.
>
>> -----Original Message-----
>> From: Sangwook Lee [mailto:sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org]
>> Sent: Wednesday, February 29, 2012 9:41 PM
>> To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
>> Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org; gregkh-l3A5Bk7waGM@public.gmane.org; kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org;
>> jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; jy0922.shim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org; patches-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org; linaro-dev-cunTk1MwBs8s++Sfvej+rw@public.gmane.org;
>> linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org; Sangwook Lee
>> Subject: [PATCH 1/2] ARM: EXYNOS: Add EHCI AHB burst function
>>
>> Enable burst transfer from AHB for EHCI.
>> This fixes data transfer of USB Ethernet with EHCI.
>> Without this patch, scp hardly works.
>>
>> Signed-off-by: Sangwook Lee<sangwook.lee-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
>> ---
>>   arch/arm/mach-exynos/setup-usb-phy.c      |    6 ++++++
>>   arch/arm/plat-samsung/devs.c              |    2 ++
>>   arch/arm/plat-samsung/include/plat/ehci.h |   19 +++++++++++++++++++
>>   3 files changed, 27 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
>> index 41743d2..5a20460 100644
>> --- a/arch/arm/mach-exynos/setup-usb-phy.c
>> +++ b/arch/arm/mach-exynos/setup-usb-phy.c
>> @@ -18,6 +18,7 @@
>>   #include<mach/regs-usb-phy.h>
>>   #include<plat/cpu.h>
>>   #include<plat/usb-phy.h>
>> +#include<plat/ehci.h>
>>
>>   static atomic_t host_usage;
>>
>> @@ -149,3 +150,8 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
>>
>>   	return -EINVAL;
>>   }
>> +
>> +void s5p_ehci_burst_enable(struct platform_device *pdev, void __iomem *base)
>> +{
>> +	writel(EHCI_INSNREG00_ENABLE_BURST, base + EHCI_INSNREG00);
>> +}
>> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
>> index f10768e..8fd1bd3 100644
>> --- a/arch/arm/plat-samsung/devs.c
>> +++ b/arch/arm/plat-samsung/devs.c
>> @@ -1402,6 +1402,8 @@ void __init s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd)
>>   		npd->phy_init = s5p_usb_phy_init;
>>   	if (!npd->phy_exit)
>>   		npd->phy_exit = s5p_usb_phy_exit;
>> +	if (!npd->burst_enable)
>> +		npd->burst_enable = s5p_ehci_burst_enable;
>>   }
>>   #endif /* CONFIG_S5P_DEV_USB_EHCI */
>>
>> diff --git a/arch/arm/plat-samsung/include/plat/ehci.h b/arch/arm/plat-samsung/include/plat/ehci.h
>> index 5f28cae..9c866b7 100644
>> --- a/arch/arm/plat-samsung/include/plat/ehci.h
>> +++ b/arch/arm/plat-samsung/include/plat/ehci.h
>> @@ -14,8 +14,27 @@
>>   struct s5p_ehci_platdata {
>>   	int (*phy_init)(struct platform_device *pdev, int type);
>>   	int (*phy_exit)(struct platform_device *pdev, int type);
>> +	void (*burst_enable)(struct platform_device *pdev, void __iomem *base);
>>   };
>>
>>   extern void s5p_ehci_set_platdata(struct s5p_ehci_platdata *pd);
>> +extern void s5p_ehci_burst_enable(struct platform_device *pdev,
>> +	void __iomem *base);
>> +
>> +/* EHCI EXYNOS specific register */
>> +#define EHCI_INSNREG00			0x90
>> +
>> +/*
>> + * EHCI INSNREG00 Specific fields
>> + * Enable AHB master to use burst transfer from 4 to 16
>> + */
>> +#define EHCI_INSNREG00_ENABLE_INCR16	(1<<  25)
>> +#define EHCI_INSNREG00_ENABLE_INCR8	(1<<  24)
>> +#define EHCI_INSNREG00_ENABLE_INCR4	(1<<  23)
>> +/* Force AHB master to start burst transfer only for 4,8,16 alignment */
>> +#define EHCI_INSNREG00_ENABLE_INCRX_ALIGN (1<<  22)
>> +#define EHCI_INSNREG00_ENABLE_BURST	\
>> +	(EHCI_INSNREG00_ENABLE_INCR16 | EHCI_INSNREG00_ENABLE_INCR8 |	\
>> +	EHCI_INSNREG00_ENABLE_INCR4 | EHCI_INSNREG00_ENABLE_INCRX_ALIGN)
>>
>>   #endif /* __PLAT_SAMSUNG_EHCI_H */
>> --
>> 1.7.4.1
>
--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
