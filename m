From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/8] ARM: S5PV310: Add support for Samsung S5PV310 SoC
Date: Thu, 1 Jul 2010 18:49:24 +0900
Message-ID: <AANLkTilZ0ZnFp6grlwHe9r8mWZ0G6bMkV8LJasVd0yjy@mail.gmail.com>
References: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-px0-f174.google.com ([209.85.212.174]:48245 "EHLO
	mail-px0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751927Ab0GAJtZ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Jul 2010 05:49:25 -0400
Received: by pxi14 with SMTP id 14so276042pxi.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Jul 2010 02:49:25 -0700 (PDT)
In-Reply-To: <1277476037-8806-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Hi,

How about to start the single kernel preparation from this patch?
Instead of create the new machine directory, we just put the
mach-s5pv210 or create the new one.

and don't you think it's confusing of names.
s5pc110 (same as s5pv210), vs. s5pc210 (same as s5pv310).
maybe someone don't read the chip carefully. it's misleading the chips.

Thank you,
Kyungmin Park

On Fri, Jun 25, 2010 at 11:27 PM, Kukjin Kim <kgene.kim@samsung.com> wr=
ote:
> This patch set adds support for Samsung S5PV310/S5PC210. The S5PV310
> integrates a ARM Cortex A9 microprocessor with several other peripher=
als
> to support features such as multimedia, storage, graphics and gaming.
> The S5PV310 can be used in products such as Netbooks and Mobile devic=
es.
>
> This patch set consists of the following patches.
>
> [PATCH 1/8] ARM: S5P: Remove fixed uart offset dependent code
> [PATCH 2/8] ARM: S5PV310: Add new CPU initialization support
> [PATCH 3/8] ARM: S5PV310: Add Clock and PLL support
> [PATCH 4/8] ARM: S5PV310: Add IRQ support
> [PATCH 5/8] ARM: S5PV310: Add Timer support
> [PATCH 6/8] ARM: S5PV310: Add new Kconfig and Makefiles
> [PATCH 7/8] ARM: S5PV310: Add Board support file
> [PATCH 8/8] ARM: S5PV310: Add serial port support
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
