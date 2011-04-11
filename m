From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/3] ARM: S5PV210: Add PCM audio support for WM8580
Date: Mon, 11 Apr 2011 18:05:48 +0900
Message-ID: <004001cbf827$ab39b550$01ad1ff0$%kim@samsung.com>
References: <1302314281-11466-1-git-send-email-sbkim73@samsung.com>
 <1302314281-11466-3-git-send-email-sbkim73@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:43004 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752326Ab1DKJF7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 05:05:59 -0400
Received: from epmmp1 (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LJH00E87D9XNZ20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 18:05:57 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LJH000U8D9WIQ@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Apr 2011 18:05:57 +0900 (KST)
In-reply-to: <1302314281-11466-3-git-send-email-sbkim73@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sangbeom Kim' <sbkim73@samsung.com>, alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc: jassisinghbrar@gmail.com, lrg@slimlogic.co.uk, broonie@opensource.wolfsonmicro.com, ben-linux@fluff.org

Sangbeom Kim wrote:
> 
> This patch add pcm audio configuration for SMDKV210 and SMDKC110.
> Platform device and pcm clock initialization code is added.
> 
> Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
> ---

(snip)

> @@ -0,0 +1,45 @@
> +/* arch/arm/mach-s5pv210/include/mach/regs-clock.h

arch/arm/mach-s5pv210/include/mach/regs-audss.h ?

(snip)

> +/* CLKSRC0 */
> +#define S5P_AUDSS_CLKSRC_MAIN_MASK	(0x1<<0)
> +#define S5P_AUDSS_CLKSRC_MAIN_SHIFT	(0)

Firstly, the blank should be added around "<<" like following.
+#define S5P_AUDSS_CLKSRC_MAIN_MASK	(0x1 << 0)

Secondly, if you want to use XXX_SHIFT, please use like following.
+#define S5P_AUDSS_CLKSRC_MAIN_SHIFT	(0)
+#define S5P_AUDSS_CLKSRC_MAIN_MASK	(0x1 << S5P_AUDSS_CLKSRC_MAIN_SHIFT)

Finally, if the definition is not used anywhere, please don't add it.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
