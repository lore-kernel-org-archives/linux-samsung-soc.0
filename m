From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Samsung fixes-3 for v3.6
Date: Mon, 17 Sep 2012 15:59:26 -0700
Message-ID: <CAOesGMiJGihDWpQbgJo9FYSM8FF0WY-B4PtnbE2uWwJcjWzjUA@mail.gmail.com>
References: <05be01cd9527$b35c3480$1a149d80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:54191 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754975Ab2IQW71 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 18:59:27 -0400
Received: by lagy9 with SMTP id y9so4552085lag.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Sep 2012 15:59:26 -0700 (PDT)
In-Reply-To: <05be01cd9527$b35c3480$1a149d80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi,


On Mon, Sep 17, 2012 at 3:56 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Hi Arnd and Olof,
>
> Here is second Samsung fixes for v3.6.
>
> This includes using spin_lock_irqsave in clk_set_parent() to avoid spinlock
> recursion and fixing wrong definitions.
>
> If any problems, please kindly let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> The following changes since commit 4cbe5a555fa58a79b6ecbb6c531b8bab0650778d:
>
>   Linux 3.6-rc4 (2012-09-01 10:39:58 -0700)
>
> are available in the git repository at:
>   git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.6-samsung-fixes-2
>
> Julia Lawall (1):
>       ARM: S3C24xx: delete double assignment
>
> Mandeep Singh Baines (1):
>       ARM: SAMSUNG: use spin_lock_irqsave() in clk_set_parent
>
> Peter Senna Tschudin (1):
>       ARM: S3C24XX: removes unnecessary semicolon
>
> Seung-Woo Kim (1):
>       ARM: EXYNOS: fixed SYSMMU setup definition to mate parameter name

We're very late in the release cycle for 3.6, and only critical fixes
should go in -- no cleanups. Please queue those in a
fixes-non-critical branch for 3.7 instead.

Only the one from Mandeep seems to be a real bug fix, I think?


-Olof
