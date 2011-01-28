From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 3/3] ARM: S5PV210: Change framebuffer window 0 size on GONI
Date: Fri, 28 Jan 2011 18:35:51 +0900
Message-ID: <02e201cbbece$c4812710$4d837530$%kim@samsung.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
 <1294419468-13700-4-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62913 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751149Ab1A1Jf7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 04:35:59 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LFQ00LJX7ZY6A10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jan 2011 18:35:58 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LFQ00GP87ZY8D@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Jan 2011 18:35:58 +0900 (KST)
In-reply-to: <1294419468-13700-4-git-send-email-s.nawrocki@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Increase virtual size of the frambuffer window 0
> for the display panning support.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/mach-goni.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
b/arch/arm/mach-s5pv210/mach-
> goni.c
> index 2051cee..ed06f20 100644
> --- a/arch/arm/mach-s5pv210/mach-goni.c
> +++ b/arch/arm/mach-s5pv210/mach-goni.c
> @@ -108,6 +108,8 @@ static struct s3c_fb_pd_win goni_fb_win0 = {
>  	},
>  	.max_bpp	= 32,
>  	.default_bpp	= 16,
> +	.virtual_x	= 480,
> +	.virtual_y	= 2 * 800,
>  };
> 
>  static struct s3c_fb_platdata goni_lcd_pdata __initdata = {
> --
> 1.7.3.5

Looks ok...but I want to apply with your other 1/3 and 2/3 patches.
Will apply this after getting your other patches.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
