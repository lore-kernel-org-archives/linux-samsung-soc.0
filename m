From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v3 0/5] S3C2443/S3C2416: Implement support for ADC
Date: Fri, 14 Oct 2011 16:13:25 +0900
Message-ID: <085c01cc8a40$c40feda0$4c2fc8e0$%kim@samsung.com>
References: <201110102146.51694.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:13761 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326Ab1JNHN1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:13:27 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LT100G4PO23W260@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:13:26 +0900 (KST)
Received: from kgenekim ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LT100G49O2DW720@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Fri, 14 Oct 2011 16:13:25 +0900 (KST)
In-reply-to: <201110102146.51694.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> The adc blocks of S3C2443 and S3C2416/2450 differ in some regards
> from previous (S3C2410, etc) and later (S3C64XX, S5P) SoCs.
>=20
> This patch series adds support for these ADC implementations.
>=20
> Each patch was compile tested. But as I have only access to S3C2416
> hardware, real life testing happened only there.
>=20
> Changes since v2:
> Drop the quirks and follow the proposal of Kukjin Kim introducing
> additional cpu types for S3C2443 and S3C2416.
> S3C2443 becomes TYPE_ADCV11, as it's older than the S3C2416 implement=
ation
> and S3C2416/2450 becomes TYPE_ADCV12.
>=20
> Changes since v1:
> added a wrap for a line over 80 and moved the adc_setname call
> to the s3c24XX.c files where all the other names are set.
>=20
> Heiko Stuebner (5):
>   S3C2443/S3C2416: Add adc registers
>   s3c-adc: Fix mux bit modification in s3c_adc_select
>   S3C24XX: Allow overriding of adc device name
>   s3c-adc: Add support for S3C2443
>   s3c-adc: Add support for S3C2416/S3C2450
>=20
>  arch/arm/mach-s3c2416/s3c2416.c               |    3 ++
>  arch/arm/mach-s3c2443/s3c2443.c               |    3 ++
>  arch/arm/plat-samsung/adc.c                   |   43
> ++++++++++++++++++------
>  arch/arm/plat-samsung/include/plat/adc-core.h |    2 +-
>  arch/arm/plat-samsung/include/plat/regs-adc.h |    3 ++
>  5 files changed, 42 insertions(+), 12 deletions(-)
>=20
> --
> 1.7.2.3

Hi Heiko,

Thanks for your re-work and looks ok to me, applied.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
