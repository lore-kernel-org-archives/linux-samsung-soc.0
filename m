From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] MAINTAINERS: Add linux-samsung-soc mailing list for
 Samsung
Date: Tue, 15 Nov 2011 16:21:36 +0900
Message-ID: <003801cca367$360b7020$a2225060$%kim@samsung.com>
References: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:49278 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752119Ab1KOHVi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Nov 2011 02:21:38 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LUO004MMXOIV300@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:21:37 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LUO00JWBXS0AD80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 15 Nov 2011 16:21:37 +0900 (KST)
In-reply-to: <1320923776-26626-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com, akpm@linux-foundation.org

Mark Brown wrote:
> 
> There's a Samsung-specific mailing list but it's not advertised in
> MAINTAINERS - add it to the overall architecture to make it more
> discoverable.
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

I'm okay on this,
Acked-by: Kukjin Kim <kgene.kim@samsung.com>

(Cc'ed Andrew Morton)
Hi Andrew, could you please pick this up in your tree?

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> ---
>  MAINTAINERS |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c18b278..a21d4fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1046,6 +1046,7 @@ ARM/SAMSUNG ARM ARCHITECTURES
>  M:	Ben Dooks <ben-linux@fluff.org>
>  M:	Kukjin Kim <kgene.kim@samsung.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
>  W:	http://www.fluff.org/ben/linux/
>  S:	Maintained
>  F:	arch/arm/plat-samsung/
> --
> 1.7.7.2
