From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-4 for v3.8
Date: Tue, 29 Jan 2013 10:36:18 -0800
Message-ID: <20130129183618.GA19906@quad.lixom.net>
References: <06c601cdfe4b$01ef8890$05ce99b0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f42.google.com ([209.85.160.42]:42705 "EHLO
	mail-pb0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753033Ab3A2SgU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 13:36:20 -0500
Received: by mail-pb0-f42.google.com with SMTP id wz17so446328pbc.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 10:36:20 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <06c601cdfe4b$01ef8890$05ce99b0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Jan 29, 2013 at 10:03:54AM -0800, Kukjin Kim wrote:
> Hi Arnd and Olof,
> 
> Here is a pull request for Samsung fixes-4 for v3.8.
> 
> This fixes compatible values for exynos pinctrl and crash on soft reset,
> tick and alarm irq numbers on exynos5440 and uninitialized variable on
> s3c24xx.
> 
> If any problems, please kindly let me know.
> 
> Thanks.
> 
> - Kukjin
> 
> The following changes since commit 949db153b6466c6f7cad5a427ecea94985927311:
> 
>   Linux 3.8-rc5 (2013-01-25 11:57:28 -0800)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.8-samsung-fixes-4

Pulled, but...

> for you to fetch changes up to 60db7e5f9c9a25a7a9b01007e6e3f5a93bc16a3a:
> 
>   ARM: EXYNOS: Fix crash on soft reset on EXYNOS5440 (2013-01-28 14:27:50
> -0800)
> 
> ----------------------------------------------------------------
> Cong Ding (1):
>       ARM: S3C24XX: fix uninitialized variable warning

Hm, that whole loop looks bogus. The compiler is still free to optimize
it away since 'tmp' isn't actually used anywhere. It's just not good
enough at it yet.  :)


-Olof
