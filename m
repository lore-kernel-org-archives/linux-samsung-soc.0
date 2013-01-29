From: Padma Venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH V6 04/10] spi: s3c64xx: Modify SPI driver to use generic
 DMA DT support
Date: Tue, 29 Jan 2013 15:02:13 +0530
Message-ID: <CAAgF-Beko3_5d1uRDE735DkmJPt60TBiO22598D4LmS9hD22ww@mail.gmail.com>
References: <1358509629-20471-1-git-send-email-padma.v@samsung.com>
	<1358509629-20471-5-git-send-email-padma.v@samsung.com>
	<20130129051943.GE6878@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f174.google.com ([209.85.223.174]:55509 "EHLO
	mail-ie0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751870Ab3A2JcO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Jan 2013 04:32:14 -0500
Received: by mail-ie0-f174.google.com with SMTP id k10so140225iea.33
        for <linux-samsung-soc@vger.kernel.org>; Tue, 29 Jan 2013 01:32:13 -0800 (PST)
In-Reply-To: <20130129051943.GE6878@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, vinod.koul@intel.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org, lrg@ti.com, tiwai@suse.de, ben-linux@fluff.org

On Tue, Jan 29, 2013 at 10:49 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Fri, Jan 18, 2013 at 05:17:03PM +0530, Padmavathi Venna wrote:
>> This patch modifies the SPI driver to use generic dma dt bindings
>> support. This passes all the required arguments to dma dev request
>> functon which in turn calls the dma_request_slave_channel or dma__
>> request_channel based on DT or non-DT respectively.
>
> This loooks OK and I'm actually applying SPI patches so I could apply it
> but I'm not sure I see the relevance of this patch to the rest of the
> series (which is about ASoC).  Is there some reason why it's included in
> this patch series or can it be applied to the SPI tree?  The SMDKs use
> I2C for their CODEC control rather than SPI.
>
> Also is there a binding document update or device tree file update to go
> with this?
>
>> +     if (!sdd->pdev->dev.of_node) {
>> +             res = platform_get_resource(pdev, IORESOURCE_DMA,  0);
>> +             if (!res) {
>> +                     dev_err(&pdev->dev, "Unable to get SPI tx dma "
>> +                                     "resource\n");
>
> I appreciate that this is cut'n'paste from the code you're refactoring
> but please don't split error messages over lines, it makes it hard to
> grep for them in the kernel source.

OK.

Thanks for reviewing.
Padma
