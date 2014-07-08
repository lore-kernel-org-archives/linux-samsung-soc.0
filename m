From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Tue, 08 Jul 2014 13:47:41 +0200
Message-ID: <53BBDA5D.1020605@samsung.com>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37467 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754441AbaGHLsP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 07:48:15 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N8E000OT648K090@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Jul 2014 12:48:08 +0100 (BST)
In-reply-to: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?VXdlIEtsZWluZS1Lw7ZuaWc=?= <u.kleine-koenig@pengutronix.de>, linux-arm-kernel@lists.infradead.org
Cc: kernel@pengutronix.de, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org

Hi Uwe,

On 02.07.2014 11:57, Uwe Kleine-K=C3=B6nig wrote:
> ARCH_EXYNOS doesn't select NEED_MACH_MEMORY_H, so <asm/memory.h> does=
n't
> include <mach/memory.h> and so this file is not used and can go away.
>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Cc: Kukjin Kim <kgene.kim@samsung.com>
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  arch/arm/mach-exynos/include/mach/memory.h | 27 --------------------=
-------
>  1 file changed, 27 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/include/mach/memory.h

Thanks for the patch.

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

[boot tested on Exynos4412-based Trats2 board]
Tested-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
