From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 1/7] Samsung fixes for v3.7
Date: Fri, 30 Nov 2012 20:06:19 +0900
Message-ID: <1d7601cdceea$b96d7580$2c486080$%kim@samsung.com>
References: <50B55783.3020509@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:56544 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755918Ab2K3LGW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 30 Nov 2012 06:06:22 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MEA00HJES6JBW30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Nov 2012 20:06:21 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MEA008I4S6JEG10@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 30 Nov 2012 20:06:19 +0900 (KST)
In-reply-to: <50B55783.3020509@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, 'Arnd Bergmann' <arnd@arndb.de>, 'Olof Johansson' <olof@lixom.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Kukjin Kim wrote:
> 
> Hi Arnd, Olof,
> 
Hi,

> I sorted out my branches as per Olof's suggestion
> 
I checked only merged this into arm-soc tree.

Any problems on 2nd ~ 7th pull request? Or missed? ;-)

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.

> It includes a fix for v3.7 but I think this is not a critical so it's ok
> to me for v3.8.
> 
> Please pull from:
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.7-samsung-fixes-4
> 
> Thanks.
> 
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
> 
> The following changes since commit
> f4a75d2eb7b1e2206094b901be09adb31ba63681:
> 
>    Linux 3.7-rc6 (2012-11-16 17:42:40 -0800)
> 
> are available in the git repository at:
>    git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> v3.7-samsung-fixes-4
> 
> Sachin Kamat (1):
>        ARM: S3C24XX: Fix potential NULL pointer dereference error
> 
>   arch/arm/plat-s3c24xx/dma.c |    9 +++++----
>   1 files changed, 5 insertions(+), 4 deletions(-)
