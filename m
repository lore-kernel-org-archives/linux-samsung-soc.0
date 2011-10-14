From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/8] S3C2416: Enable armdiv and armclk
Date: Fri, 14 Oct 2011 16:44:03 +0900
Message-ID: <087201cc8a45$0b901430$22b03c90$%kim@samsung.com>
References: <201109281217.33813.heiko@sntech.de>
 <085f01cc8a40$df7af8a0$9e70e9e0$%kim@samsung.com>
 <201110140927.18860.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21302 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753918Ab1JNHoF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:44:05 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT100HY0PGFAS60@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:44:03 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100HX5PHFUX30@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:44:03 +0900 (KST)
In-reply-to: <201110140927.18860.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Hi Kgene,
>=20
> Am Freitag, 14. Oktober 2011, 09:14:11 schrieb Kukjin Kim:
> > Heiko St=FCbner wrote:
> [...]
> > > Heiko Stuebner (8):
> > >   S3C2416: Add armdiv_mask constant.
> [...]
> > As a note, if required, 1st patch which is fixing will be sent to
stable.
>=20
> I don't think this is really necessary.
>=20
> The original code was essentially correct but hard to read.
> The constant makes sense in the rework, as the armdiv_mask is is used=
 in
more
> places now and not contained in a single static function.
>=20

OK.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
