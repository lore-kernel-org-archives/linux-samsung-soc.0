From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: S3C64XX: Remove gpio-bank-X header files
Date: Wed, 27 Apr 2011 12:16:19 +0900
Message-ID: <054301cc0489$82a27fa0$87e77ee0$%kim@samsung.com>
References: <1303465894-16870-1-git-send-email-jy0922.shim@samsung.com>
 <052c01cc047a$5cb8d500$162a7f00$%kim@samsung.com>
 <4DB782BD.9020205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40891 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751858Ab1D0DQh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Apr 2011 23:16:37 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKA00BEQJREO270@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:16:34 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKA00ET4JRL2W@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 27 Apr 2011 12:16:34 +0900 (KST)
In-reply-to: <4DB782BD.9020205@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, kmpark@infradead.org

Joonyoung Shim wrote:
>=20
> On 2011-04-27 =EC=98=A4=EC=A0=84 10:27, Kukjin Kim wrote:
> > Joonyoung Shim wrote:
> >>
> >> The gpio-bank-X header files of S3C64XX have defines which can be
> >> substituted by more common API, so they can be removed. This is co=
mpile
> >> tested only.
> >>
> >> Signed-off-by: Joonyoung Shim<jy0922.shim@samsung.com>
> >> ---
> > Hi,
> >
> > Oh, great.
> >
> > I also tried to remove useless gpio header files :) and it is in my
> dev/gpio
> > branch. But I think, this is better.
> > Anyway there are small comments.
> >
> > (snip)
> >
> >>   void s3c_pm_debug_smdkled(u32 set, u32 clear)
> >>   {
> >> -	unsigned long flags;
> >> -	u32 reg;
> >> -
> >> -	local_irq_save(flags);
> >> -	reg =3D __raw_readl(S3C64XX_GPNCON);
> >> -	reg&=3D ~(S3C64XX_GPN_CONMASK(12) | S3C64XX_GPN_CONMASK(13) |
> >> -		 S3C64XX_GPN_CONMASK(14) | S3C64XX_GPN_CONMASK(15));
> >> -	reg |=3D S3C64XX_GPN_OUTPUT(12) | S3C64XX_GPN_OUTPUT(13) |
> >> -	       S3C64XX_GPN_OUTPUT(14) | S3C64XX_GPN_OUTPUT(15);
> >> -	__raw_writel(reg, S3C64XX_GPNCON);
> >> -
> >> -	reg =3D __raw_readl(S3C64XX_GPNDAT);
> >> -	reg&=3D ~(clear<<  12);
> >> -	reg |=3D set<<  12;
> >> -	__raw_writel(reg, S3C64XX_GPNDAT);
> >> -
> >> -	local_irq_restore(flags);
> >> +	int i;
> >> +
> >> +	for (i =3D 0; i<  4; i++) {
> >> +		if (clear&  (1<<  i))
> >> +			gpio_direction_output(S3C64XX_GPN(12 + i), 0);
> >> +		if (set&  (1<<  i))
> >> +			gpio_direction_output(S3C64XX_GPN(12 + i), 1);
> >> +	}
> >
> > Hmm...
> >
> > According to comments in gpio_direction_{input,output}, it isn't ca=
lled
> more
> > than once...but it can be called twice in your code. And need
> > local_irq_{save,restore} around them.
> >
>=20
> OK, gpio_set_value will need here instead of gpio_diretion_output.
>=20
> > So how about keeping old codes here? In addtion, as you know, need =
to keep
> > definitions of S3C64XX_GPNxxx now :(
> >
>=20
> I won't keep old codes, it can replace fully.
>=20
Ok, I agree with you :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
