From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 0/4] Implement RTC support for S3C2443/S3C2416/S3C2450
Date: Wed, 21 Dec 2011 16:25:53 +0900
Message-ID: <064801ccbfb1$c5d48e60$517dab20$%kim@samsung.com>
References: <201112121543.42299.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55804 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751262Ab1LUHZ4 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 Dec 2011 02:25:56 -0500
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LWJ00LT8LYBWBE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 16:25:55 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LWJ00ANCLZ5S910@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Wed, 21 Dec 2011 16:25:55 +0900 (KST)
In-reply-to: <201112121543.42299.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>, ben-linux@fluff.org, a.zummo@towertech.it
Cc: rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Heiko St=FCbner wrote:
>=20
> Similar to the ADC the RTC of S3C2443 and S3C2416/2450 has some sligh=
t
> variances when compared to the existing types.
>=20
> This series adds support for those SoCs.
>=20
> As with the ADC patches, these changes where tested on S3C2416 hardwa=
re.
> The S3C2443 quirks are a subset of those and are done according to th=
e
> datasheet, but not tested on real hardware (as I do not own a S3C2443
> device).
>=20
> changes since v1:
> address comments from Thomas Abraham, reducing number of ifdefs and
> duplicate code
>=20
>=20
> Heiko Stuebner (4):
>   ARM: SAMSUNG: cleanup of rtc register definitions
>   rtc-s3c: make room for more variants in devicetree block
>   rtc-s3c: add variants for S3C2443 and S3C2416
>   ARM: S3C2443/S3C2416: add s3c_rtc_setname and rename rtc devices
>=20
>  arch/arm/mach-s3c2416/s3c2416.c               |    2 +
>  arch/arm/mach-s3c2443/s3c2443.c               |    2 +
>  arch/arm/plat-samsung/include/plat/regs-rtc.h |   92
+++++++++++++++------
> ---
>  arch/arm/plat-samsung/include/plat/rtc-core.h |   27 +++++++
>  drivers/rtc/rtc-s3c.c                         |   74 +++++++++++++++=
+----
>  5 files changed, 149 insertions(+), 48 deletions(-)
>  create mode 100644 arch/arm/plat-samsung/include/plat/rtc-core.h
>=20
> --
> 1.7.5.4

Hi Heiko,

There were small comments on 1st patch and others looks ok to me.
If you're ok on my comments, please re-send it so that I can request to=
 pull
this series to Alessandro or Andrew with my ack.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
