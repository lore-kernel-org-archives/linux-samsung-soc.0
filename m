From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v3 05/10] i2c: s3c2410: make header file local
Date: Fri, 12 Apr 2013 10:11:12 +0200
Message-ID: <201304121011.13028.arnd@arndb.de>
References: <1365716245-99231-1-git-send-email-arnd@arndb.de> <1365716245-99231-6-git-send-email-arnd@arndb.de> <201304112343.34534.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.187]:58616 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753870Ab3DLILW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 12 Apr 2013 04:11:22 -0400
In-Reply-To: <201304112343.34534.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?iso-8859-15?q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>, Ben Dooks <ben-linux@fluff.org>

On Thursday 11 April 2013, Heiko St=FCbner wrote:
> Am Donnerstag, 11. April 2013, 23:37:20 schrieb Arnd Bergmann:
> > No other file in the kernel besides i2c-s3c2410.c uses the current
> > plat/regs-iic.h, so we can simply move the header file to live in t=
he
> > same directory as the driver, as a preparation to multiplatform bui=
lds.
>=20
> There is already a patch doing similar changes [0] in the i2c tree fo=
r 3.10
>=20

Excellent, that patch is actually nicer than my version, thanks for tak=
ing
care of this! I'll drop my patch from the series then.

	Arnd
