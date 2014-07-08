From: Sachin Kamat <spk.linux@gmail.com>
Subject: Re: [PATCH 1/3] ARM: exynos: remove unused <mach/memory.h>
Date: Tue, 8 Jul 2014 20:50:13 +0530
Message-ID: <CAK5sBcF_kLbky_88ZR1xTUWj5PsrZrzx7hEC=chqP72QpqP5ug@mail.gmail.com>
References: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f175.google.com ([209.85.217.175]:42324 "EHLO
	mail-lb0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753063AbaGHPUP convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 11:20:15 -0400
Received: by mail-lb0-f175.google.com with SMTP id n15so4027315lbi.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Jul 2014 08:20:13 -0700 (PDT)
In-Reply-To: <1404295043-6661-1-git-send-email-u.kleine-koenig@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sascha Hauer <kernel@pengutronix.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Wed, Jul 2, 2014 at 3:27 PM, Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> ARCH_EXYNOS doesn't select NEED_MACH_MEMORY_H, so <asm/memory.h> does=
n't
> include <mach/memory.h> and so this file is not used and can go away.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---

Reviewed-by: Sachin Kamat <sachin.kamat@samsung.com>

Tested on Arndale octa board (Exynos 5420).

 Tested-by: Sachin Kamat <sachin.kamat@samsung.com>
--=20
Regards,
Sachin.
