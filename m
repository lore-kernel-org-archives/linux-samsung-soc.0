From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v6 01/16] clk: samsung: add common clock framework helper
 functions for Samsung platforms
Date: Thu, 07 Mar 2013 10:44:30 +0900
Message-ID: <015a01ce1ad5$4f89a4e0$ee9ceea0$%kim@samsung.com>
References: <1361175686-19400-1-git-send-email-thomas.abraham@linaro.org>
 <201303030208.49722.heiko@sntech.de> <51333149.1060105@gmail.com>
 <2984153.Xctncej7hL@flatron>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50178 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751132Ab3CGBoc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 20:44:32 -0500
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ9004PNOU6GWH0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 10:44:31 +0900 (KST)
In-reply-to: <2984153.Xctncej7hL@flatron>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <tomasz.figa@gmail.com>, linux-arm-kernel@lists.infradead.org
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org, devicetree-discuss@lists.ozlabs.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, t.figa@samsung.com

Tomasz Figa wrote:
>=20
> Hi,
>=20
> On Sunday 03 of March 2013 12:17:29 Sylwester Nawrocki wrote:
> > Hi,
> >
> > On 03/03/2013 02:08 AM, Heiko St=FCbner wrote:
> > > But is there an easy way to define more than one alias? On the s3=
c2416
> > > for example the hsmmc hclk is the "hsmmc" io-clock, as well as th=
e
> > > source for the "mmc_busclk.0". Same for the "uart" pclk, that is =
also
> > > a baud clock source.
> > This driver currently provides for only one additional clkdev looku=
p
> > entry per a platform clock. I pointed out this desing issue in the
> > early version of the patch set. It's because a machine clock defini=
tion
> > is coupled with a clock consumer definition. And IMO various
> > samsung_clock_register_* functions should not have
> > clk_register_clkdev() inside them. I.e. first step could be registe=
ring
> > all machine clocks and in the second one clkdev lookup entries coul=
d be
> > created. This is how most (all?) existing SoC clock drivers are
> > working.
> >
> > But those multiple aliases are important only for machines with dev=
ice
> > tree support, aren't they ?
>=20
> I suppose you meant _without_ device tree support, right?
>=20
> > I hope this patch series gets merged early to linux-next in the 3.1=
0
> > cycle so the multiple accumulated fixup patches for this clock driv=
er
> > can be merged as well and issues like that you pointed out can be
> > resolved with incremental patches.
>=20
> Yes, I hope so too.
>
Yes, I will in this weekend.

Note, I will modify [07/16] for universal_c210 as per Kyungmin's reques=
t,
I'm not sure about universal_c210 though.

Thanks.

- Kukjin
