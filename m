From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v5 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Mon, 2 Nov 2015 09:03:59 +0000
Message-ID: <20151102090359.GR4058@x1>
References: <1446186334-16510-1-git-send-email-alim.akhtar@samsung.com>
 <1446186334-16510-5-git-send-email-alim.akhtar@samsung.com>
 <20151101174048.GD22331@piout.net>
 <5636A44D.4090908@samsung.com>
 <20151102004722.GI22331@piout.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f178.google.com ([209.85.212.178]:38450 "EHLO
	mail-wi0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753248AbbKBJEE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 04:04:04 -0500
Received: by wicll6 with SMTP id ll6so45196343wic.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Nov 2015 01:04:03 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <20151102004722.GI22331@piout.net>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, broonie@kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org

On Mon, 02 Nov 2015, Alexandre Belloni wrote:

> On 02/11/2015 at 08:46:21 +0900, Krzysztof Kozlowski wrote :
> > On 02.11.2015 02:40, Alexandre Belloni wrote:
> > > On 30/10/2015 at 11:55:34 +0530, Alim Akhtar wrote :
> > >> RTC found in s2mps15 is almost same as one found on s2mps13
> > >> with few differences in RTC_UPDATE register fields, like:
> > >> 1> Bit[4] and Bit[1] are reversed
> > >>    - On s2mps13
> > >>           WUDR -> bit[4], AUDR -> bit[1]
> > >>    - On s2mps15
> > >> 	  WUDR -> bit[1], AUDR -> bit[4]
> > >> 2> In case of s2mps13, for alarm register, need to set both
> > >>    WDUR and ADUR high, whereas for s2mps15 only set AUDR to high=
=2E
> > >> 3> On s2mps15, WUDR, RUDR and AUDR functions should never be use=
d
> > >>    at the same time.
> > >>
> > >> This patch add required changes to enable s2mps15 rtc timer.
> > >>
> > >> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
> > >> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> > >> ---
> > >>  drivers/rtc/rtc-s5m.c           |   37 ++++++++++++++++++++++++=
+++++++++----
> > >>  include/linux/mfd/samsung/rtc.h |    2 ++
> > >>  2 files changed, 35 insertions(+), 4 deletions(-)
> > >>
> > > Applied after fixing the small alignment issue, thanks.
> > >=20
> >=20
> > I think you cannot apply it directly because it depends on headers =
from
> > patch 2/4. It won't build.
> >=20
>=20
> Yeah, this depends on the mfd tree. I don't thin Lee applied patch 2/=
4
> yet so I'm taking that one for 4.5.

I don't mind if you take it, but if you do so you need to take the
Regulator patch as well AND provide Mark and I a pull-request from an
immutable branch please.=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
