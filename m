From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C24XX: add support for second irq set of S3C2416
Date: Sun, 20 May 2012 01:05:05 +0900
Message-ID: <4FB7C4B1.7050805@samsung.com>
References: <201203032219.45813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:48392 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750915Ab2ESQFM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 May 2012 12:05:12 -0400
Received: by dady13 with SMTP id y13so5051978dad.19
        for <linux-samsung-soc@vger.kernel.org>; Sat, 19 May 2012 09:05:11 -0700 (PDT)
In-Reply-To: <201203032219.45813.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 03/04/12 06:19, Heiko St=FCbner wrote:
> The S3C2416 has a separate second interrupt register-set to support
> additional irqs. This patch adds the necessary constants and register=
s
> the irq handlers for it.
>
> Signed-off-by: Heiko Stuebner<heiko@sntech.de>
> ---
> Patch should go on top of the current s3c24xx consolidation
>
>   arch/arm/mach-s3c24xx/include/mach/irqs.h    |   15 ++++-
>   arch/arm/mach-s3c24xx/irq-s3c2416.c          |   98 +++++++++++++++=
+++++++++++
>   arch/arm/mach-s3c24xx/s3c2416.c              |    1 +
>   arch/arm/plat-samsung/include/plat/s3c2416.h |    3 +
>   4 files changed, 116 insertions(+), 1 deletions(-)
>
Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
