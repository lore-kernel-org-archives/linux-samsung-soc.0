From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/9] ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
Date: Thu, 09 Feb 2012 20:39:41 +0900
Message-ID: <06a001cce71f$82dd10b0$88973210$%kim@samsung.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
 <1328024354-4277-4-git-send-email-kgene.kim@samsung.com>
 <CAOesGMg3xS7o1+F1ZmZvg1=oy59F+7QnSYWkJ9kTacCDu35aOg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:34714 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969Ab2BILjm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Feb 2012 06:39:42 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZ400ACBJ1POP00@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:39:41 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZ400DE0J224F20@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 09 Feb 2012 20:39:40 +0900 (KST)
In-reply-to: <CAOesGMg3xS7o1+F1ZmZvg1=oy59F+7QnSYWkJ9kTacCDu35aOg@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Olof Johansson wrote:
>=20
> Hi,
>=20
Hi :)

> On Tue, Jan 31, 2012 at 7:39 AM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>=20
> A brief patch description, please.
>=20
OK. Will add, I thought we don't need same description with subject. Bu=
t
what this patch is and why this patch is needed will be added next time=
=2E

[...]

> > - * linux/arch/arm/mach-exynos4/setup-i2c0.c
> > + * linux/arch/arm/mach-exynos/setup-i2c0.c
>=20
> The file name fills very little purpose in files like these. Consider
> removing them at some point.
>=20
Yes, agree. Firstly, it will be removed when it is updated from now on.

[...]

> > =A0void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> > =A0{
> > - =A0 =A0 =A0 s3c_gpio_cfgall_range(EXYNOS4_GPD1(0), 2,
> > - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_GPIO_=
SFN(2), S3C_GPIO_PULL_UP);
> > + =A0 =A0 =A0 if (soc_is_exynos5250())
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* will be implemented with gpio func=
tion */
> > + =A0 =A0 =A0 else
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgall_range(EXYNOS4_GPD1(0)=
, 2,
> > + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 S3C_GPIO_SFN(2),
S3C_GPIO_PULL_UP);
> > =A0}
>=20
> The above is pretty awkward. It's cleaner to return and avoid the els=
e
> side of the statement (move the comment accordingly, of course).
>=20
OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
