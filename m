From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH] ARM: exynos4: fix secondary CPU boot
Date: Wed, 15 Jun 2011 10:53:31 +0100
Message-ID: <4DF8811B.9090506@arm.com>
References: <1305899190-16732-1-git-send-email-marc.zyngier@arm.com>	<4DDD3C57.6020705@samsung.com>	<1306346645.27474.182.camel@e102391-lin.cambridge.arm.com>	<4DDD531A.50604@samsung.com>	<1306422710.27474.237.camel@e102391-lin.cambridge.arm.com>	<BANLkTi=fjq5ki8BGDhQxHVD3u-s7W-C1rw@mail.gmail.com>	<1307003689.31098.6.camel@e102391-lin.cambridge.arm.com>	<BANLkTi=mvCgi_6Y57aVjpwrMhL58zPcUHw@mail.gmail.com>	<1307004853.31098.12.camel@e102391-lin.cambridge.arm.com>	<BANLkTi=hEBKTpEq6daMyEdLo63aet52Gbg@mail.gmail.com> <BANLkTinov=XKF5dH9EOpMj=oQC7oyKGKfA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------030601050903020505020403"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from service87.mimecast.com ([94.185.240.25]:57258 "HELO
	service87.mimecast.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1754167Ab1FOJxe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jun 2011 05:53:34 -0400
In-Reply-To: <BANLkTinov=XKF5dH9EOpMj=oQC7oyKGKfA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Angus Ainslie <angus.ainslie@linaro.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

This is a multi-part message in MIME format.
--------------030601050903020505020403
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

On 15/06/11 01:52, Kyungmin Park wrote:
> On Wed, Jun 15, 2011 at 7:26 AM, Angus Ainslie <angus.ainslie@linaro.org>=
 wrote:
>> On Thu, Jun 2, 2011 at 2:54 AM, Marc Zyngier <Marc.Zyngier@arm.com> wrot=
e:
>>> On Thu, 2011-06-02 at 17:39 +0900, Kyungmin Park wrote:
>>>> On Thu, Jun 2, 2011 at 5:34 PM, Marc Zyngier <Marc.Zyngier@arm.com> wr=
ote:
>>>>> On Thu, 2011-06-02 at 16:01 +0900, Kyungmin Park wrote:
>>>>>> On Fri, May 27, 2011 at 12:11 AM, Marc Zyngier <Marc.Zyngier@arm.com=
> wrote:
>>>>>>> On Wed, 2011-05-25 at 12:06 -0700, Kukjin Kim wrote:
>>>>>>>> On 05/25/11 11:04, Marc Zyngier wrote:
>>>>>>>>> On Wed, 2011-05-25 at 10:28 -0700, Kukjin Kim wrote:
>>>>>>>>>> On 05/20/11 06:46, Marc Zyngier wrote:
>>>>>>>>
>>>>>>>> (snip)
>>>>>>>>
>>>>>>>>> So that address has changed between two SoC revisions? That's
>>>>>>>>> unfortunate, to say the least. I'm most probably using an early r=
evision
>>>>>>>>> of the hardware (EVT0?), as it doesn't even support MCT.
>>>>>>>>>
>>>>>>>> I'm afraid :( and I agree secondary CPU should work on all of
>>>>>>>> Exynos4210. But I'm still think about the method...
>>>>>>>>
>>>>>>>>> What about the following patch?
>>>>>>>>>
>>>>>>>> Uhm...this is really hack but I'd like to use another normal way..=
.?
>>>>>>>
>>>>>>> Oh, no question about the hack status. The trouble is, unless there=
 is a
>>>>>>> sure way to tell which SoC revision we're running on, there's littl=
e
>>>>>>> else we can do than poke both locations and pray.
>>>>>>>
>>>>>>> Is there such a way to identify the SoC revision?
>>>>>>
>>>>>> It's also required for OneNAND. as you know C210 EVT0 OneNAND DMA ha=
s
>>>>>> bug and need to workaround.
>>>>>>
>>>>>> platform codes should provide the these function. please see the OMA=
P
>>>>>> codes. how to handle it.
>>>>>
>>>>> So we know there's a need beyond the wish to see the second core up a=
nd
>>>>> running on my board.
>>>>>
>>>>> Now what is the proper method to detect the revision of the SOC?
>>>>> Handling it is no problem, once we have the information. Unfortunatel=
y
>>>>> the documentation I have is less than helpful on that subject.
>>>>
>>>> It can be distinguished by chip id. but there's no code to handle this=
 one.
>>>>
>>>> 0x4320 0200 EVT0
>>>> 0x4321 0210 EVT1
>>>> 0x4321 0211 EVT2
>>>
>>> Apparently, the low 8 bits can be overloaded by the efuse. Which makes
>>> telling EVT1 from EVT2 unreliable.
>>>
>>> But at least this is a start. I'll see if I can come up with something
>>> minimal enough to be merged as a fix.
>>>
>>> Thanks,
>>>
>>>        M.
>>> --
>>> Reality is an implementation detail.
>>>
>>>
>>> --
>>> To unsubscribe from this list: send the line "unsubscribe linux-samsung=
-soc" in
>>> the body of a message to majordomo@vger.kernel.org
>>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>>
>>
>> Would something like this work instead ? It seems to work on EVT0 but
>> I haven't had a chance to test on EVT1.
>>
>>
>> From a4c1b643596599df9d79776c9b94f2536661a4c9 Mon Sep 17 00:00:00 2001
>> From: Angus Ainslie <angus.ainslie@linaro.org>
>> Date: Tue, 14 Jun 2011 16:13:35 -0600
>> Subject: [PATCH] ARM: exynos4: fix secondary CPU boot on early SoC revis=
ions
>>
>> It appears that the system-wide flags register that used to be at
>> 0x02025000 on the first revision of Exynos4 has moved to 0x02020000.
>>
>> The kernel has been updated accordingly, but this unfortunately leaves
>> early boards without SMP support (the secondary CPU spins endlessly
>> in BL0 waiting for an address to be written at that memory location).
>>
>> Use the CPU id to decide whether we are running on EVT0 and use the
>> old location in that case.
>=20
> Hi Angus,
>=20
> Now this information is also required for other device drivers such as On=
eNAND.
> So can you make a generic function at common place such as plat-s5p?
> I mean we need a generic helper function for handling the EVT version
> at samsung platform.

Here's what I have in my current tree. I just added a s3c_get_chip_id()
helper, and used that in the secondary boot path. The same function
could be used for OneNAND and MCT.

Cheers,

=09M.

--=20
Jazz is not dead. It just smells funny...
--------------030601050903020505020403
Content-Type: text/plain;
	name=0001-ARM-exynos4-fix-secondary-CPU-boot-on-early-SoC-revi.txt
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline;
 filename*0="0001-ARM-exynos4-fix-secondary-CPU-boot-on-early-SoC-revi.tx";
 filename*1="t"

>From a24392183d396fab790557b0efb35e840c9e8a81 Mon Sep 17 00:00:00 2001
From: Marc Zyngier <marc.zyngier@arm.com>
Date: Fri, 20 May 2011 14:38:25 +0100
Subject: [PATCH] ARM: exynos4: fix secondary CPU boot on early SoC revision=
s

It appears that the system-wide flags register that used to be at
0x02025000 on the first revision of Exynos4 has moved to 0x02020000.

The kernel has been updated accordingly, but this unfortunately leaves
early boards without SMP support (the secondary CPU spins endlessly
in BL0 waiting for an address to be written at that memory location).

Solve the problem by providing an s3c_get_chip_id() function, common
to all s3c/s5p implementations, and test the result on the secondary boot
path.

Revision table, as provided by Kyungmin Park <kmpark@infradead.org>:
0x4320 0200 EVT0
0x4321 0210 EVT1
0x4321 0211 EVT2

The last 8 bits can be overrided by efuses, so only bits [16:19] are
used to identify the revision.

Tested on a vintage SMDK-v310.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Cc: Kyungmin Park <kmpark@infradead.org>
Signed-off-by: Marc Zyngier <marc.zyngier@arm.com>
---
 arch/arm/mach-exynos4/include/mach/map.h |    1 +
 arch/arm/mach-exynos4/platsmp.c          |   22 +++++++++++++++++++++-
 arch/arm/plat-samsung/include/plat/cpu.h |    2 ++
 arch/arm/plat-samsung/init.c             |    8 ++++++++
 4 files changed, 32 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos4/include/mach/map.h b/arch/arm/mach-exyno=
s4/include/mach/map.h
index 57d8074..da08f5c 100644
--- a/arch/arm/mach-exynos4/include/mach/map.h
+++ b/arch/arm/mach-exynos4/include/mach/map.h
@@ -24,6 +24,7 @@
 #include <plat/map-s5p.h>
=20
 #define EXYNOS4_PA_SYSRAM=09=090x02020000
+#define EXYNOS4_PA_SYSRAM_EVT0=09=090x02025000
=20
 #define EXYNOS4_PA_FIMC0=09=090x11800000
 #define EXYNOS4_PA_FIMC1=09=090x11810000
diff --git a/arch/arm/mach-exynos4/platsmp.c b/arch/arm/mach-exynos4/platsm=
p.c
index c5e65a0..086d1e3 100644
--- a/arch/arm/mach-exynos4/platsmp.c
+++ b/arch/arm/mach-exynos4/platsmp.c
@@ -26,6 +26,8 @@
 #include <asm/smp_scu.h>
 #include <asm/unified.h>
=20
+#include <plat/cpu.h>
+
 #include <mach/hardware.h>
 #include <mach/regs-clock.h>
=20
@@ -170,6 +172,24 @@ void __init platform_smp_prepare_cpus(unsigned int max=
_cpus)
 =09 * system-wide flags register. The boot monitor waits
 =09 * until it receives a soft interrupt, and then the
 =09 * secondary CPU branches to this address.
+=09 *
+=09 * EVT0 has the system-wide flags register at a different
+=09 * address, hence the following hackery...
 =09 */
-=09__raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)), S5P_VA_SYSR=
AM);
+=09if (s3c_get_chip_id() & 0xF0000UL)
+=09=09__raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)),
+=09=09=09     S5P_VA_SYSRAM);
+=09else {
+=09=09void __iomem *sysram_evt0;
+
+=09=09sysram_evt0 =3D ioremap(EXYNOS4_PA_SYSRAM_EVT0, SZ_4K);
+=09=09if (!sysram_evt0) {
+=09=09=09pr_err("Unable to remap EXYNOS4_PA_SYSRAM_EVT0\n");
+=09=09=09return;
+=09=09}
+=09=09__raw_writel(BSYM(virt_to_phys(exynos4_secondary_startup)),
+=09=09=09     sysram_evt0);
+=09=09iounmap(sysram_evt0);
+=09}
+
 }
diff --git a/arch/arm/plat-samsung/include/plat/cpu.h b/arch/arm/plat-samsu=
ng/include/plat/cpu.h
index c0a5741..41573cc 100644
--- a/arch/arm/plat-samsung/include/plat/cpu.h
+++ b/arch/arm/plat-samsung/include/plat/cpu.h
@@ -44,6 +44,8 @@ struct cpu_table {
 extern void s3c_init_cpu(unsigned long idcode,
 =09=09=09 struct cpu_table *cpus, unsigned int cputab_size);
=20
+extern unsigned long s3c_get_chip_id(void);
+
 /* core initialisation functions */
=20
 extern void s3c24xx_init_irq(void);
diff --git a/arch/arm/plat-samsung/init.c b/arch/arm/plat-samsung/init.c
index 79d10fc..320b88f 100644
--- a/arch/arm/plat-samsung/init.c
+++ b/arch/arm/plat-samsung/init.c
@@ -30,6 +30,7 @@
 #include <plat/regs-serial.h>
=20
 static struct cpu_table *cpu;
+static unsigned long s3c_chip_id;
=20
 static struct cpu_table * __init s3c_lookup_cpu(unsigned long idcode,
 =09=09=09=09=09=09struct cpu_table *tab,
@@ -60,6 +61,8 @@ void __init s3c_init_cpu(unsigned long idcode,
 =09=09panic("Unsupported Samsung CPU");
 =09}
=20
+=09s3c_chip_id =3D idcode;
+
 =09cpu->map_io();
 }
=20
@@ -140,6 +143,11 @@ void __init s3c24xx_init_uarts(struct s3c2410_uartcfg =
*cfg, int no)
 =09=09(cpu->init_uarts)(cfg, no);
 }
=20
+unsigned long s3c_get_chip_id(void)
+{
+=09return s3c_chip_id;
+}
+
 static int __init s3c_arch_init(void)
 {
 =09int ret;
--=20
1.7.0.4

--------------030601050903020505020403--
