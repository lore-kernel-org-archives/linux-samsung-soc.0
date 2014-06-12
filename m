From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 2/3 v4] spi: s3c64xx: for DT platofrms always get the
 chipselect info from DT node
Date: Thu, 12 Jun 2014 21:39:06 +0530
Message-ID: <CAHfPSqCHZbHug7rbxLSApue_kT9ZbxVBpnOBP_z-zynickbQMA@mail.gmail.com>
References: <1402578821-27338-1-git-send-email-ch.naveen@samsung.com>
 <1402578821-27338-2-git-send-email-ch.naveen@samsung.com> <5399B3FC.5030605@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f174.google.com ([209.85.216.174]:52246 "EHLO
	mail-qc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753027AbaFLQJ2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jun 2014 12:09:28 -0400
In-Reply-To: <5399B3FC.5030605@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, devicetree@vger.kernel.org, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hello Javier,

On 12 June 2014 19:36, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
> Hello Naveen,
>
> On 06/12/2014 03:13 PM, Naveen Krishna Chatradhi wrote:
>> Use controller_data structure only for the Non Device tree  platforms.
>> For Device tree platforms, always derive the chipselect info from
>> DT node.
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Cc: Doug Anderson <dianders@chromium.org>
>> Cc: Tomasz Figa <t.figa@samsung.com>
>> ---
>>  drivers/spi/spi-s3c64xx.c |   11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index b888c66..f27e15d 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -795,14 +795,15 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>>       int err;
>>
>>       sdd = spi_master_get_devdata(spi->master);
>> -     if (!cs && spi->dev.of_node) {
>> +     if (spi->dev.of_node) {
>>               cs = s3c64xx_get_slave_ctrldata(spi);
>>               spi->controller_data = cs;
>> -     }
>> -
>> -     /* For the non-DT platforms derive chip selects from controller data */
>> -     if (!spi->dev.of_node)
>> +     } else {
>> +             /* For the non-DT platforms derive chip
>> +              * selects from controller data
>> +              */
>>               spi->cs_gpio = cs->line;
>> +     }
>>
>>       if (IS_ERR_OR_NULL(cs)) {
>>               dev_err(&spi->dev, "No CS for SPI(%d)\n", spi->chip_select);
>>
>
> Personally I wouldn't have this change as a separate patch since it's too
> related to what you changed in Patch 1. But it's just a nitpick.

Patch 1/3 seems to be crowded with multiple changes.
Thought, this would keep the changes cleaner.

>
> Reviewed-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Thanks
>
> Best regards,
> Javier



-- 
Shine bright,
(: Nav :)
