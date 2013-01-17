From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for v3.8
Date: Wed, 16 Jan 2013 16:22:37 -0800
Message-ID: <CAOesGMiRSUbsnP2cCC=Ur9zL1CG9HGT0AQZ_fMktL+QAUmiDzA@mail.gmail.com>
References: <0c0301cdf447$109e7d50$31db77f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:39416 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752839Ab3AQAWh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Jan 2013 19:22:37 -0500
Received: by mail-ie0-f171.google.com with SMTP id 17so3796636iea.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Jan 2013 16:22:37 -0800 (PST)
In-Reply-To: <0c0301cdf447$109e7d50$31db77f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: arnd@arndb.de, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,

On Wed, Jan 16, 2013 at 4:10 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd, Olof
>
> Here is Samsung fixes for v3.8, please pull from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.8-samsung-fixes-3
>
> That branch fixes build warnings and error for S3C24XX/S3C64xx. And corrects
> dw-mshc properties on EXYNOS5 DT and fixes IRQ mapping on Cragganmore board.
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> - Kukjin
>
> The following changes since commit 9931faca02c604c22335f5a935a501bb2ace6e20:
>
>   Linux 3.8-rc3 (2013-01-09 18:59:55 -0800)
>
> are available in the git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.8-samsung-fixes-3
>
> for you to fetch changes up to cd9a8934a28d604ffb62e80ab08ba12fab128a1e:
>
>   ARM: S3C24XX: Make 'clk_msysclk' static (2013-01-16 15:53:48 -0800)
>
> ----------------------------------------------------------------
> Alim Akhtar (1):
>       ARM: dts: correct the dw-mshc timing properties as per binding
>
> Dimitris Papastamos (1):
>       ARM: S3C64XX: Fix up IRQ mapping for balblair on Cragganmore
>
> Sachin Kamat (2):
>       ARM: S3C24XX: Fix warnings in irq-s3c2416.c
>       ARM: S3C24XX: Make 'clk_msysclk' static

Those two are sparse fixes, please queue for 3.9 instead.


-Olof
