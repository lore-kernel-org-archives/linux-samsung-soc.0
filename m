From: Sergei Shtylyov <sshtylyov@mvista.com>
Subject: Re: [PATCH V2 2/5] include/video: Add Exynos5 specific FIMD register
 offsets
Date: Tue, 31 Jul 2012 16:51:35 +0400
Message-ID: <5017D4D7.3040303@mvista.com>
References: <1343737385-23337-1-git-send-email-l.krishna@samsung.com> <1343737385-23337-3-git-send-email-l.krishna@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:57645 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753636Ab2GaMwb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Jul 2012 08:52:31 -0400
Received: by lbbgm6 with SMTP id gm6so4085386lbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 31 Jul 2012 05:52:30 -0700 (PDT)
In-Reply-To: <1343737385-23337-3-git-send-email-l.krishna@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Leela Krishna Amudala <l.krishna@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org, kgene.kim@samsung.com, jg1.han@samsung.com, joshi@samsung.com, dri-devel@lists.freedesktop.org, inki.dae@samsung.com, ben-linux@fluff.org, m.szyprowski@samsung.com

Hello.

On 31-07-2012 16:23, Leela Krishna Amudala wrote:

> Exynos5 has VIDTCON and VIDCON registers at different offsets
> from the previous SOCs. Hence, adding the macros.

> Signed-off-by: Leela Krishna Amudala <l.krishna@samsung.com>
> ---
>   include/video/samsung_fimd.h |    7 +++++++
>   1 files changed, 7 insertions(+), 0 deletions(-)

> diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
> index e979f42..820f190 100644
> --- a/include/video/samsung_fimd.h
> +++ b/include/video/samsung_fimd.h
> @@ -524,3 +524,10 @@
>    * 1110		-none-	 -none-	  -none-   -none-    -none-
>    * 1111		-none-	 -none-   -none-   -none-    -none-
>   */
> +
> +/*EXYNOS5 FIMD REG OFFSET */
> +#define EXYNOS5_VIDTCON0	(0x20010)
> +#define EXYNOS5_VIDTCON1	(0x20014)
> +#define EXYNOS5_VIDTCON2	(0x20018)
> +#define EXYNOS5_VIDTCON3	(0x2001C)
> +#define EXYNOS5_VIDCON1		(0x20004)

    Parens not needed around simple literals.

WBR, Sergei
