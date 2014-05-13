From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] ARM: S3C24XX: cleanup debug macro/earlyprintk
Date: Tue, 13 May 2014 14:32:08 +0900
Message-ID: <074701cf6e6c$aeabc610$0c035230$@samsung.com>
References: <1856986.kkQFKFg1L2@phil>
 <0cc401cf68e1$eb87f580$c297e080$@samsung.com> <2586347.kOddnpvo1Z@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:57084 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890AbaEMFcK convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 May 2014 01:32:10 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N5H00ARZZDK1N40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 May 2014 14:32:08 +0900 (KST)
In-reply-to: <2586347.kOddnpvo1Z@diego>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, arm@kernel.org
Cc: 'Russell King' <linux@arm.linux.org.uk>, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Russell King <rmk+kernel@arm.linux.org.uk>

Heiko St=FCbner wrote:
>=20

[...]

> > >
> > > Heiko Stuebner (4):
> > >   ARM: compressed/head.S: remove s3c24xx special case
> > >   ARM: S3C24XX: trim down debug uart handling
> > >   ARM: S3C24XX: use generic DEBUG_UART_PHY/_VIRT in debug macro
> > >   ARM: S3C24XX: move debug-macro.S into the common space
> > >
> > >  arch/arm/Kconfig.debug                           |  54 +++++++++=
++-
> > >  arch/arm/boot/compressed/head.S                  |   5 --
> > >  arch/arm/include/debug/s3c24xx.S                 |  46 +++++++++=
++
> > >  arch/arm/mach-s3c24xx/Kconfig                    |  28 -------
> > >  arch/arm/mach-s3c24xx/include/mach/debug-macro.S | 101 ---------=
-----
> ----
> > >
> > > -----
> > >
> > >  5 files changed, 98 insertions(+), 136 deletions(-)
> > >  create mode 100644 arch/arm/include/debug/s3c24xx.S
> > >  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/debug-macr=
o.S
> > >
> > > --
> > > 1.9.0
> >
> > Basically I'm OK on this series but need to get review from Russell=
?
>=20
> Russell pointed out a bad decision on my part in v1, so I guess he is
> aware of
> this series :-) . I've also added arm@kernel.org now, so they can
complain,
> if
> anything is done wrong [should've probably done that from the beginni=
ng].
>=20
OK, I will apply this series.

Russell, do you have any comments on this series, please kindly let us =
know.

Thanks,
Kukjin
