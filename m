From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: RE: [PATCH v2 0/4] clk: samsung: pm fixes and multiple aliases
Date: Thu, 04 Apr 2013 13:06:35 +0900
Message-ID: <272701ce30e9$cc816b70$65844250$%kim@samsung.com>
References: <201303131458.18671.heiko@sntech.de>
 <176601ce293a$d7a0e190$86e2a4b0$%kim@samsung.com>
 <20130327005912.4014.60318@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21868 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750699Ab3DDEGh convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 00:06:37 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MKP00CT4Q2TNIH0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Apr 2013 13:06:36 +0900 (KST)
In-reply-to: <20130327005912.4014.60318@quantum>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mike Turquette' <mturquette@linaro.org>, =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Mike Turquette wrote:
>=20
> Quoting Kukjin Kim (2013-03-25 02:26:34)
> > Heiko St=C3=BCbner wrote:
> > >
> > > Second version of the fixes to address comments gathered from the
> first
> > > version, like not entering the dt code on non-dt platforms even i=
f
> > > dt-support is present in the kernel.
> > >
> > > Patch 1 and 3 got "Reviewed-by" tags but I only included the one =
for
> > > patch 1, because patch 3 changed due to the changes in patch 2.
> > >
> > > Heiko Stuebner (4):
> > >   clk: samsung: register clk_div_tables for divider clocks
> > >   clk: samsung: fix pm init on non-dt platforms
> > >   clk: samsung: always allocate the clk_table
> > >   clk: samsung: add infrastructure to add separate aliases
> > >
> > >  drivers/clk/samsung/clk.c |   72 +++++++++++++++++++++++++++++++=
++++--
> ----
> > > ---
> > >  drivers/clk/samsung/clk.h |   34 ++++++++++++++++++--
> > >  2 files changed, 87 insertions(+), 19 deletions(-)
> > >
> > > --
> > > 1.7.2.3
> >
> > Looks good to me and applied into samsung tree based on samsung com=
mon
> clock by Thomas P Abraham for testing.
> >
> > But would be helpful to me if I could get Mike's ack on this series=
=2E
> >
>=20
> Acked-by: Mike Turquette <mturquette@linaro.org>
>=20
Applied, thanks.

- Kukjin
