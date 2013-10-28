From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/6] Samsung cleanup for v3.13
Date: Sun, 27 Oct 2013 21:33:11 -0700
Message-ID: <20131028043311.GG22890@quad.lixom.net>
References: <526455CB.6050507@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:55432 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750998Ab3J1Edc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Oct 2013 00:33:32 -0400
Received: by mail-pd0-f180.google.com with SMTP id p10so6458866pdj.25
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Oct 2013 21:33:32 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <526455CB.6050507@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, arm@kernel.org

On Mon, Oct 21, 2013 at 07:14:35AM +0900, Kukjin Kim wrote:
> The following changes since commit 4a10c2ac2f368583138b774ca41fac4207911983:
> 
>   Linux 3.12-rc2 (2013-09-23 15:41:09 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-cleanup
> 
> for you to fetch changes up to ae3c5d74ea0d5e2f1c32c527e5de36c7614525af:
> 
>   ARM: EXYNOS: remove CONFIG_MACH_EXYNOS[4, 5]_DT config options
> (2013-10-21 06:35:47 +0900)

Thanks, pulled into next/cleanup. Trivial add/add conflict when merging
into for-next due to the 64xx DT platform, no big deal.


-Olof
