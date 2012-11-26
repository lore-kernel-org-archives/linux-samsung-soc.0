From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 1/3] Samsung devel-2 for v3.8
Date: Sun, 25 Nov 2012 23:53:23 -0800
Message-ID: <20121126075323.GF9580@quad.lixom.net>
References: <10d601cdc91b$1a5e73b0$4f1b5b10$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f46.google.com ([209.85.210.46]:42840 "EHLO
	mail-da0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753908Ab2KZHx0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Nov 2012 02:53:26 -0500
Received: by mail-da0-f46.google.com with SMTP id p5so3600495dak.19
        for <linux-samsung-soc@vger.kernel.org>; Sun, 25 Nov 2012 23:53:26 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <10d601cdc91b$1a5e73b0$4f1b5b10$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Kgene,

On Fri, Nov 23, 2012 at 10:37:30AM +0900, Kukjin Kim wrote:
> Hi Arnd, Olof
> 
> Here is second Samsung development patches for v3.8.

Please start sorting your branches more. When someone sends in a large
"devel" branch, it doesn't fit our tree organization very well. The
branch below contains fixes, new features and cleanups all in one branch.

> This includes properly enabling PM support and UART3 DEBUG_LL for exynos5
> and CAMIF for s3c24xx/s3c64xx.

"Properly enabling PM support" sounds like worthy of a branch on its own,
for example.



-Olof
