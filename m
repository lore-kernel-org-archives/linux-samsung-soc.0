From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [GIT PULL 08/10] secure-exynos for v3.10
Date: Tue, 9 Apr 2013 22:52:50 +0200
Message-ID: <201304092252.50718.arnd@arndb.de>
References: <51630A36.6030505@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.171]:53742 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S936264Ab3DIUwy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Apr 2013 16:52:54 -0400
In-Reply-To: <51630A36.6030505@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Olof Johansson' <olof@lixom.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Monday 08 April 2013, Kukjin Kim wrote:
> 
> The following changes since commit da821eb7d42935b0f7056d98c75fd1150f6636f4:
> 
>    Merge commit 'v3.9-rc5' into next/clk-exynos (2013-04-09 01:10:13 +0900)
> 
> are available in the git repository at:
> 
> 
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git 
> tags/secure-exynos-for-v3.10
> 
> for you to fetch changes up to beddf63fc8e01f06799bd6d7a2dd879885bbc9c6:
> 
>    ARM: EXYNOS: Add secure firmware support to secondary CPU bring-up 
> (2013-04-09 01:52:30 +0900)

I've created a separate top-level branch next/firmware for this, since
we are waiting for a similar pull request from Broadcom.

	Arnd
