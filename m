From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/7] ARM: EXYNOS4: Add external GIC io memory mapping
Date: Mon, 04 Jul 2011 19:25:48 +0900
Message-ID: <005801cc3a34$bff29bc0$3fd7d340$%kim@samsung.com>
References: <1308555258-4322-1-git-send-email-chaos.youn@samsung.com>
 <1308555258-4322-2-git-send-email-chaos.youn@samsung.com>
 <BANLkTikYvCVVZP+z06466x1maEi3CDcq5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16320 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177Ab1GDKZx convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 06:25:53 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNT00B0X0YTYAV0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:25:52 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNT00L0E0Z3VL@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Jul 2011 19:25:52 +0900 (KST)
In-reply-to: <BANLkTikYvCVVZP+z06466x1maEi3CDcq5w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@gmail.com>, 'Changhwan Youn' <chaos.youn@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

MyungJoo Ham wrote:
>=20
> > =A0#define EXYNOS4_PA_COMBINER =A0 =A0 =A0 =A0 =A0 =A00x10448000
>=20
> Isn't this 0x10440000 if we are going to use External GIC?
>=20
Oops, you're right, thanks for your pointing out.
Yes, should be 0x10440000.

When I apply this, I will fix it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
