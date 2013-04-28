From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Late Samsung stuff (v3) for v3.10
Date: Sun, 28 Apr 2013 12:26:24 -0700
Message-ID: <20130428192624.GC22332@quad.lixom.net>
References: <51795CE8.2060105@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f52.google.com ([209.85.220.52]:51519 "EHLO
	mail-pa0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756392Ab3D1T02 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Apr 2013 15:26:28 -0400
Received: by mail-pa0-f52.google.com with SMTP id fb10so894258pad.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Apr 2013 12:26:27 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <51795CE8.2060105@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Thomas Abraham <thomas.ab@samsung.com>

On Fri, Apr 26, 2013 at 01:42:16AM +0900, Kukjin Kim wrote:
> The following changes since commit 59a7bbf75442ea439a4d3b7993ad87023e406063:
> 
>   ARM: dts: add PDMA0 changes for exynos5440 (2013-04-09 01:39:27 +0900)
> 
> are available in the git repository at:
> 

> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> tags/late-exynos-v3-for-v3.10
> 
> for you to fetch changes up to 096ee6adcfb79a13ae04150023725c8a67e00ae8:
> 
>   ARM: dts: Add chip-id controller node on Exynos4/5 SoC (2013-04-26
> 01:21:44 +0900)
> 
> ----------------------------------------------------------------
> This allows that device tree enables platform to setup a runtime IO
> mapping for the chip id
> 

Thanks, pulled into late/dt.


-Olof
