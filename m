From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/6] exynos arch
Date: Wed, 12 Jun 2013 16:25:26 -0700
Message-ID: <20130612232526.GA9067@quad.lixom.net>
References: <51B791E0.5040104@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f47.google.com ([209.85.220.47]:37875 "EHLO
	mail-pa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758091Ab3FLXZW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 19:25:22 -0400
Received: by mail-pa0-f47.google.com with SMTP id kl14so4043248pab.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 Jun 2013 16:25:21 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51B791E0.5040104@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Wed, Jun 12, 2013 at 06:08:48AM +0900, Kukjin Kim wrote:
> The following changes since commit 317ddd256b9c24b0d78fa8018f80f1e495481a10:
> 
>   Linux 3.10-rc5 (2013-06-08 17:41:04 -0700)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/exynos-arch-1
> 
> for you to fetch changes up to d75666024bbb7d1b4fa6f0b00ecd8d834033259a:
> 
>   ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor
> (2013-06-10 18:28:04 +0900)
> 
> ----------------------------------------------------------------
> update exynos arch part

Kukjin, please, write proper tag messages. This adds no value. Give a brief
overview of what's in the branch instead.

> ----------------------------------------------------------------
> Doug Anderson (1):
>       ARM: EXYNOS: Select PINCTRL_EXYNOS for exynos4/5 at chip level
> 
> Girish K S (1):
>       ARM: EXYNOS: force MAC ip to 32bit DMA
> 
> Kukjin Kim (1):
>       ARM: EXYNOS: no more support non-DT for EXYNOS SoCs
> 
> Leela Krishna Amudala (1):
>       ARM: EXYNOS: call scu_enable() only in case of cortex-A9 processor
> 
> Thomas Abraham (1):
>       ARM: EXYNOS: Add a platform bus notifier to set dma masks for
> Exynos5440

This one has outstanding comments from Russell that were not addressed?


Not pulled.


-Olof
