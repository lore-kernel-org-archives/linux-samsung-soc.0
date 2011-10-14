From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 0/8] S3C2416: Enable armdiv and armclk
Date: Fri, 14 Oct 2011 16:14:11 +0900
Message-ID: <085f01cc8a40$df7af8a0$9e70e9e0$%kim@samsung.com>
References: <201109281217.33813.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:61890 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755080Ab1JNHON convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:14:13 -0400
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT100HK4O3LAS50@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:14:11 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100EZ7O3M0Q70@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:14:11 +0900 (KST)
In-reply-to: <201109281217.33813.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> To enable cpu frequency scaling on the S3C2416/2450 it is necessary
> to define the arm-divider and armclock.
>=20
> The layout of the clocks (i.e. msysclk -> armdiv -> armclk) is the
> same on all three architectures (S3C2443/2416/2450) and only the
> possible dividers for armdiv differ.
> Therefore it is possible to move the armdiv and armclk to common
> code with only the divider table definition remaining in the respecti=
ve
> clock.c-files.
> The s3c2443_common_init_clocks method is modified to make it possible
> to transmit the divider table to the common code.
>=20
> As the armdiv is available in common code now, the fdiv function
> pointer passed to s3c2443_common_init_clocks becomes obsolete and is
> therefore removed as the fclk rate can be set by a clk_get_rate call.
>=20
> It works as expected on S3C2416, is compile-tested on S3C2443
> and checkpatch was happy.
>=20
>=20
> Heiko Stuebner (8):
>   S3C2416: Add armdiv_mask constant.
>   S3C2443: Add infrastructure to transmit armdiv to common code
>   S3C2443: Move clk_arm and clk_armdiv to common code.
>   S3C2416: Add comment describing the armdiv/armclk.
>   S3C2443: Add get_rate operation for clk_armdiv
>   S3C2443: handle unset armdiv values gracefully.
>   S3C2443: Accommodate cpufreq frequency scheme in armdiv
>   S3C2443: use clk_get_rate to init fclk in common_setup_clocks
>=20
>  .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |    1 +
>  arch/arm/mach-s3c2416/clock.c                      |   21 ++--
>  arch/arm/mach-s3c2443/clock.c                      |   98 +---------=
-----
>  arch/arm/plat-s3c24xx/include/plat/s3c2443.h       |    7 +-
>  arch/arm/plat-s3c24xx/s3c2443-clock.c              |  134
> +++++++++++++++++++-
>  5 files changed, 152 insertions(+), 109 deletions(-)
>=20
> --
> 1.7.5.4

Looks ok to me, applied.

As a note, if required, 1st patch which is fixing will be sent to stabl=
e.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
