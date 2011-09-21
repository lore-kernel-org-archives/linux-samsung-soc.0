From: Ajay kumar <ajaynumb@gmail.com>
Subject: Re: [PATCH V5 0/6] ARM: S5P64X0: Add Framebuffer support
Date: Wed, 21 Sep 2011 18:30:40 +0530
Message-ID: <CAEC9eQPDq6tQCVv8GWRWOGfn5HN_WpAhHStahccF3=+7sGCb-Q@mail.gmail.com>
References: <1316454841-20869-1-git-send-email-ajaykumar.rs@samsung.com>
	<004a01cc7857$d0d8aa90$7289ffb0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:60396 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753706Ab1IUNAl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Sep 2011 09:00:41 -0400
Received: by fxe4 with SMTP id 4so1591619fxe.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Sep 2011 06:00:40 -0700 (PDT)
In-Reply-To: <004a01cc7857$d0d8aa90$7289ffb0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Ajay Kumar <ajaykumar.rs@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jg1.han@samsung.com

Hi Kukjin,

On Wed, Sep 21, 2011 at 5:43 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Ajay Kumar wrote:
>>
>> =A0The patches are created against "for-next" branch of Kukjin Kim's=
 tree
> at:
>> =A0git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung=
=2Egit
>>
>> =A0Changes since V1:
>> =A0 =A0 =A0 - Remove mach/regs-fb.h, instead use plat/regs-fb.h.
>> =A0 =A0 =A0 - Add common pdata for FB and LCD in SMDK6440 and SMDK64=
50.
>> =A0 =A0 =A0 - Modify names(s5p-->smdk), max_bpp and refresh rate.
>> =A0 =A0 =A0 - Modify variable name(cfg-->chipid).
>> =A0 =A0 =A0 - Use __raw_readl, __raw_writel instead of readl and wri=
tel.
>>
>> =A0Changes since V2:
>> =A0 =A0 =A0 -Change name of the config-COMMON_FB to SMDK64X0_COMMON_=
=46B.
>> =A0 =A0 =A0 -Change filename common-fb.h to smdk64x0-common-fb.h.
>> =A0 =A0 =A0 -Change filename common-fb.c to smdk64x0-common-fb.c.
>>
>> =A0Changes since V3:
>> =A0 =A0 =A0 -Add FB and LCD plat-data in corresponding machine files
>> =A0 =A0 =A0 =A0instead of creating common file smdk64x0-common-fb.c.
>> =A0 =A0 =A0 -Modify name S5P64X0_SETUP_FB to S5P64X0_SETUP_FB_24BPP.
>> =A0 =A0 =A0 -Modify file name setup-fb.c to setup-fb-24bpp.c.
>> =A0 =A0 =A0 -Move SPCON settings to machine file.
>> =A0 =A0 =A0 -Use soc_is_s5p6440()/soc_is_s5p6450() to check CPU ID.
>>
>> =A0Changes since V4:
>> =A0 =A0 =A0 -Removed refresh rate from plat data(s3c_fb_pd_win)
>> =A0 =A0 =A0 -Fixed complation warning:"function declaration isn't a =
prototype"
>> =A0 =A0 =A0 =A0for s5p6440_set_lcd_interface() and s5p6450_set_lcd_i=
nterface().
>>
>>
>> =A0 These patches have dependency on the patch:
>> =A0 "ARM: S5P64X0: Fix mask value for S5P64X0 CPU IDs",
>> =A0 at http://www.spinics.net/lists/arm-kernel/msg138990.html
>>
>> o To Kukjin,
>> =A0 [PATCH RESEND V5 1/6] video: s3c-fb: Add S5P64X0 specific
>> s3c_fb_driverdata
>> =A0 [PATCH RESEND V5 2/6] ARM: S5P64X0: Add register base and IRQ fo=
r
>> Framebuffer
>> =A0 [PATCH RESEND V5 3/6] ARM: S5P64X0: Set s3c_device_fb name
>> =A0 [PATCH RESEND V5 4/6] ARM: S5P64X0: Add GPIO setup for LCD
>> =A0 [PATCH V5 5/6]ARM: S5P6440: Add LCD-LTE480 and enable Framebuffe=
r
>> support
>> =A0 [PATCH V5 6/6]ARM: S5P6450: Add LCD-LTE480 and enable Framebuffe=
r
>> support
>>
>> =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 10 +++
>> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A01 +
>> =A0arch/arm/mach-s5p64x0/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
| =A0 =A03 +
>> =A0arch/arm/mach-s5p64x0/include/mach/irqs.h =A0 =A0 =A0| =A0 =A04 +
>> =A0arch/arm/mach-s5p64x0/include/mach/map.h =A0 =A0 =A0 | =A0 =A03 +
>> =A0arch/arm/mach-s5p64x0/include/mach/regs-gpio.h | =A0 =A04 +
>> =A0arch/arm/mach-s5p64x0/mach-smdk6440.c =A0 =A0 =A0 =A0 =A0| =A0 74
>> +++++++++++++++++++++++
>> =A0arch/arm/mach-s5p64x0/mach-smdk6450.c =A0 =A0 =A0 =A0 =A0| =A0 75
>> ++++++++++++++++++++++++
>> =A0arch/arm/mach-s5p64x0/setup-fb-24bpp.c =A0 =A0 =A0 =A0 | =A0 29 +=
++++++++
>> =A0arch/arm/plat-samsung/include/plat/fb.h =A0 =A0 =A0 =A0| =A0 =A07=
 ++
>> =A0drivers/video/s3c-fb.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 27 +++++++++
>> =A011 files changed, 237 insertions(+), 0 deletions(-)
>> =A0create mode 100644 arch/arm/mach-s5p64x0/setup-fb-24bpp.c
>
> Looks ok to me, will apply.
>
> But as I said, the 'video: s3c-fb: Add S5P64X0 specific s3c_fb_driver=
data'
> should be sent to Florian's tree.

Yes. This patch was submitted to fbdev mailing list and Florian has
already accepted it. Here is the link:
http://lists.infradead.org/pipermail/linux-arm-kernel/2011-September/06=
5154.html

> I think, it's enough to re-send it to Florian Tobias Schandina.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>

Ajay
