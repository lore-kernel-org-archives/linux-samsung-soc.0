From: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Subject: Re: [PATCH v6 5/5] arm: exynos: Add MCPM call-back functions
Date: Wed, 14 May 2014 08:14:06 +0530
Message-ID: <CAM4voamY+nM3eoJWfR=0VBDtbf6wan-2awRaALN=ym9gGC_DYg@mail.gmail.com>
References: <1399982324-27879-1-git-send-email-a.kesavan@samsung.com>
	<1399982324-27879-6-git-send-email-a.kesavan@samsung.com>
	<20140513164845.GA10210@red-moon>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:65331 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750907AbaENCoH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 22:44:07 -0400
Received: by mail-qc0-f171.google.com with SMTP id x13so1779764qcv.16
        for <linux-samsung-soc@vger.kernel.org>; Tue, 13 May 2014 19:44:07 -0700 (PDT)
In-Reply-To: <20140513164845.GA10210@red-moon>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "kgene.kim@samsung.com" <kgene.kim@samsung.com>, "abrestic@chromium.org" <abrestic@chromium.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, "inderpal.s@samsung.com" <inderpal.s@samsung.com>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>, Dave P Martin <Dave.Martin@arm.com>, "t.figa@samsung.com" <t.figa@samsung.com>

Hi Lorenzo,

On Tue, May 13, 2014 at 10:18 PM, Lorenzo Pieralisi
<lorenzo.pieralisi@arm.com> wrote:
> On Tue, May 13, 2014 at 12:58:44PM +0100, Abhilash Kesavan wrote:
>
> [...]
>
>> +static int __init exynos_mcpm_init(void)
>> +{
>> +       struct device_node *node;
>> +       int ret = 0;
>
> There is no point in initializing it to 0.
OK.
>
>> +
>> +       node = of_find_compatible_node(NULL, NULL, "samsung,exynos5420");
>> +       if (!node)
>> +               return -ENODEV;
>> +       of_node_put(node);
>> +
>> +       if (!cci_probed())
>> +               return -ENODEV;
>> +
>> +       node = of_find_compatible_node(NULL, NULL,
>> +                       "samsung,exynos4210-sysram-ns");
>> +       if (!node)
>> +               return -ENODEV;
>> +
>> +       ns_sram_base_addr = of_iomap(node, 0);
>> +       of_node_put(node);
>> +       if (!ns_sram_base_addr) {
>> +               pr_err("failed to map non-secure iRAM base address\n");
>> +               return -ENOMEM;
>> +       }
>> +
>> +       /*
>> +        * To increase the stability of KFC reset we need to program
>> +        * the PMU SPARE3 register
>> +        */
>> +       __raw_writel(EXYNOS5420_SWRESET_KFC_SEL, S5P_PMU_SPARE3);
>> +
>> +       exynos_mcpm_usage_count_init();
>> +
>> +       ret = mcpm_platform_register(&exynos_power_ops);
>> +       if (!ret)
>> +               ret = mcpm_sync_init(exynos_pm_power_up_setup);
>> +       if (ret) {
>> +               iounmap(ns_sram_base_addr);
>> +               return ret;
>> +       }
>> +
>> +       mcpm_smp_set_ops();
>> +
>> +       pr_info("Exynos MCPM support installed\n");
>> +
>> +       /*
>> +        * Future entries into the kernel can now go
>> +        * through the cluster entry vectors.
>> +        */
>> +       __raw_writel(virt_to_phys(mcpm_entry_point),
>> +                       ns_sram_base_addr + MCPM_BOOT_ADDR_OFFSET);
>> +
>
> ns_sram_base_addr must be unmapped, since it is unused after the write.
Will unmap.

Regards,
Abhilash
