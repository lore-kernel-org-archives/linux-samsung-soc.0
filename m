From: Joonyoung Shim <jy0922.shim@samsung.com>
Subject: Re: [libdrm] improvements to userspace exynos component
Date: Wed, 11 Feb 2015 10:11:21 +0900
Message-ID: <54DAAC39.2040803@samsung.com>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:16424 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750813AbbBKBLW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Feb 2015 20:11:22 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NJL00EUX1YWEL40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 11 Feb 2015 10:11:20 +0900 (KST)
In-reply-to: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>, linux-samsung-soc@vger.kernel.org
Cc: robclark@freedesktop.org, dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com

Hi,

On 02/03/2015 10:53 PM, Tobias Jakobi wrote:
> Hello,
> 
> here are some miscellaneous improvements (small features, bugfixes, spelling fixes, etc.) for the exynos component of libdrm. The general idea is to let userspace use the G2D engine functionality more 
> efficiently.
> 
> If someone is interested in an application that actually makes use of this, the RetroArch frontend has a custom video backend:
> https://github.com/libretro/RetroArch/blob/master/gfx/drivers/exynos_gfx.c
> 
> 
> Please review and let me know what I can improve.
> 

Working well on odroid u3 board.

Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>
