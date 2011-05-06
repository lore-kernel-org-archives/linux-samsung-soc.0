From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S3C64XX: Remove gpio-bank-X header files
Date: Fri, 06 May 2011 13:59:33 +0900
Message-ID: <00fb01cc0baa$6a728e20$3f57aa60$%kim@samsung.com>
References: <1303972369-17563-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:30879 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751303Ab1EFE7z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 May 2011 00:59:55 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LKR008JYCJ7OKF0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 May 2011 13:59:44 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LKR00M3ECJKMC@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 May 2011 13:59:44 +0900 (KST)
In-reply-to: <1303972369-17563-1-git-send-email-jy0922.shim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Joonyoung Shim' <jy0922.shim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kmpark@infradead.org, ben-linux@fluff.org

Joonyoung Shim wrote:
> 
> The gpio-bank-X header files of S3C64XX have defines which can be
> substituted by more common API, so they can be removed. This is compile
> tested only.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-s3c64xx/dev-spi.c                  |   20 ++----
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-a.h |   48 --------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-b.h |   60 -----------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-c.h |   53 ---------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-d.h |   49 --------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-e.h |   44 -------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-f.h |   71
--------------------
> -
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-g.h |   42 ------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-h.h |   74
--------------------
> --
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-i.h |   40 ------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-j.h |   36 -----------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-n.h |   54 ----------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-o.h |   70
--------------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-p.h |   69
--------------------
>  arch/arm/mach-s3c64xx/include/mach/gpio-bank-q.h |   46 -------------
>  arch/arm/mach-s3c64xx/mach-smdk6410.c            |    1 -
>  arch/arm/mach-s3c64xx/pm.c                       |   34 ++++++-----
>  arch/arm/mach-s3c64xx/setup-i2c0.c               |    7 +--
>  arch/arm/mach-s3c64xx/setup-i2c1.c               |    7 +--
>  arch/arm/mach-s3c64xx/sleep.S                    |    8 ++-
>  20 files changed, 37 insertions(+), 796 deletions(-)
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-a.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-b.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-c.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-d.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-e.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-f.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-g.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-h.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-i.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-j.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-n.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-o.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-p.h
>  delete mode 100644 arch/arm/mach-s3c64xx/include/mach/gpio-bank-q.h
> 

Looks ok to me, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
