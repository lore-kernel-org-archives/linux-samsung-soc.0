From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Subject: [PATCH] MAINTAINERS: add maintainer entry for SAMSUNG
 EXYNOS DeviceTree
Date: Wed, 22 Feb 2012 09:21:11 +0900
Message-ID: <CAH9JG2WRs=QJgEne8aWGTd1cj4tcU2LoQSdrLNqLE=2CooRd7A@mail.gmail.com>
References: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qw0-f46.google.com ([209.85.216.46]:46502 "EHLO
	mail-qw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751257Ab2BVAVM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 19:21:12 -0500
Received: by qadc10 with SMTP id c10so4932040qad.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 16:21:11 -0800 (PST)
In-Reply-To: <00f301ccf0f7$39f222a0$add667e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Thomas Abraham <thomas.abraham@linaro.org>, grant.likely@secretlab.ca, arnd@arndb.de

Hi,

I agree adding Thomas as DT maintainer. but I didn't see any activity
with Mr. Kim at least DT area.

Partially Ack.

On 2/22/12, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Add Samsung EXYNOS DT maintainer
>
> Cc: Thomas Abraham <thomas.abraham@linaro.org>
> Cc: Grant Likely <grant.likely@secretlab.ca>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  MAINTAINERS |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9a648eb..5ac5aaf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1065,6 +1065,16 @@ S:	Maintained
>  F:	arch/arm/mach-s5p*/
>  F:	arch/arm/mach-exynos*/
>
> +ARM/SAMSUNG EXYNOS DEVICE TREE
> +M:	Thomas Abraham <thomas.abraham@linaro.org>
> +M:	Kukjin Kim <kgene.kim@samsung.com>
> +L:	devicetree-discuss@lists.ozlabs.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	arch/arm/boot/dts/exynos*
> +F:	arch/arm/mach-exynos/*dt.c
> +F:	Documentation/devicetree/*/*/*samsung*
> +
>  ARM/SAMSUNG MOBILE MACHINE SUPPORT
>  M:	Kyungmin Park <kyungmin.park@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
