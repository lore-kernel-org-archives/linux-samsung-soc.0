From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Tue, 7 Jan 2014 12:33:43 +0530
Message-ID: <CAHbNUh3Ao0k5gKF-3V0Ktc5+3-NhucP62fUp_i9kPjn+jTevGg@mail.gmail.com>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com>
	<CAHbNUh18WkH4CFcaeP1Tdjm3L-Rr0xVzgCnAHoPbbCFRWjKyxg@mail.gmail.com>
	<201401061630.56740.arnd@arndb.de>
	<4790422.Kg6m1IjKcC@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:53637 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752204AbaAGHDo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 02:03:44 -0500
Received: by mail-oa0-f44.google.com with SMTP id h16so2974351oag.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jan 2014 23:03:43 -0800 (PST)
In-Reply-To: <4790422.Kg6m1IjKcC@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 6 January 2014 22:11, Tomasz Figa <tomasz.figa@gmail.com> wrote:
> On Monday 06 of January 2014 16:30:56 Arnd Bergmann wrote:
>> On Monday 06 January 2014, Tushar Behera wrote:
>> > The device tree node for l2x0 device was missing. After adding a node
>> > as below I can start booting Origen board.
>> >
>> > diff --git a/arch/arm/boot/dts/exynos4210-origen.dts
>> > b/arch/arm/boot/dts/exynos4210-origen.dts
>> > index 1a12fb2..675f323 100644
>> > --- a/arch/arm/boot/dts/exynos4210-origen.dts
>> > +++ b/arch/arm/boot/dts/exynos4210-origen.dts
>> > @@ -32,6 +32,13 @@
>> >
>> > +       l2-cache-controller@10502000 {
>> > +               compatible = "arm,pl310-cache";
>> > +               reg = <0x10502000 0x1000>;
>> > +               cache-unified;
>> > +               cache-level = <2>;
>> > +       };
>> > +
>>
>> Ok, very good!
>>
>> > >> be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
>> > >> just read the respective settings from DT.
>> >
>> > Ok.
>>
>> Does the node you list above have the right settings for this?
>>

I will add another patch to remove the usage of L2_AUX_VAL and
L2_AUX_MASK defines for regular mode, but we might still be needing
them for secure firmware booting,

>> > > 2) There is no L2 cache controller node in Exynos4*.dtsi.
>> > >
>> > > It should be added, but L2 cache can't be enabled on all boards yet,
>> > > since on boards where secure firmware is enabled, special configuration
>> > > involving SMC calls is required. Patches for this are queued on my work
>> > > queue, but it's quite tricky due to 1), which needs to consider whether
>> > > secure firmware is enabled or not.
>> > >
>> >
>> > In that case, would it be ok to add the node for Origen board only?
>
> Better solution would be to add the node in SoC-level dtsi, keep it
> disabled and override the status to okay at board level. Still...
>
>>
>> Wouldn't that leave other systems still broken? I'm particularly worried
>> about what patch to backport to linux-stable. We should definitely add
>> the node for Origen, but we may also have to revert my broken patch
>> in all affected kernel versions.
>
> ...Origen is not the only board that is affected by this, most likely any
> Exynos4-based board not running under secure firmware is.
>
>>
>> Are there any systems that may or may not have secure firmware enabled
>> depending on the boot loader, or do we always know whether secure firmware
>> is there or not?
>
> It always depends on the boot loader, but fortunately it's unlikely to
> happen that one board will have both secure-enabled and normal bootloaders
> available and in use, at least for Exynos4-based boards, so it's quite
> safe to assume presence of secure firmware on per board basis and so you
> have the secure firmware device tree node only in dts files of boards
> that are known to use secure firmware.
>

Ok. I will add the node in Exynos4.dtsi, keep it disabled and enable
on all Exynos4-based boards that are not using secure-firmware node.

> Aynway, from what I can see, support for the only two Exynos4 boards using
> for secure firmware was added in 3.12. This means that we can revert the
> offending patch for 3.11, but for 3.12 and newer we can't, because this
> will break such boards with CONFIG_L2X0 enabled.
>
> Instead, wouldn't it be better to fix the issue at its cause? This means
> s5p-sleep.S re-enabling L2X0 only if it was really enabled before entering
> low power mode. This could be achieved by checking if l2x0_regs_phys isn't
> 0 for example (which isn't a valid physical RAM address on Exynos).
>
> What do you think?
>
> Best regards,
> Tomasz
>

Tested successfully on Origen board with following code snippet.

diff --git a/arch/arm/plat-samsung/s5p-sleep.S
b/arch/arm/plat-samsung/s5p-sleep.S
index a030e73..d1753c5 100644
--- a/arch/arm/plat-samsung/s5p-sleep.S
+++ b/arch/arm/plat-samsung/s5p-sleep.S
@@ -62,6 +62,8 @@ ENTRY(s3c_cpu_resume)
        bne     resume_l2on
        adr     r0, l2x0_regs_phys
        ldr     r0, [r0]
+       cmp     r0, #0
+       beq     resume_l2on
        ldr     r1, [r0, #L2X0_R_PHY_BASE]
        ldr     r2, [r1, #L2X0_CTRL]
        tst     r2, #0x1

-- 
Tushar Behera
