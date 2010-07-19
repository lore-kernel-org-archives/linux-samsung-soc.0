From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 1/7] ARM: S5PV210: Add a Kconfig entry
 "S5PC110_EVT0_WORKAROUND"
Date: Mon, 19 Jul 2010 16:59:01 +0900
Message-ID: <002c01cb2718$46fcc4a0$d4f64de0$%kim@samsung.com>
References: <1279517483-22751-1-git-send-email-myungjoo.ham@samsung.com>
 <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:36297 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756782Ab0GSH7E (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Jul 2010 03:59:04 -0400
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0L5S00FZUOUEWBC0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 16:59:02 +0900 (KST)
Received: from kgenekim ([12.23.103.96])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0L5S0060COUERO@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 19 Jul 2010 16:59:02 +0900 (KST)
In-reply-to: <1279517483-22751-2-git-send-email-myungjoo.ham@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'MyungJoo Ham' <myungjoo.ham@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: kyungmin.park@samsung.com, myungjoo.ham@gmail.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

MyungJoo Ham wrote:
> 
> Early S5PC110 (EVT0) chip had some issues required workaround from a
> kernel. We can add such workaround codes with this Kconfig entry.
> 
> Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s5pv210/Kconfig |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 631019a..18802e7 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -101,4 +101,11 @@ config MACH_SMDKC110
>  	  Machine support for Samsung SMDKC110
>  	  S5PC110(MCP) is one of package option of S5PV210
> 
> +config S5PC110_EVT0_WORKAROUND
> +	bool "S5PC110 Early Chip Workaround (EVT0)"
> +	help
> +	  Early S5PC110 (so called EVT0) has errata items that should be
> +	  addressed; otherwise the kernel may panic or be locked up. Enable
> +	  this option to execute workaround instructions.
> +
>  endif
> --

As I said earlier, EVT0 is not real chip and not for mass production.

Why do you submit the EVT0 patch which can only available for you?
It is better to not add code into mainline that is not going to be used.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
