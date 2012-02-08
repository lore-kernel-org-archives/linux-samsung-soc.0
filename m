From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] spi: Add the use of DMA config operation
Date: Wed, 08 Feb 2012 11:05:33 +0100
Message-ID: <4F3248ED.8030408@samsung.com>
References: <000401cce62e$3c0cd5e0$b42681a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:26298 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751199Ab2BHKFg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Feb 2012 05:05:36 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZ200DCPK1AKI@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:05:34 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LZ200AK6K1AZM@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 08 Feb 2012 10:05:34 +0000 (GMT)
In-reply-to: <000401cce62e$3c0cd5e0$b42681a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyoungil Kim <ki0351.kim@samsung.com>
Cc: spi-devel-general@lists.sourceforge.net, linux-samsung-soc@vger.kernel.org, 'Grant Likely' <grant.likely@secretlab.ca>, 'Kukjin Kim' <kgene.kim@samsung.com>

Hi,

On 02/08/2012 07:52 AM, Kyoungil Kim wrote:
> Config operation is separated from request operation in DMA common op=
eration.
> Because spi driver can change the DMA config for every message.
> So this patch is using the separated DMA config operation.
>=20
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Signed-off-by: Kyoungil Kim <ki0351.kim@samsung.com>
> ---
>  drivers/spi/spi-s3c64xx.c |   35 +++++++++++++++++++++--------------
>  1 files changed, 21 insertions(+), 14 deletions(-)

I'm getting following compilation errors with this patch:

  CC      drivers/spi/spi-s3c64xx.o
drivers/spi/spi-s3c64xx.c: In function =91prepare_dma=92:
drivers/spi/spi-s3c64xx.c:268: error: storage size of =91info=92 isn=92=
t known
drivers/spi/spi-s3c64xx.c:269: error: storage size of =91config=92 isn=92=
t known
drivers/spi/spi-s3c64xx.c:278: error: =91struct samsung_dma_ops=92 has =
no member
named =91config=92
drivers/spi/spi-s3c64xx.c:286: error: =91struct samsung_dma_ops=92 has =
no member
named =91config=92
drivers/spi/spi-s3c64xx.c:269: warning: unused variable =91config=92
drivers/spi/spi-s3c64xx.c:268: warning: unused variable =91info=92
drivers/spi/spi-s3c64xx.c: In function =91acquire_dma=92:
drivers/spi/spi-s3c64xx.c:302: error: storage size of =91req=92 isn=92t=
 known
drivers/spi/spi-s3c64xx.c:302: warning: unused variable =91req=92

Which tree has it been created off of ?

It seems there are some patches not yet in mainline that it depends on.


Thanks,
--=20
Sylwester Nawrocki
Samsung Poland R&D Center
