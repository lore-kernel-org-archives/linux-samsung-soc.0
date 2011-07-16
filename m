From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/2] ARM: Samsung: I2C code cleanup
Date: Sat, 16 Jul 2011 13:40:18 +0900
Message-ID: <037101cc4372$7b875060$7295f120$%kim@samsung.com>
References: <1309519992-3026-1-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:25119 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751117Ab1GPEk2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 16 Jul 2011 00:40:28 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LOE00H21SZE4D10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 13:40:26 +0900 (KST)
Received: from kgenekim ([12.23.119.139])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LOE00FSBSZEA6@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 16 Jul 2011 13:40:26 +0900 (KST)
In-reply-to: <1309519992-3026-1-git-send-email-ch.naveen@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, sbkim73@samsung.com, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Naveen Krishna Chatradhi wrote:
> 
> Does the same job, while saving few lines of code.
> 
>  o To Kukjin Kim, Sangbeom Kim and Ben Dooks
> 
> Naveen Krishna Chatradhi (2):
>   ARM: Samsung: Use generic set_plat_data function
>   ARM: Samsung: Cleanup I2C code in plat-samsung
> 
>  arch/arm/plat-samsung/dev-i2c0.c         |   14 ++++++--------
>  arch/arm/plat-samsung/dev-i2c1.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c2.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c3.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c4.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c5.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c6.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/dev-i2c7.c         |   24 ++++++++----------------
>  arch/arm/plat-samsung/include/plat/iic.h |    2 ++
>  9 files changed, 64 insertions(+), 120 deletions(-)
> 
> --
> 1.7.2.3

Looks good to me, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
