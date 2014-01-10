From: kgene@kernel.org
Subject: RE: [PATCH] ARM: SAMSUNG: remove obsolete tick.h
Date: Fri, 10 Jan 2014 17:17:43 +0900
Message-ID: <093801cf0ddc$6f8fe060$4eafa120$@kernel.org>
References: <1907750.XQ1uIOEDlS@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56927 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750989AbaAJIRq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Jan 2014 03:17:46 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MZ600LK4F1LGC20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Jan 2014 17:17:45 +0900 (KST)
In-reply-to: <1907750.XQ1uIOEDlS@phil>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Commit 48cf83dc12f2 (ARM: samsung: remove unused tick.h) removed some
> occurences of tick.h. tick.h itself and s3c24xx_ostimer_pending was o=
nly
> used by the old timer driver and is not used anymore.
>=20
> Therefore remove the last 3 occurences.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/arm/mach-s3c24xx/include/mach/tick.h |   15 --------------
>  arch/arm/mach-s3c64xx/include/mach/tick.h |   31
-------------------------
> ----
>  arch/arm/mach-s5pc100/include/mach/tick.h |   31
-------------------------
> ----
>  3 files changed, 77 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/tick.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/tick.h
>  delete mode 100644 arch/arm/mach-s5pc100/include/mach/tick.h
>=20
Nice cleanup :-)

Applied, thanks,
Kukjin
