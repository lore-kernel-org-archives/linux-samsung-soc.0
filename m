From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 5/7] Samsung irq for v3.14
Date: Sun, 22 Dec 2013 14:09:28 -0800
Message-ID: <20131222220928.GE13365@quad.lixom.net>
References: <52AE0F8C.3040408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:51877 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262Ab3LVWLg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Dec 2013 17:11:36 -0500
Received: by mail-pd0-f179.google.com with SMTP id r10so4520130pdi.38
        for <linux-samsung-soc@vger.kernel.org>; Sun, 22 Dec 2013 14:11:36 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <52AE0F8C.3040408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Kevin Hilman <khilman@linaro.org>, arm@kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Mon, Dec 16, 2013 at 05:22:36AM +0900, Kukjin Kim wrote:
> The following changes since commit 6ce4eac1f600b34f2f7f58f9cd8f0503d79e42ae:
> 
>   Linux 3.13-rc1 (2013-11-22 11:30:55 -0800)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/samsung-irq
> 
> for you to fetch changes up to 9403ac88220d79f8822e22c875ad1ebd7ffbea6f:
> 
>   irqchip: exynos-combiner: remove hard-coded irq_base value
> (2013-12-02 07:15:51 +0900)

Pulled into next/drivers. This should probably have gone through the irqchip
maintainer though. The patch is small so I took it anyway.


-Olof
