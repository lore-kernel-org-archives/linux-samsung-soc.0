From: =?UTF-8?B?Sm9zw6kgTWlndWVsIEdvbsOnYWx2ZXM=?=
	<jose.goncalves@inov.pt>
Subject: Re: [PATCH] ARM: SAMSUNG: Add naming of s3c64xx-spi devices
Date: Mon, 15 Oct 2012 17:22:29 +0100
Message-ID: <507C3845.1030003@inov.pt>
References: <201210021443.54897.heiko@sntech.de> <507C2492.8010408@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lmv.inov.pt ([146.193.64.2]:50556 "EHLO lmv.inov.pt"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750813Ab2JOQXe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 15 Oct 2012 12:23:34 -0400
In-Reply-To: <507C2492.8010408@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 15-10-2012 15:58, Sylwester Nawrocki wrote:
> Hi Heiko,
>
> On 10/02/2012 02:43 PM, Heiko St=C3=BCbner wrote:
>> Commit a5238e360b71 (spi: s3c64xx: move controller information into =
driver
>> data) introduced separate device names for the different subtypes of=
 the
>> spi controller but forgot to set these in the relevant machines.
>>
>> To fix this introduce a s3c64xx_spi_setname function and populate al=
l
>> Samsung arches with the correct names. The function resides in a new
>> header, as the s3c64xx-spi.h contains driver platform data and shoul=
d
>> therefore at some later point move out of the Samsung include dir.
>>
>> Tested on a s3c2416-based machine.
>>
>> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
>> Cc: stable@vger.kernel.org
> This patch looks good to me. I've tested it on Exynos4412 SoC based
> board. And it fixes quite serious problem - broken SPI support on
> a all Samsung machs (non-dt) except s3c64xx in mainline v3.6 kernel.
>
>
> Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Tested-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> (mach-exynos only)
>
> Jos=C3=A9 Miguel, can you confirm it solves the problem for you ?

The driver initialization problem is solved by this patch on my S3C2416=
 based=20
board. Nevertheless, I didn=E2=80=99t have the time yet to test an actu=
al SPI device=20
connected to the bus.

BTW, I think the two debug messages at the end of the s3c64xx_spi_probe=
() routine=20
should be promoted from dev_dbg to dev_info in order to be shown on a n=
ormal=20
kernel boot.

Best regards,
Jos=C3=A9 Gon=C3=A7alves
