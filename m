From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: EXYNOS: Map SYSRAM through generic SRAM bindings
Date: Fri, 02 May 2014 11:31:11 +0900
Message-ID: <045901cf65ae$94f4f4b0$bedede10$@samsung.com>
References: <1398941085-10224-1-git-send-email-sachin.kamat@linaro.org>
 <5153376.z2oJ163pLF@wuerfel> <1625238.xy1WDqNhgs@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28323 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750795AbaEBCbN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 May 2014 22:31:13 -0400
In-reply-to: <1625238.xy1WDqNhgs@diego>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, t.figa@samsung.com, robh+dt@kernel.org

Heiko St=FCbner wrote:
> Am Donnerstag, 1. Mai 2014, 15:32:14 schrieb Arnd Bergmann:
> > On Thursday 01 May 2014 16:14:44 Sachin Kamat wrote:
> > > Instead of hardcoding the SYSRAM details for each SoC,
> > > pass this information through device tree (DT) and make
> > > the code SoC agnostic. Generic SRAM bindings are used
> > > for achieving this.
> > >
> > > Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Arnd Bergmann <arnd@arndb.de>
> >
> > Looks good to me. Both patches
> >
> > Acked-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Heiko, can you also have a look?
>=20
> Already did :-)

Thanks you guys ;-)

I will take this series when I get confirmation of universal-c210's beh=
avior
from Andrzej or Tomasz.

- Kukjin
