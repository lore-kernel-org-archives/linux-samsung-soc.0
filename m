From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: EXYNOS: pmu: Constify data tables
Date: Mon, 09 Dec 2013 14:14:45 +0100
Message-ID: <1922780.plAOmhqzpW@amdc1227>
References: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:19163 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932631Ab3LINO5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Dec 2013 08:14:57 -0500
In-reply-to: <1384971686-7208-1-git-send-email-djkurtz@chromium.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Kurtz <djkurtz@chromium.org>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Heiko Stuebner <heiko@sntech.de>, Amit Daniel Kachhap <amit.daniel@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Doug Andersen <dianders@chromium.org>

Hi Daniel,

On Thursday 21 of November 2013 02:21:24 Daniel Kurtz wrote:
> These tables are all immutable, make them const to save 4416 bytes of RAM.
> 
> size arch/arm/mach-exynos/pmu.o
>    text	   data	    bss
>     848	   4420	      4		// before
>    5264	      4	      4		// after

I'm not sure where the mentioned saving of RAM is. Moving data between
sections is not supposed to make it use less memory, I believe.

Anyway, it's a good practice to mark constant data as const, to disallow
changing them at runtime by mistake, so the patch is fine. Except some
issues I commented on inline.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
