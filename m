From: Jingoo Han <jg1.han@samsung.com>
Subject: RE: [PATCH V2 2/5] include/video: Add Exynos5 specific FIMD register
 offsets
Date: Wed, 01 Aug 2012 10:49:38 +0900
Message-ID: <003301cd6f87$e8ed8240$bac886c0$%han@samsung.com>
References: <1343737385-23337-1-git-send-email-l.krishna@samsung.com>
 <1343737385-23337-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:54636 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752961Ab2HABtj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 21:49:39 -0400
In-reply-to: <1343737385-23337-3-git-send-email-l.krishna@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Leela Krishna Amudala' <l.krishna@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, ben-linux@fluff.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, m.szyprowski@samsung.com, 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Jingoo Han' <jg1.han@samsung.com>

On Tuesday, July 31, 2012 9:23 PM Leela Krishna Amudala wrote:
> 
> Exynos5 has VIDTCON and VIDCON registers at different offsets
> from the previous SOCs. Hence, adding the macros.
> 
> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>  include/video/samsung_fimd.h |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index e979f42..820f190 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -524,3 +524,10 @@
>   * 1110		-none-	 -none-	  -none-   -none-    -none-
>   * 1111		-none-	 -none-   -none-   -none-    -none-
>  */
> +
> +/*EXYNOS5 FIMD REG OFFSET */
     ^
Please insert one space between '/*' and 'EXYNOS5'.
As Sylwester Nawrocki mentioned, the following seems to be better.

/* EXYNOS5 specific register offset definitions */


Best regards,
Jingoo Han


> +#define EXYNOS5_VIDTCON0	(0x20010)
> +#define EXYNOS5_VIDTCON1	(0x20014)
> +#define EXYNOS5_VIDTCON2	(0x20018)
> +#define EXYNOS5_VIDTCON3	(0x2001C)
> +#define EXYNOS5_VIDCON1		(0x20004)
> --
> 1.7.0.4
