From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v4 3/8] ARM: Samsung: Add platform definitions and helpers
	for FIMC driver
Date: Tue, 03 Aug 2010 10:05:39 +0900
Message-ID: <00e801cb32a7$fffae0f0$fff0a2d0$%kim@samsung.com>
References: <1279902083-21250-4-git-send-email-s.nawrocki@samsung.com>
 <1280750229-15732-1-git-send-email-m.szyprowski@samsung.com>
 <00e101cb329e$a50ceb60$ef26c220$%kim@samsung.com>
 <AANLkTimJcQccG-H_661bPSz-sQ+L=GYNLd2A3W02wUUP@mail.gmail.com>
 <00e501cb32a5$5775ed50$0661c7f0$%kim@samsung.com>
 <AANLkTinuDaOKe1cMTCC+kmZg0dg2y75szDPQaa93gWbn@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34959 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754786Ab0HCBFe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Aug 2010 21:05:34 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L6J00MD4XP8QS20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 10:05:32 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L6J00CJLXP8RQ@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 10:05:32 +0900 (KST)
In-reply-to: <AANLkTinuDaOKe1cMTCC+kmZg0dg2y75szDPQaa93gWbn@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kyungmin.park@samsung.com>
Cc: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, s.nawrocki@samsung.com, p.osciak@samsung.com, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Tue, Aug 3, 2010 at 9:46 AM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> > Kyungmin Park wrote:
> >>
> >> On Tue, Aug 3, 2010 at 8:58 AM, Kukjin Kim <kgene.kim@samsung.com>
wrote:
> >> > Marek Szyprowski wrote:
> >> >>
> >> >> From: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> >>
> >> >> FIMC (CAMIF) device is a camera interface embedded in S3C/S5P
Samsung
> >> >> SOC series. It supports ITU-R BT.601/656 and MIPI-CSI2 standard=
s,
> >> >> memory to memory operations, color conversion, resizing and
rotation.
> >> >>
> >> >> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> >> >> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> >> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> >> ---
> >> >>
> >> >> This is patch is a v3 version rebased onto latest kgene/for-nex=
t
tree.
> >> >> New entries in map.h files has been sorted by the physicall add=
ress.
> >> >>
> >> > Thanks for your addressing.
> >> >
> >> >> I'm resending this patch on behalf of Sylwester who is on holid=
ays
this
> >> >> week.
> >> >>
> >> >> Best regards
> >> >> --
> >> >> Marek Szyprowski
> >> >> Samsung Poland R&D Center
> >> >> ---

(snip)

> >> >>
> >> >> diff --git a/arch/arm/mach-s5pc100/include/mach/map.h
b/arch/arm/mach-
> >> >> s5pc100/include/mach/map.h
> >> >> index c018697..3abe7f5 100644
> >> >> --- a/arch/arm/mach-s5pc100/include/mach/map.h
> >> >> +++ b/arch/arm/mach-s5pc100/include/mach/map.h
> >> >> @@ -99,6 +99,10 @@
> >> >>
> >> >> =A0#define S5PC100_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xEE00=
0000)
> >> >>
> >> >> +#define S5PC100_PA_FIMC0 =A0 =A0 (0xEE200000)
> >> >> +#define S5PC100_PA_FIMC1 =A0 =A0 (0xEE300000)
> >> >> +#define S5PC100_PA_FIMC2 =A0 =A0 (0xEE400000)
> >> >> +
> >> >> =A0#define S5PC100_PA_I2S0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF20000=
00)
> >> >> =A0#define S5PC100_PA_I2S1 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF21000=
00)
> >> >> =A0#define S5PC100_PA_I2S2 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF22000=
00)
> >> >> @@ -143,6 +147,9 @@
> >> >> =A0#define S3C_PA_ONENAND_BUF =A0 S5PC100_PA_ONENAND_BUF
> >> >> =A0#define S3C_SZ_ONENAND_BUF =A0 S5PC100_SZ_ONENAND_BUF
> >> >> =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
> >> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
> >> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
> >> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
> >> >>
> >> >> =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_P=
A_TSADC
> >> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
> >> >> diff --git a/arch/arm/mach-s5pv210/cpu.c
b/arch/arm/mach-s5pv210/cpu.c

(snip)

> >> >> diff --git a/arch/arm/mach-s5pv210/include/mach/map.h
b/arch/arm/mach-
> >> >> s5pv210/include/mach/map.h
> >> >> index 986b285..6a07e55 100644
> >> >> --- a/arch/arm/mach-s5pv210/include/mach/map.h
> >> >> +++ b/arch/arm/mach-s5pv210/include/mach/map.h
> >> >> @@ -65,6 +65,10 @@
> >> >>
> >> >> =A0#define S5PV210_PA_FB =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF800=
0000)
> >> >>
> >> >> +#define S5PV210_PA_FIMC0 =A0 =A0 (0xFB200000)
> >> >> +#define S5PV210_PA_FIMC1 =A0 =A0 (0xFB300000)
> >> >> +#define S5PV210_PA_FIMC2 =A0 =A0 (0xFB400000)
> >> >> +
> >> >> =A0#define S5PV210_PA_HSMMC(x) =A0(0xEB000000 + ((x) * 0x100000=
))
> >> >>
> >> >> =A0#define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF20000=
00)
> >> >> @@ -114,4 +118,8 @@
> >> >> =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PV210_PA_CFCON
> >> >> =A0#define SAMSUNG_PA_KEYPAD =A0 =A0S5PV210_PA_KEYPAD
> >> >>
> >> >> +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
> >> >> +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
> >> >> +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
> >> >
> >> > To use one style is better for reading, merge conflict handling =
and
so
> > on...
> >> > The style means to add S5P_PA_XXX after S3C_PA_XXX with C100 cas=
e or
> to
> >> > modify above C100 case like this.
> >>
> >> Use the same conversion as previous one. are you okay?
> >>
> >> #define S5PV210_PA_VIC0 =A0 =A0 =A0 =A0 (0xF2000000)
> >> #define S5P_PA_VIC0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC0
> >>
> >> #define S5PV210_PA_VIC1 =A0 =A0 =A0 =A0 (0xF2100000)
> >> #define S5P_PA_VIC1 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC1
> >>
> >> #define S5PV210_PA_VIC2 =A0 =A0 =A0 =A0 (0xF2200000)
> >> #define S5P_PA_VIC2 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC2
> >>
> >> #define S5PV210_PA_VIC3 =A0 =A0 =A0 =A0 (0xF2300000)
> >> #define S5P_PA_VIC3 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_VIC3
> >>
> >> #define S5PV210_PA_SDRAM =A0 =A0 =A0 =A0(0x30000000)
> >> #define S5P_PA_SDRAM =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_SDRAM
> >>
> > No.
> >
> > Did you see above C100?
> >
> > --- C100
> >
> > =A0#define S3C_PA_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_ON=
ENAND_BUF
> > =A0#define S3C_SZ_ONENAND_BUF =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_SZ_ON=
ENAND_BUF
> > =A0#define S3C_PA_RTC =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_RTC
> > +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC0
> > +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC1
> > +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_FIMC2
> >
> > =A0#define SAMSUNG_PA_ADC =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PC100_PA_TS=
ADC
> > =A0#define SAMSUNG_PA_CFCON =A0 =A0 S5PC100_PA_CFCON
> >
> > --- V210
> >
> > =A0#define SAMSUNG_PA_CFCON =A0 =A0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_=
CFCON
> > =A0#define SAMSUNG_PA_KEYPAD =A0 =A0 =A0 =A0 =A0 =A0 =A0S5PV210_PA_=
KEYPAD
> >
> > +#define S5P_PA_FIMC0 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC0
> > +#define S5P_PA_FIMC1 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC1
> > +#define S5P_PA_FIMC2 =A0 =A0 =A0 =A0 =A0 S5PV210_PA_FIMC2
> >
> > I mean it's just ordering.
>=20
> Yes I also mean it don't separate the related definitions. so place
> adjacent as the the previous.
>=20
No...maybe you misunderstood...hmm :-(
Please add in map.h of V210 like following.

@@ -110,6 +110,10 @@
 #define S3C_PA_RTC		S5PV210_PA_RTC
 #define S3C_PA_WDT		S5PV210_PA_WATCHDOG

+#define S5P_PA_FIMC0		S5PV210_PA_FIMC0
+#define S5P_PA_FIMC1		S5PV210_PA_FIMC1
+#define S5P_PA_FIMC2		S5PV210_PA_FIMC2
+
 #define SAMSUNG_PA_ADC		S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON		S5PV210_PA_CFCON
 #define SAMSUNG_PA_KEYPAD		S5PV210_PA_KEYPAD

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
