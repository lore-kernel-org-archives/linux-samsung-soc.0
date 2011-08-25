From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 12/15] spi/s3c64xx: Add support DMA engine API
Date: Thu, 25 Aug 2011 06:43:12 +0530
Message-ID: <CAGOxZ53i4DitEbQsWm94Nv1aP6M31H3csZDn_4KqzALsSdyDvw@mail.gmail.com>
References: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
 <1311744697-10264-13-git-send-email-boojin.kim@samsung.com>
 <CABb+yY3-d0xTO+s0cCPXPW8qGpTH5G2U+bp-0z4Se47eVvJ__w@mail.gmail.com>
 <CAGOxZ53BRa1=Bnb==jNg_dD0XT2pMSPo=QoHF++LnT6r5kO_Mw@mail.gmail.com> <20110821084633.GD12028@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yi0-f46.google.com ([209.85.218.46]:36481 "EHLO
	mail-yi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751791Ab1HYBNw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 24 Aug 2011 21:13:52 -0400
Received: by yie30 with SMTP id 30so1329752yie.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 24 Aug 2011 18:13:52 -0700 (PDT)
In-Reply-To: <20110821084633.GD12028@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Boojin Kim <boojin.kim@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, linux-samsung-soc@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, banajit.g@samsung.com

On Sun, Aug 21, 2011 at 2:16 PM, Russell King - ARM Linux
<linux@arm.linux.org.uk> wrote:
> On Tue, Aug 09, 2011 at 09:43:32AM +0530, Alim Akhtar wrote:
>> Exactly, spi_s3c64xx.c (including Sound driver) can not be used with
>> pl080 and pl330 (DMAENGINE drivers) as it is.
>> Recently I was trying to use PL080 DMAENGINE driver, and i was ended
>> up using some #ifdef in the spi driver.
>> something like
>> #ifdef CONFIG_PL080
>> sdd->tx_dmac.bus_id = dmatx_res->name;
>> sdd->rx_dmac.bus_id = dmarx_res->name;
>> #else
>> sdd->tx_dmac.bus_id = dmatx_res->start;
>> sdd->tx_dmac.bus_id = dmatx_res->start;
>> #endif
>>
>> This is because, Pl080 handle the channel as a char *(name) and pl330
>> expect the channel to be enum (a number).
>
> The alternative is that you do as the Primecell drivers do (which was
> designed from the outset to be independent of the specific dmaengine),
> and pass the DMA filter parameters as pointers via platform data.
>
Thanks Russell for your suggestion and pointer.
I will Look into this alternative solution.

Regards,
Alim
