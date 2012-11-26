From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 3/3] Samsung exynos5440 for v3.8
Date: Mon, 26 Nov 2012 00:32:32 -0800
Message-ID: <20121126083232.GH9580@quad.lixom.net>
References: <10d401cdc91b$09fe1980$1dfa4c80$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:47129 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754437Ab2KZIcf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 03:32:35 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so7845077pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Nov 2012 00:32:35 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <10d401cdc91b$09fe1980$1dfa4c80$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Fri, Nov 23, 2012 at 10:37:03AM +0900, Kukjin Kim wrote:
> Arnd, Olof,
> 
> This is adding support for exynos5440, including Quad ARM Cortex-A15 cores
> and its reference board SSDK5440.
> 
> Note, at this moment, just enabled minimal system part for initial kernel
> boot and pinctrl driver.
> 
> Please pull from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> next/soc-exynos5440

Merged. This caused some new conflicts with previous samsung contents, since
you add DT contents in several branches, etc. Please try to work on getting
your amount of conflicts down a bit.

If you want a good example to look at, see how Tony Lindgren handles OMAP.
He's juggling a large number of topics with nearly no conflicts left
for us to resolve at our level, by making sure new work is based on
appropriate base branches.


-Olof
