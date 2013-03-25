From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] clk: samsung: pm fixes and multiple aliases
Date: Mon, 25 Mar 2013 18:26:34 +0900
Message-ID: <176601ce293a$d7a0e190$86e2a4b0$%kim@samsung.com>
References: <201303131458.18671.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:25458 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757757Ab3CYJ0f convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 25 Mar 2013 05:26:35 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MK7009Q3M88PR10@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 25 Mar 2013 18:26:34 +0900 (KST)
In-reply-to: <201303131458.18671.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?Q?'Heiko_St=C3=BCbner'?= <heiko@sntech.de>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, t.figa@samsung.com

Heiko St=C3=BCbner wrote:
>=20
> Second version of the fixes to address comments gathered from the fir=
st
> version, like not entering the dt code on non-dt platforms even if
> dt-support is present in the kernel.
>=20
> Patch 1 and 3 got "Reviewed-by" tags but I only included the one for
> patch 1, because patch 3 changed due to the changes in patch 2.
>=20
> Heiko Stuebner (4):
>   clk: samsung: register clk_div_tables for divider clocks
>   clk: samsung: fix pm init on non-dt platforms
>   clk: samsung: always allocate the clk_table
>   clk: samsung: add infrastructure to add separate aliases
>=20
>  drivers/clk/samsung/clk.c |   72 +++++++++++++++++++++++++++++++++++=
------
> ---
>  drivers/clk/samsung/clk.h |   34 ++++++++++++++++++--
>  2 files changed, 87 insertions(+), 19 deletions(-)
>=20
> --
> 1.7.2.3

Looks good to me and applied into samsung tree based on samsung common =
clock by Thomas P Abraham for testing.

But would be helpful to me if I could get Mike's ack on this series.

Thanks.

- Kukjin
