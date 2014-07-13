From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for 3.16
Date: Sat, 12 Jul 2014 21:19:45 -0700
Message-ID: <20140713041945.GA14076@quad.lixom.net>
References: <53C1B549.1060706@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f44.google.com ([209.85.220.44]:51278 "EHLO
	mail-pa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbaGMETW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 13 Jul 2014 00:19:22 -0400
Received: by mail-pa0-f44.google.com with SMTP id rd3so3596367pab.3
        for <linux-samsung-soc@vger.kernel.org>; Sat, 12 Jul 2014 21:19:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <53C1B549.1060706@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "arm@kernel.org" <arm@kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Sun, Jul 13, 2014 at 07:23:05AM +0900, Kukjin Kim wrote:
> The following changes since commit cd3de83f147601356395b57a8673e9c5ff1e59d1:
> 
>   Linux 3.16-rc4 (2014-07-06 12:37:51 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-fixes-3
> 
> for you to fetch changes up to bed7118988ef48063c72f67cc2701c72663b3870:
> 
>   ARM: EXYNOS: Register cpuidle device only on exynos4210 and 5250
> (2014-07-11 08:15:32 +0900)
> 
> ----------------------------------------------------------------
> Samsung fixes-3 for v3.16
> - update the parent for Auudss clock because kernel will be hang
>   during late boot if the parent clock is disabled in bootloader.
> - enable clk handing in power domain because while power domain
>   on/off, its regarding clock source will be reset and it causes
>   a problem so need to handle it.
> - add mux clocks to be used by power domain for exynos5420-mfc
>   during power domain on/off and property in device tree also.
> - register cpuidle only for exynos4210 and exynos5250 because a
>   system failure will be happened on other exynos SoCs.

Pulled, thanks.

-Olof
