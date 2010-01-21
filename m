From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 09/10] ARM: S5PV210: Add S5PC110 configuration file
Date: Thu, 21 Jan 2010 09:07:19 +0900
Message-ID: <003101ca9a2d$b2c12a50$18437ef0$%kim@samsung.com>
References: <1263868110-32054-1-git-send-email-kgene.kim@samsung.com>
 <9c9fda241001191920q3d815c1cq955f7f0b6b3f0122@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:52335 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754019Ab0AUAF0 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 19:05:26 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KWK00GZPLL0ER@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:05:24 +0900 (KST)
Received: from kgenekim ([12.23.109.129])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0KWK000CALKZA5@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 21 Jan 2010 09:05:23 +0900 (KST)
In-reply-to: <9c9fda241001191920q3d815c1cq955f7f0b6b3f0122@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
> On Tue, Jan 19, 2010 at 11:28 AM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
> > This patch adds S5PC110 default configuration file.
> >
> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> > ---
> > =A0arch/arm/configs/s5pc110_defconfig | =A0895
> ++++++++++++++++++++++++++++++++++++
> > =A01 files changed, 895 insertions(+), 0 deletions(-)
>=20
> I don't like this ambiguous name.
>=20

> How about specify the correct name such as s5pc110_smdkc110_defconfig=
=2E

The s5pc110_defconfig means that it is default configuration file for S=
MDK
board like s5pc100, and s5p6440. Other boards can use different name.

> > diff --git a/arch/arm/configs/s5pc110_defconfig
> b/arch/arm/configs/s5pc110_defconfig
> > new file mode 100644
> > index 0000000..3956edc
> > --- /dev/null
> > +++ b/arch/arm/configs/s5pc110_defconfig
> > @@ -0,0 +1,895 @@

(snip)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
System LSI Division, SAMSUNG ELECTRONICS CO., LTD.
