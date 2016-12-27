From: Jaehoon Chung <jh80.chung@samsung.com>
Subject: Re: [PATCH] PCI: exynos: refactor exynos pcie driver
Date: Tue, 27 Dec 2016 10:12:36 +0900
Message-ID: <2855bb4c-1296-dea3-56c8-e554d1fea8f9@samsung.com>
References: <CGME20161223105411epcas1p3727f726e757ec6c6d7bff04a9af40077@epcas1p3.samsung.com>
 <1482490587-13611-1-git-send-email-pankaj.dubey@samsung.com>
 <e1f37a59-b633-7b9d-cc79-dbbb00a24cda@samsung.com>
 <000201d25f86$6ee20bd0$4ca62370$@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:54689 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755822AbcL0BMk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Dec 2016 20:12:40 -0500
In-reply-to: <000201d25f86$6ee20bd0$4ca62370$@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jingoo Han <jingoohan1@gmail.com>, 'Pankaj Dubey' <pankaj.dubey@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pci@vger.kernel.org
Cc: krzk@kernel.org, kgene@kernel.org, bhelgaas@google.com, alim.akhtar@samsung.com, sanath@samsung.com, 'Niyas Ahmed S T' <niyas.ahmed@samsung.com>, 'CPGS' <cpgs@samsung.com>

Dear Jingoo,

On 12/26/2016 11:43 PM, Jingoo Han wrote:
> Jaehoon Chung wtote:
>>
>> Hi Pankaj,
>>
>> On 12/23/2016 07:56 PM, Pankaj Dubey wrote:
>>> From: Niyas Ahmed S T <niyas.ahmed@samsung.com>
>>>
>>> Currently Exynos PCIe driver is only supported for Exynos5440 SoC.
>>> This patch does refactoring of Exynos PCIe driver to extend support
>>> for other Exynos SoC.
>>>
>>> Following are the main changes done via this patch:
>>> 1) It adds separate structs for memory, clock resources.
>>> 2) It add exynos_pcie_ops struct which will allow us to support the
>>> differences in resources in different Exynos SoC.
>>
>> It's nice to me for reusing this file.
>> but after considering too many times, i decided not to use this file.
>>
>> I'm not sure what block base is..actually this pci-exynos.c is really
>> black-box.
>> (No one maintains this file, even Samsung didn't care.)
>> Who is using this?
>> If Someone can share the information about exynos5440, i can refactor
>> everything.
>> Otherwise, there are two solution..
>>
>> One is "adding the new pci-exynos.c" likes pci-exynos5433.c
> 
> As Bjorn mentioned earlier, I agree with this option.
> 
>> Other is "refactor this file" under assuming the each register's usage.
> 
> But, if possible, I prefer this option.
> I am not sure that it cannot make the code dirty.
> Maybe, you need to discuss with hardware design engineers.
> 
>>
>> I want to use the PHY generic Framework for EXYNOS PCIe.
>>
>> If you or other guys really want to use the pci-exynos.c for other exynos,
>> I will rework with PHY generic framework. Then i will resend the my
>> patches as V2.
> 
> When I submitted the pci-exynos.c, there was no PHY generic framework.
> But, currently, using PHY generic framework is mandatory, as other PCIe host
> driver did.
> I think that we should use PHY generic framework for new SoCs.
> 
>>
>> One more thing..Does anyone know what the usage of block base is?
>> Can i use that register as "syscon"?
> 
> 'Block' is very specific registers for 5440.
> Other Exynos SoCs do not use that registers.
> Actually, it is not the same with 'syscon'.
> But, you can assume 'block' as 'syscon'.

Great! I want to know it. Then i will refactor this file for all other Exynos SoCs.
And Could you check my RFC patches? Maybe i missed your email in my RFC patches.

https://lkml.org/lkml/2016/12/26/6

Best Regards,
Jaehoon Chung

> 
> Best regards,
> Jingoo Han
> 
>>
>> Best Regards,
>> Jaehoon Chung
>>
> [.....]
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-pci" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
