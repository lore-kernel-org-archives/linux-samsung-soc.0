From: armdev <armdev.ftm@gmail.com>
Subject: Re: ref: virt-v7.c switching to non_secure mode
Date: Thu, 13 Mar 2014 16:29:19 +0530
Message-ID: <457DF3EC-7DAE-4AC1-94A1-3EDD8BD9A2AD@gmail.com>
References: <99DDD4A2-0B44-4C6D-A0B5-4A18CC9EF21F@gmail.com>	<1A481609-5D5F-4E89-92D1-2C698128FA84@gmail.com>
	<42C5F6B1-3090-422D-A494-9B6F3769DE0A@gmail.com>
	<53217D66.6020901@arm.com>
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
Content-Type: multipart/mixed; boundary="===============1189457821=="
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <53217D66.6020901@arm.com>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: Andre Przywara <andre.przywara@arm.com>
Cc: u-boot@lists.denx.de, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org


--===============1189457821==
Content-Type: multipart/alternative; boundary="Apple-Mail=_A668A1B1-AE38-4BB9-95F1-B483AE4DC791"


--Apple-Mail=_A668A1B1-AE38-4BB9-95F1-B483AE4DC791
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252

Dear Andre,

Thanks for replying.=20


On 13-Mar-2014, at 3:11 pm, Andre Przywara <andre.przywara@arm.com> =
wrote:

> Hi,
>=20
>> We are able to figure out the issue. PERIPHBASE returned on ARNDALE
>> board was 0x10500000 and adding GIC offset was creating an incorrect
>> address.
>=20
> please see:
> =
https://github.com/apritzel/u-boot-hypmode/commit/5d9c4209907c6d67dadd0338=
87a30c2f10efeb4c
>=20
>>=20
>> Setting CONFIG_ARM_GIC_BASE_ADDRESS as 0x10480000 in arndale.h solves =
the issue.
>=20
> Yes, I spotted that before and deliberately introduced that variable =
for
> the Exynos SoCs.

So it turns out that this is the only way.

>=20
>> The u-boot code needs to be fixed for arndale right ? Please confirm
>=20
> I could get the Arndale to boot with this above patch. But only after =
a
> warm reboot:
Can you please describe more on the warm reboot problem. I am not facing =
anything like it.

> 1) boot the board up, load the kernel and launch it: Linux will reboot
> very early (before any useful output via earlyprintk)
> 2) (back in u-boot:) load the kernel again and launch it: works
>=20
> I got both cores in HYP mode and KVM initialized fine.
>=20
> I lost access to my board, so if you could debug this I would be =
grateful.
I have 3 boards of exynos family 5250 /5410 /5420. I will try on each =
and let you know. If you have anything specific do let me know=20

> Thanks,
> Andre.
>=20
>>=20
>> Regards
>> Manish
>> armdev Team @FTM
>>=20
>> On 13-Mar-2014, at 11:20 am, armdev <armdev.ftm@gmail.com> wrote:
>>=20
>>> Got a mail that Andre is not with linaro, Adding Christoffer Dall
>>>=20
>>> On 13-Mar-2014, at 11:17 am, armdev <armdev.ftm@gmail.com> wrote:
>>>=20
>>>> Hi Andrey ,
>>>>=20
>>>> This is wrt your patch set which enabled the switch to non-sec and =
hip mode in armv7.
>>>> We have a small piece of code which we run in hypmode using the =
bootm command on arndale board
>>>>=20
>>>> While this code was trying to access the GICD_ISENABLR0 =
(0x10481100), read was always returning 0, while as per the reset value =
it should be 0x0000ffff. Debugged more in u-boot and added prints.
>>>>=20
>>>> This is the log, our observation is that in _nonsec_init() there is =
something that is causing the issue. Now It can be an issue or a gap in =
our understanding. Ideally we should be able to read the GICD_ISENABLR =
value as 0xffff.
>>>> Can you please help us in find out how to read GIC values properly =
in hyp mode.
>>>>=20
>>>> armv7_switch_nonsec
>>>> cpsr =3D600001d3
>>>> REGS ffff
>>>> Before write to group regs
>>>> cpsr =3D600001d3
>>>> REGS ffff
>>>> Before _nonsec_init()
>>>> cpsr =3D600001d3
>>>> REGS ffff
>>>> After _nonsec_init()
>>>> cpsr =3D600001d3
>>>> REGS 0
>>>>=20
>>>> HYP mode: successful.
>>>> armv7_switch_hyp
>>>> cpsr =3D600001da
>>>> REGS 0
>>>>=20
>>>> Here is the diff of our modifications. (just added prints)
>>>> diff --git a/arch/arm/cpu/armv7/virt-v7.c =
b/arch/arm/cpu/armv7/virt-v7.c
>>>> index 2cd604f..f38f125 100644
>>>> --- a/arch/arm/cpu/armv7/virt-v7.c
>>>> +++ b/arch/arm/cpu/armv7/virt-v7.c
>>>> @@ -107,6 +107,10 @@ int armv7_switch_hyp(void)
>>>>            printf("HYP mode: switch not successful.\n");
>>>>            return -1;
>>>>    }
>>>> +   printf("HYP mode: successful.\n");
>>>> +   printf("%s \r\n",__FUNCTION__);
>>>> +   printf("cpsr =3D%x\n", read_cpsr());
>>>> +   printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>=20
>>>>    return 0;
>>>> }
>>>> @@ -116,6 +120,10 @@ int armv7_switch_nonsec(void)
>>>>    unsigned int reg;
>>>>    unsigned itlinesnr, i;
>>>>=20
>>>> +   printf("%s \r\n",__FUNCTION__);
>>>> +   printf("cpsr =3D%x\n", read_cpsr());
>>>> +   printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>> +
>>>>    /* check whether the CPU supports the security extensions */
>>>>    reg =3D read_id_pfr1();
>>>>    if ((reg & 0xF0) =3D=3D 0) {
>>>> @@ -140,6 +148,9 @@ int armv7_switch_nonsec(void)
>>>>    /* TYPER[4:0] contains an encoded number of available interrupts =
*/
>>>>    itlinesnr =3D readl(gic_dist_addr + GICD_TYPER) & 0x1f;
>>>>=20
>>>> +   printf("Before write to group regs \r\n");
>>>> +   printf("cpsr =3D%x\n", read_cpsr());
>>>> +   printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>    /* set all bits in the GIC group registers to one to allow =
access
>>>>     * from non-secure state. The first 32 interrupts are private =
per
>>>>     * CPU and will be set later when enabling the GIC for each core
>>>> @@ -147,11 +158,19 @@ int armv7_switch_nonsec(void)
>>>>    for (i =3D 1; i <=3D itlinesnr; i++)
>>>>            writel((unsigned)-1, gic_dist_addr + GICD_IGROUPRn + 4 * =
i);
>>>>=20
>>>> -   smp_set_core_boot_addr((unsigned long)_smp_pen, -1);
>>>> -   smp_kick_all_cpus();
>>>> +   //smp_set_core_boot_addr((unsigned long)_smp_pen, -1);
>>>> +   //smp_kick_all_cpus();
>>>>=20
>>>> +   printf("Before _nonsec_init() \r\n");
>>>> +   printf("cpsr =3D%x\n", read_cpsr());
>>>> +   printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>>    /* call the non-sec switching code on this CPU also */
>>>>    _nonsec_init();
>>>>=20
>>>> +   printf("After _nonsec_init() \r\n");
>>>> +   printf("cpsr =3D%x\n", read_cpsr());
>>>> +   printf("REGS %x \n", *(uint32_t*)0x10481100);
>>>> +
>>>> +
>>>>    return 0;
>>>> }
>>>> diff --git a/include/configs/arndale.h b/include/configs/arndale.h
>>>> index 515facf..53a1212 100644
>>>> --- a/include/configs/arndale.h
>>>> +++ b/include/configs/arndale.h
>>>> @@ -62,7 +62,6 @@
>>>> /* select serial console configuration */
>>>> #define CONFIG_BAUDRATE                     115200
>>>> #define EXYNOS5_DEFAULT_UART_OFFSET 0x010000
>>>> -#define CONFIG_SILENT_CONSOLE
>>>>=20
>>>> /* Console configuration */
>>>> #define CONFIG_CONSOLE_MUX
>>>> @@ -249,4 +248,7 @@
>>>> /* Enable Time Command */
>>>> #define CONFIG_CMD_TIME
>>>>=20
>>>> +/* Enable jump to hypervisor */
>>>> +#define CONFIG_ARMV7_VIRT
>>>> +#define CONFIG_SMP_PEN_ADDR 0x0
>>>> #endif      /* __CONFIG_H */
>>>>=20
>>>=20
>>=20
>> _______________________________________________
>> U-Boot mailing list
>> U-Boot@lists.denx.de
>> http://lists.denx.de/mailman/listinfo/u-boot
>>=20
>=20
> -- IMPORTANT NOTICE: The contents of this email and any attachments =
are confidential and may also be privileged. If you are not the intended =
recipient, please notify the sender immediately and do not disclose the =
contents to any other person, use it for any purpose, or store or copy =
the information in any medium.  Thank you.
>=20
> ARM Limited, Registered office 110 Fulbourn Road, Cambridge CB1 9NJ, =
Registered in England & Wales, Company No:  2557590
> ARM Holdings plc, Registered office 110 Fulbourn Road, Cambridge CB1 =
9NJ, Registered in England & Wales, Company No:  2548782


--Apple-Mail=_A668A1B1-AE38-4BB9-95F1-B483AE4DC791--

--===============1189457821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
U-Boot mailing list
U-Boot@lists.denx.de
http://lists.denx.de/mailman/listinfo/u-boot

--===============1189457821==--
