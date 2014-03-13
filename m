From: armdev <armdev.ftm@gmail.com>
Subject: Re: [U-Boot] ref: virt-v7.c switching to non_secure mode
Date: Thu, 13 Mar 2014 16:33:56 +0530
Message-ID: <018D06A5-B3FB-43B4-8F9B-30B0472D9051@gmail.com>
References: <99DDD4A2-0B44-4C6D-A0B5-4A18CC9EF21F@gmail.com>	<1A481609-5D5F-4E89-92D1-2C698128FA84@gmail.com> <42C5F6B1-3090-422D-A494-9B6F3769DE0A@gmail.com> <53217A6B.9090709@gmail.com> <532187F4.9040300@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f178.google.com ([209.85.192.178]:61599 "EHLO
	mail-pd0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753631AbaCMLED convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 07:04:03 -0400
Received: by mail-pd0-f178.google.com with SMTP id x10so925240pdj.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Mar 2014 04:04:02 -0700 (PDT)
In-Reply-To: <532187F4.9040300@arm.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andre Przywara <andre.przywara@arm.com>
Cc: christoffer.dall@linaro.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>


On 13-Mar-2014, at 3:57 pm, Andre Przywara <andre.przywara@arm.com> wrote:

> Hi,
> 
> sorry for the double post. Please don't use the Gmail address, this is
> just my ML catching account. I got a denial from our SMTP server
> regarding the u-boot ML recipient, so I had to send it again.

We are using google services gmail for all external mailing lists. 

> Thanks,
> Andre.
> 
> On 13/03/14 09:29, Reinhard Moselbach wrote:
>> Hi,
>> 
>> > We are able to figure out the issue. PERIPHBASE returned on ARNDALE
>> > board was 0x10500000 and adding GIC offset was creating an incorrect
>> > address.
>> 
>> please see:
>> https://github.com/apritzel/u-boot-hypmode/commit/5d9c4209907c6d67dadd033887a30c2f10efeb4c
>> 
>> 
>>> 
>>> Setting CONFIG_ARM_GIC_BASE_ADDRESS as 0x10480000 in arndale.h solves
>>> the issue.
>> 
>> Yes, I spotted that before and deliberately introduced that variable for
>> the Exynos SoCs.
>> 
>>> The u-boot code needs to be fixed for arndale right ? Please confirm
>> 
>> I could get the Arndale to boot with this above patch. But only after a
>> warm reboot:
>> 1) boot the board up, load the kernel and launch it: Linux will reboot
>> very early (before any useful output via earlyprintk)
>> 2) (back in u-boot:) load the kernel again and launch it: works
>> 
>> I got both cores in HYP mode and KVM initialized fine.
>> 
>> I lost access to my board, so if you could debug this I would be grateful.
>> 
>> Thanks,
>> Andre.
>> 
>>> 
>>> Regards
>>> Manish
>>> armdev Team @FTM
>>> 
>>> On 13-Mar-2014, at 11:20 am, armdev <armdev.ftm@gmail.com> wrote:
>>> 
>>>> Got a mail that Andre is not with linaro, Adding Christoffer Dall
>>>> 
>>>> On 13-Mar-2014, at 11:17 am, armdev <armdev.ftm@gmail.com> wrote:
>>>> 
>>>>> Hi Andrey ,
>>>>> 
>>>>> This is wrt your patch set which enabled the switch to non-sec and
>>>>> hip mode in armv7.
>>>>> We have a small piece of code which we run in hypmode using the
>>>>> bootm command on arndale board
>>>>> 
>>>>> While this code was trying to access the GICD_ISENABLR0
>>>>> (0x10481100), read was always returning 0, while as per the reset
>>>>> value it should be 0x0000ffff. Debugged more in u-boot and added
>>>>> prints.
>>>>> 
>>>>> This is the log, our observation is that in _nonsec_init() there is
>>>>> something that is causing the issue. Now It can be an issue or a gap
>>>>> in our understanding. Ideally we should be able to read the
>>>>> GICD_ISENABLR value as 0xffff.
>>>>> Can you please help us in find out how to read GIC values properly
>>>>> in hyp mode.
>>>>> 
>>>>> armv7_switch_nonsec
>>>>> cpsr =600001d3
>>>>> REGS ffff
>>>>> Before write to group regs
>>>>> cpsr =600001d3
>>>>> REGS ffff
>>>>> Before _nonsec_init()
>>>>> cpsr =600001d3
>>>>> REGS ffff
>>>>> After _nonsec_init()
>>>>> cpsr =600001d3
>>>>> REGS 0
>>>>> 
>>>>> HYP mode: successful.
>>>>> armv7_switch_hyp
>>>>> cpsr =600001da
>>>>> REGS 0
>>>>> 
>>>>> Here is the diff of our modifications. (just added prints)
>>>>> diff --git a/arch/arm/cpu/armv7/virt-v7.c
>>>>> b/arch/arm/cpu/armv7/virt-v7.c
>>>>> index 2cd604f..f38f125 100644
>>>>> --- a/arch/arm/cpu/armv7/virt-v7.c
>>>>> +++ b/arch/arm/cpu/armv7/virt-v7.c
>>>>> @@ -107,6 +107,10 @@ int armv7_switch_hyp(void)
>>>>>        printf("HYP mode: switch not successful.\n");
>>>>>        return -1;
>>>>>    }
>>>>> +    printf("HYP mode: successful.\n");
>>>>> +    printf("%s \r\n",__FUNCTION__);
>>>>> +    printf("cpsr =%x\n", read_cpsr());
>>>>> +    printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>> 
>>>>>    return 0;
>>>>> }
>>>>> @@ -116,6 +120,10 @@ int armv7_switch_nonsec(void)
>>>>>    unsigned int reg;
>>>>>    unsigned itlinesnr, i;
>>>>> 
>>>>> +    printf("%s \r\n",__FUNCTION__);
>>>>> +    printf("cpsr =%x\n", read_cpsr());
>>>>> +    printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>> +
>>>>>    /* check whether the CPU supports the security extensions */
>>>>>    reg = read_id_pfr1();
>>>>>    if ((reg & 0xF0) == 0) {
>>>>> @@ -140,6 +148,9 @@ int armv7_switch_nonsec(void)
>>>>>    /* TYPER[4:0] contains an encoded number of available interrupts */
>>>>>    itlinesnr = readl(gic_dist_addr + GICD_TYPER) & 0x1f;
>>>>> 
>>>>> +    printf("Before write to group regs \r\n");
>>>>> +    printf("cpsr =%x\n", read_cpsr());
>>>>> +    printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>>    /* set all bits in the GIC group registers to one to allow access
>>>>>     * from non-secure state. The first 32 interrupts are private per
>>>>>     * CPU and will be set later when enabling the GIC for each core
>>>>> @@ -147,11 +158,19 @@ int armv7_switch_nonsec(void)
>>>>>    for (i = 1; i <= itlinesnr; i++)
>>>>>        writel((unsigned)-1, gic_dist_addr + GICD_IGROUPRn + 4 * i);
>>>>> 
>>>>> -    smp_set_core_boot_addr((unsigned long)_smp_pen, -1);
>>>>> -    smp_kick_all_cpus();
>>>>> +    //smp_set_core_boot_addr((unsigned long)_smp_pen, -1);
>>>>> +    //smp_kick_all_cpus();
>>>>> 
>>>>> +    printf("Before _nonsec_init() \r\n");
>>>>> +    printf("cpsr =%x\n", read_cpsr());
>>>>> +    printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>>    /* call the non-sec switching code on this CPU also */
>>>>>    _nonsec_init();
>>>>> 
>>>>> +    printf("After _nonsec_init() \r\n");
>>>>> +    printf("cpsr =%x\n", read_cpsr());
>>>>> +    printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>> +
>>>>> +
>>>>>    return 0;
>>>>> }
>>>>> diff --git a/include/configs/arndale.h b/include/configs/arndale.h
>>>>> index 515facf..53a1212 100644
>>>>> --- a/include/configs/arndale.h
>>>>> +++ b/include/configs/arndale.h
>>>>> @@ -62,7 +62,6 @@
>>>>> /* select serial console configuration */
>>>>> #define CONFIG_BAUDRATE            115200
>>>>> #define EXYNOS5_DEFAULT_UART_OFFSET    0x010000
>>>>> -#define CONFIG_SILENT_CONSOLE
>>>>> 
>>>>> /* Console configuration */
>>>>> #define CONFIG_CONSOLE_MUX
>>>>> @@ -249,4 +248,7 @@
>>>>> /* Enable Time Command */
>>>>> #define CONFIG_CMD_TIME
>>>>> 
>>>>> +/* Enable jump to hypervisor */
>>>>> +#define CONFIG_ARMV7_VIRT
>>>>> +#define CONFIG_SMP_PEN_ADDR 0x0
>>>>> #endif    /* __CONFIG_H */
>>>>> 
>>>> 
>>> 
>>> _______________________________________________
>>> U-Boot mailing list
>>> U-Boot@lists.denx.de
>>> http://lists.denx.de/mailman/listinfo/u-boot
>>> 
> 
> -- IMPORTANT NOTICE: The contents of this email and any attachments are confidential and may also be privileged. If you are not the intended recipient, please notify the sender immediately and do not disclose the contents to any other person, use it for any purpose, or store or copy the information in any medium.  Thank you.
> 
> ARM Limited, Registered office 110 Fulbourn Road, Cambridge CB1 9NJ, Registered in England & Wales, Company No:  2557590
> ARM Holdings plc, Registered office 110 Fulbourn Road, Cambridge CB1 9NJ, Registered in England & Wales, Company No:  2548782
> 
