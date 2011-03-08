From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] This patch adds support HR-Timer(High Resolution
	Timer) and dynamic tick system for S5P SoCs. There are many clock	sources for
 HR-Timer on S5P SoCs. The PWM timer, RTC, System Timer,
	and MCT can be used for clock source. This patch can onl
Date: Wed, 09 Mar 2011 07:44:08 +0900
Message-ID: <041801cbdde2$5927d080$0b777180$%kim@samsung.com>
References: <1299456554-15280-1-git-send-email-sbkim73@samsung.com>
 <1299456554-15280-2-git-send-email-sbkim73@samsung.com>
 <20110308094955.GB25874@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57164 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754819Ab1CHWoP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Mar 2011 17:44:15 -0500
Received: from epmmp2 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHR003O8GHPMXB0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 07:44:13 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHR00IM0GHP1Q@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 09 Mar 2011 07:44:14 +0900 (KST)
In-reply-to: <20110308094955.GB25874@n2100.arm.linux.org.uk>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Russell King - ARM Linux' <linux@arm.linux.org.uk>, 'Sangbeom Kim' <sbkim73@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Russell King - ARM Linux wrote:
>=20
> > Subject: [PATCH 1/3] This patch adds support HR-Timer(High Resoluti=
on Timer)
>         and dynamic tick system for S5P SoCs. There are many clock
>         sources for HR-Timer on S5P SoCs. The PWM timer, RTC, System =
Timer,
>         and MCT can be used for clock source. This patch can only sup=
port PWM
>         timer for clocksource of S5P64x0 and S5PV210.
>=20
> Please don't fill the subject line with the entire patch description.
> Subject lines are always supposed to be a brief summary of the messag=
e
> being sent, or with patches a brief summary of what the patch is abou=
t.
>=20
> Put the rest of the patch description in the body of the message.
>=20
> Don't say things like "This patch adds", "Adding support for", etc.  =
When
> the patch has been merged, years later it doesn't make sense to read =
such
> patch descriptions.
>=20
> "S5P: Common HRT and NO_HZ support" is sufficient to summarise the pa=
tch.
>=20
> Note that some mail clients only show you the first 40 or so characte=
rs of
> the subject line in their message index.  To illustrate:
>=20
> 6472 N   Mar 07 Sangbeom Kim    (  19) [PATCH V3 0/3] ARM: S5P: Add H=
RT
> support
> 6473     Mar 07 Sangbeom Kim    ( 530) =E2=94=9C=E2=94=80>[PATCH 1/3]=
 This patch adds support
> HR
> 6474 N   Mar 07 Sangbeom Kim    ( 208) =E2=94=9C=E2=94=80>[PATCH 2/3]=
 This patch modify
> s5pv210_
> 6475 N   Mar 07 Sangbeom Kim    ( 112) =E2=94=94=E2=94=80>[PATCH 3/3]=
 This patch update mach-
> s5p
>=20
> So to have half the subject space wasted by "This patch modify" is no=
t
> very productive.

Hmm...Sangbeom,

Absolutely, I agree with Russell's opinions.
According to your previous patch, maybe you made a mistake :(

And should be changed PWM Timer for HRT on SMDKV210, because PWM Timer3=
 is already used for backlight.

Please re-submit it, rc8 already released. I think you know the meaning=
 ;)

Russell,
Thanks for your pointing out and I will think again about the patch sub=
jects of Samsung stuff before applying.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
