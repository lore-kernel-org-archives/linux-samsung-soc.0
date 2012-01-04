From: Heiko =?windows-1252?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree block
Date: Wed, 4 Jan 2012 15:12:54 +0100
Message-ID: <201201041512.55126.heiko@sntech.de>
References: <201112211014.30695.heiko@sntech.de> <4F042D61.2070309@samsung.com> <201201041251.42509.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:40199 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753267Ab2ADONP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Jan 2012 09:13:15 -0500
In-Reply-To: <201201041251.42509.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com

Hi Kgene,

Am Mittwoch, 4. Januar 2012, 12:51:41 schrieb Heiko St=FCbner:
> Hi Sylwester,
>=20
> Am Mittwoch, 4. Januar 2012, 11:43:45 schrieb Sylwester Nawrocki:
> > Hello,
> >=20
> > On 12/21/2011 10:16 AM, Heiko St=FCbner wrote:
> > > Use the data field of of_device_id to hold the type for
> > > s3c_cpu_type.
> > >=20
> > > Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> > > Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>
> > > ---
> >=20
> > This patch makes compilation with CONFIG_OF enabled fail with error=
s
> > and warnings:
> >=20
> > drivers/rtc/rtc-s3c.c: In function =91s3c_rtc_get_driver_data=92:
> > drivers/rtc/rtc-s3c.c:454: warning: return makes integer from point=
er
> > without a cast
> > drivers/rtc/rtc-s3c.c: At top level:
> > drivers/rtc/rtc-s3c.c:674: error: request for member =91data=92 in =
something
> > not a structure or union
> > drivers/rtc/rtc-s3c.c:677: error: request for member =91data=92 in =
something
> > not a structure or union
> > drivers/rtc/rtc-s3c.c:680: error: request for member =91data=92 in =
something
> > not a structure or union
> > drivers/rtc/rtc-s3c.c:683: error: request for member =91data=92 in =
something
> > not a structure or union
> > make[2]: *** [drivers/rtc/rtc-s3c.o] Error 1
>=20
> thanks for spotting this.
>=20
> @kgene: Should this go on top of the rtc series, or should I prepare =
a v4
> with these fixes included?
never mind, I did both.

In reply to this mail you will find:
- a single patch on top of the 4 original patches, fixing the problems=20
sylwester reported
- a v4 of the original series including the fixes to the problems, base=
d on=20
the code that you have in your rtc-branch

Please pick the apropriate variant to fix the problem :-)

Heiko
