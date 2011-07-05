From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 6/7] spi/s3c64xx: Add support DMA engine API
Date: Tue, 5 Jul 2011 17:15:43 +0530
Message-ID: <CABb+yY0bqop=-g_Ej3Kwh0G2-39wtxfxn4DtuywWmpOqagRnGg@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
	<201107041859.11548.heiko@sntech.de>
	<20110704170217.GH28042@ponder.secretlab.ca>
	<201107042151.44075.heiko@sntech.de>
	<20110704232758.GB12824@ponder.secretlab.ca>
	<00bd01cc3ae1$f1dbfac0$d593f040$%kim@samsung.com>
	<CABb+yY3UqrbBNS1J1X1gCxPLp8Kv8JSe92Pnb7JpE9x9kqTPiA@mail.gmail.com>
	<20110705112755.GZ8286@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:54527 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755965Ab1GELpo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 07:45:44 -0400
Received: by bwd5 with SMTP id 5so4677497bwd.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2011 04:45:43 -0700 (PDT)
In-Reply-To: <20110705112755.GZ8286@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>, linux-arm-kernel@lists.infradead.org

On Tue, Jul 5, 2011 at 4:57 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Jul 05, 2011 at 04:46:47PM +0530, Jassi Brar wrote:
>> Ideally, like PL330 for S5Pxxxx, drivers/dma/pl080 should be enabled
>> for s3c64xx And new generic dma api drivers written for S3C24xx in
>> drivers/dma/
>
> Another solution would be to write a DMA engine driver which massages
> the Samsung DMA API into the DMA engine way of doing things. =C2=A0Yo=
u can
> then convert all the Samsung drivers to using DMA engine, and then
> sort out the Samsung DMA API as a separate issue.
>
OK, but before that we need to see if the effort involved in writing
the api 'mapping'
 driver would be sufficiently lesser than that of writing a common
driver for 24xx, which
IIRC are variations of each other.
