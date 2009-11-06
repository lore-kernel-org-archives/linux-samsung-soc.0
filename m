From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH 08/17] ARM: S5PC1XX: add cpu idle and system reset
	support
Date: Fri, 6 Nov 2009 12:26:44 +0900
Message-ID: <20091106032644.GL3913@prithivi.gnumonks.org>
References: <1255421482-26455-1-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-2-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-3-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-4-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-5-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-6-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-7-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-8-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-9-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60367 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756537AbZKFDdF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2009 22:33:05 -0500
Content-Disposition: inline
In-Reply-To: <1255421482-26455-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

On Tue, Oct 13, 2009 at 10:11:13AM +0200, Marek Szyprowski wrote:
> Add CPU idle support by a call to SoC build-in power management core.
> Add system reset support by a simple write to system controll register.

looks great, and is definitely an improvement.

However, one small comment:

>  static void arch_reset(char mode, const char *cmd)
>  {
> -	/* nothing here yet */
> -}
> +	unsigned long reset;
>  
> +	reset = 0xc100;
> +	__raw_writel(reset, S5PC1XX_VA_CLK_OTHER);
> +	return;
> +}

why do we first define an unsigned long reset and then set it to some magic
value?  why not simply make this one line like 
	__raw_writel(0xc100, S5PC1XX_VA_CLK_OTHER);

also, it might be a good idea to use some #define values rather than the 0xc100
magic value.
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
