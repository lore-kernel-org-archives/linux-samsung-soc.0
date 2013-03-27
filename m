From: Mike Turquette <mturquette@linaro.org>
Subject: Re: RE: [PATCH v2 0/4] clk: samsung: pm fixes and multiple aliases
Date: Tue, 26 Mar 2013 17:59:12 -0700
Message-ID: <20130327005912.4014.60318@quantum>
References: <201303131458.18671.heiko@sntech.de>
 <176601ce293a$d7a0e190$86e2a4b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f51.google.com ([209.85.210.51]:35867 "EHLO
	mail-da0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752772Ab3C0A7X convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Mar 2013 20:59:23 -0400
Received: by mail-da0-f51.google.com with SMTP id g27so3784237dan.38
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2013 17:59:22 -0700 (PDT)
In-Reply-To: <176601ce293a$d7a0e190$86e2a4b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, =?utf-8?q?=27Heiko_St=C3=BCbner=27?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Quoting Kukjin Kim (2013-03-25 02:26:34)
> Heiko St=C3=BCbner wrote:
> >=20
> > Second version of the fixes to address comments gathered from the f=
irst
> > version, like not entering the dt code on non-dt platforms even if
> > dt-support is present in the kernel.
> >=20
> > Patch 1 and 3 got "Reviewed-by" tags but I only included the one fo=
r
> > patch 1, because patch 3 changed due to the changes in patch 2.
> >=20
> > Heiko Stuebner (4):
> >   clk: samsung: register clk_div_tables for divider clocks
> >   clk: samsung: fix pm init on non-dt platforms
> >   clk: samsung: always allocate the clk_table
> >   clk: samsung: add infrastructure to add separate aliases
> >=20
> >  drivers/clk/samsung/clk.c |   72 +++++++++++++++++++++++++++++++++=
++------
> > ---
> >  drivers/clk/samsung/clk.h |   34 ++++++++++++++++++--
> >  2 files changed, 87 insertions(+), 19 deletions(-)
> >=20
> > --
> > 1.7.2.3
>=20
> Looks good to me and applied into samsung tree based on samsung commo=
n clock by Thomas P Abraham for testing.
>=20
> But would be helpful to me if I could get Mike's ack on this series.
>=20

Acked-by: Mike Turquette <mturquette@linaro.org>

> Thanks.
>=20
> - Kukjin
