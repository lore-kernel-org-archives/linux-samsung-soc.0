From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS4: Add ARMLEX4210 Board support file
Date: Fri, 04 Mar 2011 16:29:38 +0900
Message-ID: <028401cbda3d$eb0dc700$c1295500$%kim@samsung.com>
References: <10012655.143611299137229715.JavaMail.weblogic@epml15>
 <AANLkTimd0frTRpmwf+0OQ2HjYTOqD3NMEEZQovqGVYH1@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:41895 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752009Ab1CDHgD convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Mar 2011 02:36:03 -0500
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LHI00AC1VHE1S30@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 16:29:38 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LHI000ELVHE80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Mar 2011 16:29:38 +0900 (KST)
In-reply-to: <AANLkTimd0frTRpmwf+0OQ2HjYTOqD3NMEEZQovqGVYH1@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>, alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Thu, Mar 3, 2011 at 4:27 PM, ALIM AKHTAR <alim.akhtar@samsung.com>
wrote:
> > This patch is based on 'for-next' =A0branch of kgene tree.
> >
> > This patch adds Samsung ARMLEX4210 =A0board support file
> > which is based on Exynos4210.
> >
> > Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > ---
> > =A0arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 | =A0 13 ++
> > =A0arch/arm/mach-exynos4/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A01 +
> > =A0arch/arm/mach-exynos4/mach-armlex4210.c | =A0213
> +++++++++++++++++++++++++++++++
> > =A03 files changed, 227 insertions(+), 0 deletions(-)
> > =A0create mode 100644 arch/arm/mach-exynos4/mach-armlex4210.c

(snip)

> > +static struct s3c_sdhci_platdata armlex4210_hsmmc3_pdata __initdat=
a =3D {
> > + =A0 =A0 =A0 .cd_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D S3C_SDHCI=
_CD_PERMANENT,
> > + =A0 =A0 =A0 .max_width =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D 4,
> maybe you missed the clk_type. It's required for exynos4 series.
> clk_type =A0 =A0 =A0 =A0 =A0 =A0 =A0 =3D S3C_SDHCI_CLK_DIV_EXTERNAL,

Right :)
The clk_type(..._EXTERNAL) should be added for Exynos4210.

Hi Alim,

Others, looks ok.
So applied with fixing above.

If any problems, please let me know.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
