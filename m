From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 09/12] ARM: S3C2416: move mach-s3c2416/* into mach-s3c24xx/
Date: Tue, 21 Feb 2012 20:14:46 +0900
Message-ID: <00b301ccf08a$04fcef20$0ef6cd60$%kim@samsung.com>
References: <1329346545-16373-1-git-send-email-kgene.kim@samsung.com>
 <1329346545-16373-10-git-send-email-kgene.kim@samsung.com>
 <201202211142.59542.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28479 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339Ab2BULOr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 06:14:47 -0500
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LZQ00K8MPWMYXQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:14:46 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LZQ0012ZPWME940@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 21 Feb 2012 20:14:46 +0900 (KST)
In-reply-to: <201202211142.59542.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Heiko St=FCbner wrote:
>=20
> Hi Kgene,
>=20
Hi,

> Am Mittwoch, 15. Februar 2012, 23:55:43 schrieb Kukjin Kim:
> > This patch moves S3C2416 stuff into mach-s3c24xx/ directory
> > so that we can merge the s3c24 series' directories to the
> > just one mach-s3c24xx/ directory.
> >
> > Cc: Ben Dooks <ben-linux@fluff.org>
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> the patch is missing something like the following to prevent an error
> because
> "built-in.o" in mach-s3c2416 cannot be found:
>=20
Yes, you're right and it is due to dummy file in mach-s3c2416/.

I think, it can be solved after done of moving remained files to regard=
ing
directory such as drivers/cpufreq/.

As a note, you can see it before this weekend :)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
