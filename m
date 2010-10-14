From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: S5P: Add initial map for GPIO2 and GPIO3
Date: Thu, 14 Oct 2010 14:41:24 +0900
Message-ID: <006901cb6b62$72766580$57633080$%kim@samsung.com>
References: <1286868876-3748-1-git-send-email-sbkim73@samsung.com>
 <1286868876-3748-2-git-send-email-sbkim73@samsung.com>
 <006601cb6b60$0a0e4190$1e2ac4b0$%kim@samsung.com>
 <AANLkTimKNBfDpz_3E4z6MHV7V1Ht9Yobf6qbGMxyWWAy@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:46741 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752257Ab0JNFlM convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 01:41:12 -0400
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LA900LF8MGHG530@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:41:06 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LA9007IBMGHAO@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Oct 2010 14:41:06 +0900 (KST)
In-reply-to: <AANLkTimKNBfDpz_3E4z6MHV7V1Ht9Yobf6qbGMxyWWAy@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kyungmin Park' <kmpark@infradead.org>
Cc: 'Sangbeom Kim' <sbkim73@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Jongpill Lee' <boyko.lee@samsung.com>, ben-linux@fluff.org

Kyungmin Park wrote:
>=20
> On Thu, Oct 14, 2010 at 2:24 PM, Kukjin Kim <kgene.kim@samsung.com> w=
rote:
> > Sangbeom Kim wrote:
> >>
> >> From: Jongpill Lee <boyko.lee@samsung.com>
> >>
> >> This patch adds initial map for GPIO2 and GPIO3.
> >> S5PV310/S5PC210 has separated GPIO1, GPIO2 and GPIO3.
> >>
> >> Signed-off-by: Jongpill Lee <boyko.lee@samsung.com>
> >> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> >> ---
> >> Changes since v1:
> >> - Rebased on latest for-next from Kukjin Kim's git tree
> >> - Added S5P_VA_GPIO1 according to S5PV310_PA_GPIO1
> >>
> >> =A0arch/arm/mach-s5pv310/cpu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 12=
 +++++++++++-
> >> =A0arch/arm/plat-s5p/include/plat/map-s5p.h | =A0 =A03 +++
> >> =A02 files changed, 14 insertions(+), 1 deletions(-)

(snip)

> >> + =A0 =A0 =A0 =A0 =A0 =A0 .virtual =A0 =A0 =A0 =A0=3D (unsigned lo=
ng)S5P_VA_GPIO3,
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .pfn =A0 =A0 =A0 =A0 =A0 =A0=3D __phys_t=
o_pfn(S5PV310_PA_GPIO3),
> >> + =A0 =A0 =A0 =A0 =A0 =A0 .length =A0 =A0 =A0 =A0 =3D SZ_256K,
> Why 256K?

Oh...yeah, it's typo :-(
Maybe 256?...

Hmm...I will change it when merge.

Thanks for your pointing out.

(snip)

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
