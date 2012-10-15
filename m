From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Add naming of s3c64xx-spi devices
Date: Mon, 15 Oct 2012 16:58:26 +0200
Message-ID: <507C2492.8010408@samsung.com>
References: <201210021443.54897.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:19773 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751484Ab2JOO63 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 10:58:29 -0400
Received: from eusync3.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBX005YDWA1ET80@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 15:58:49 +0100 (BST)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MBX00GAPW9ETV60@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 15 Oct 2012 15:58:27 +0100 (BST)
In-reply-to: <201210021443.54897.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, =?UTF-8?B?Sm9zw6kg?= =?UTF-8?B?TWlndWVsIEdvbsOnYWx2ZXM=?= <jose.goncalves@inov.pt>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 10/02/2012 02:43 PM, Heiko St=C3=BCbner wrote:
> Commit a5238e360b71 (spi: s3c64xx: move controller information into d=
river
> data) introduced separate device names for the different subtypes of =
the
> spi controller but forgot to set these in the relevant machines.
>=20
> To fix this introduce a s3c64xx_spi_setname function and populate all
> Samsung arches with the correct names. The function resides in a new
> header, as the s3c64xx-spi.h contains driver platform data and should
> therefore at some later point move out of the Samsung include dir.
>=20
> Tested on a s3c2416-based machine.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Cc: stable@vger.kernel.org

This patch looks good to me. I've tested it on Exynos4412 SoC based
board. And it fixes quite serious problem - broken SPI support on
a all Samsung machs (non-dt) except s3c64xx in mainline v3.6 kernel.


Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
(mach-exynos only)

Jos=C3=A9 Miguel, can you confirm it solves the problem for you ?

--
Regards,
Sylwester
