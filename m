From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH 0/6] ARM: S5P64X0: Add Framebuffer support
Date: Fri, 15 Jul 2011 11:57:37 +0530
Message-ID: <CAEC9eQMonzbcTOfb+2=UBCDpOrk-Qh+snQjTDLetz=jftb3AeQ@mail.gmail.com>
References: <1310650036-28836-1-git-send-email-ajaykumar.rs@samsung.com>
	<4E1FDA4E.9010800@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f52.google.com ([209.85.161.52]:47590 "EHLO
	mail-fx0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964790Ab1GOG1j convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Jul 2011 02:27:39 -0400
Received: by fxd18 with SMTP id 18so2292672fxd.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2011 23:27:38 -0700 (PDT)
In-Reply-To: <4E1FDA4E.9010800@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lethal@linux-sh.org, jg1.han@samsung.com

Hi Tushar,

On Fri, Jul 15, 2011 at 11:42 AM, Tushar Behera
<tushar.behera@linaro.org> wrote:
> On Thursday 14 July 2011 06:57 PM, Ajay Kumar wrote:
>>
>> =A0 =A0 =A0 =A0The patches are created against "for-next" branch of =
Kukjin Kim's
>> tree at:
>>
>> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
>>
>> =A0 =A0 =A0 =A0Patch [1/6]
>> =A0 =A0 =A0 =A0-- add "s5p64x0-fb" type driver_data(s3c_fb_driverdat=
a).
>> =A0 =A0 =A0 =A0-- Display controller in S5P64X0 supports 3 windows.
>>
>> =A0 =A0 =A0 =A0Patch [2/6]
>> =A0 =A0 =A0 =A0-- Resource definitions(_MEM, _IRQ).
>>
>> =A0 =A0 =A0 =A0Patch [3/6]
>> =A0 =A0 =A0 =A0-- Set s3c_device_fb name as "s5p64x0-fb"
>> =A0 =A0 =A0 =A0 =A0 for S5P6440 and S5P6450.
>>
>> =A0 =A0 =A0 =A0Patch [4/6]
>> =A0 =A0 =A0 =A0-- GPIO settings for LCD in S5P6440 and S5P6450.
>> =A0 =A0 =A0 =A0-- Select LCD interface type (RGB/i80)
>>
>> =A0 =A0 =A0 =A0Patch [5/6]
>> =A0 =A0 =A0 =A0-- Add support for LCD-LTE480 platform device in SMDK=
6440.
>> =A0 =A0 =A0 =A0-- Platform data for FB and a basic window definition=
=2E
>> =A0 =A0 =A0 =A0-- Enables FB support and platform-lcd support.
>> =A0 =A0 =A0 =A0-- Add support for window 0 with 24 BPP.
>>
>> =A0 =A0 =A0 =A0Patch [6/6]
>> =A0 =A0 =A0 =A0-- Add support for LCD-LTE480 platform device in SMDK=
6450.
>> =A0 =A0 =A0 =A0-- Platform data for FB and a basic window definition=
=2E
>> =A0 =A0 =A0 =A0-- Enables FB support and platform-lcd support.
>> =A0 =A0 =A0 =A0-- Add support for window 0 with 24 BPP.
>>
> Some of the patches have got some coding syntax (DOS LINE ending etc.=
).
> Consider running scripts/checkpatch.pl on the patches before sending =
the
> next version.
>
> scripts/cleanpatch can help you in fixing many of the style problems.
>

I have tried running checkpatch.pl on patches 1 to 6,
and I did not encounter any error like DOS_LINE as you have mentioned.
Can you please tell me which patch is showing that error when run with
checkpatch.pl?

>> =A0o To Paul Mundt, Jingoo Han
>> =A0 =A0[Patch 1/6] video: s3c-fb: Add S5P64X0 specific s3c_fb_driver=
data
>>
>> =A0o To Kukjin Kim
>> =A0 =A0[Patch 2/6] ARM: S5P64X0: Add register base and IRQ for Frame=
buffer
>> =A0 =A0[Patch 3/6] ARM: S5P64X0: Set s3c_device_fb name
>> =A0 =A0[Patch 4/6] ARM: S5P64X0: Add GPIO and SPCON settings for LCD
>> =A0 =A0[Patch 5/6] ARM: S5P6440: Add LCD-LTE480 and enable Framebuff=
er support
>> =A0 =A0[Patch 6/6] ARM: S5P6450: Add LCD-LTE480 and enable Framebuff=
er support
>>
>>
>> =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 10 ++++
>> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 +
>> =A0arch/arm/mach-s5p64x0/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A03 +
>> =A0arch/arm/mach-s5p64x0/include/mach/irqs.h =A0 =A0 =A0| =A0 =A04 +=
+
>> =A0arch/arm/mach-s5p64x0/include/mach/map.h =A0 =A0 =A0 | =A0 =A03 +
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-fb.h =A0 | =A0 19 +++++++
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-gpio.h | =A0 =A04 ++
>> =A0arch/arm/mach-s5p64x0/mach-smdk6440.c =A0 =A0 =A0 =A0 =A0| =A0 63
>> +++++++++++++++++++++++
>> =A0arch/arm/mach-s5p64x0/mach-smdk6450.c =A0 =A0 =A0 =A0 =A0| =A0 63
>> +++++++++++++++++++++++
>> =A0arch/arm/mach-s5p64x0/setup-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 48 ++++++++++++++++++
>> =A0arch/arm/plat-samsung/include/plat/fb.h =A0 =A0 =A0 =A0| =A0 14 +=
++++
>> =A0drivers/video/s3c-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 64
>> ++++++++++++++++++++++++
>> =A012 files changed, 296 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/regs-fb.h
>> =A0create mode 100644 arch/arm/mach-s5p64x0/setup-fb.c
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe
>> linux-samsung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
>
> --
> Tushar Behera
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
