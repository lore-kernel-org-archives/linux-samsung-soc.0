From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: Subject: [PATCH] MAINTAINERS: add maintainer entry for SAMSUNG
 EXYNOS DeviceTree
Date: Wed, 22 Feb 2012 07:49:18 +0530
Message-ID: <CAJuYYwSqGDmuXrtBscCSFoQEOpWCQ-1H+2dHxeUYny7KwUPLOg@mail.gmail.com>
References: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:56260 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755206Ab2BVCTT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 21:19:19 -0500
Received: by vbjk17 with SMTP id k17so4636743vbj.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 18:19:18 -0800 (PST)
In-Reply-To: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, grant.likely@secretlab.ca, arnd@arndb.de

On 22 February 2012 05:46, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Add Samsung EXYNOS DT maintainer
>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0MAINTAINERS | =A0 10 ++++++++++
> =A01 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a648eb..5ac5aaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1065,6 +1065,16 @@ S: =A0 =A0 =A0 Maintained
> =A0F: =A0 =A0 arch/arm/mach-s5p*/
> =A0F: =A0 =A0 arch/arm/mach-exynos*/
>
> +ARM/SAMSUNG EXYNOS DEVICE TREE
> +M: =A0 =A0 Thomas Abraham <thomas.abraham@linaro.org>
> +M: =A0 =A0 Kukjin Kim <kgene.kim@samsung.com>
> +L: =A0 =A0 devicetree-discuss@lists.ozlabs.org (moderated for non-su=
bscribers)
> +L: =A0 =A0 linux-samsung-soc@vger.kernel.org (moderated for non-subs=
cribers)
> +S: =A0 =A0 Maintained
> +F: =A0 =A0 arch/arm/boot/dts/exynos*
> +F: =A0 =A0 arch/arm/mach-exynos/*dt.c
> +F: =A0 =A0 Documentation/devicetree/*/*/*samsung*
> +

Acked-by: Thomas Abraham <thomas.abraham@linaro.org>

Thanks,
Thomas.

> =A0ARM/SAMSUNG MOBILE MACHINE SUPPORT
> =A0M: =A0 =A0 Kyungmin Park <kyungmin.park@samsung.com>
> =A0L: =A0 =A0 linux-arm-kernel@lists.infradead.org (moderated for non=
-subscribers)
> --
> 1.7.1
>
