From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: SAMSUNG: remove obsolete tick.h
Date: Wed, 08 Jan 2014 01:49:18 +0100
Message-ID: <2341825.uZDBWhHeIh@flatron>
References: <1907750.XQ1uIOEDlS@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f173.google.com ([209.85.215.173]:46601 "EHLO
	mail-ea0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752310AbaAHAtY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 19:49:24 -0500
Received: by mail-ea0-f173.google.com with SMTP id o10so512119eaj.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jan 2014 16:49:23 -0800 (PST)
In-Reply-To: <1907750.XQ1uIOEDlS@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On Tuesday 07 of January 2014 21:53:51 Heiko St=FCbner wrote:
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
>  arch/arm/mach-s3c64xx/include/mach/tick.h |   31 -------------------=
----------
>  arch/arm/mach-s5pc100/include/mach/tick.h |   31 -------------------=
----------
>  3 files changed, 77 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c24xx/include/mach/tick.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/tick.h
>  delete mode 100644 arch/arm/mach-s5pc100/include/mach/tick.h

Thanks for cleaning this up.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
