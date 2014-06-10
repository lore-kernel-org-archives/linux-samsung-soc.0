From: Naveen Krishna Ch <naveenkrishna.ch@gmail.com>
Subject: Re: [PATCH 2/3] spi: s3c64xx: remove a compilation warning with an assignment
Date: Tue, 10 Jun 2014 15:23:20 +0530
Message-ID: <CAHfPSqA-8UK0gFxdB_NHDL+HeRoK3Yrm_2kwp71e0oSL6u=wSg@mail.gmail.com>
References: <1402390859-28287-1-git-send-email-ch.naveen@samsung.com>
 <1402390859-28287-3-git-send-email-ch.naveen@samsung.com> <CAK5sBcGfE0fsZ1wZX79GOhXBXkSAn3YFt2MsuMcbFnvV_Cw=wA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f46.google.com ([209.85.192.46]:47687 "EHLO
	mail-qg0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750788AbaFJJxl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 10 Jun 2014 05:53:41 -0400
Received: by mail-qg0-f46.google.com with SMTP id q108so9813206qgd.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jun 2014 02:53:40 -0700 (PDT)
In-Reply-To: <CAK5sBcGfE0fsZ1wZX79GOhXBXkSAn3YFt2MsuMcbFnvV_Cw=wA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <spk.linux@gmail.com>
Cc: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-arm-kernel@lists.infradead.org, spi-devel-general@lists.sourceforge.net, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, broonie@kernel.org, grant.likely@secretlab.ca, jaswinder.singh@linaro.org, Kukjin Kim <kgene.kim@samsung.com>, cpgs@samsung.com, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>

Hello Sachin,

On 10 June 2014 15:15, Sachin Kamat <spk.linux@gmail.com> wrote:
> Hi Naveen,
>
> On Tue, Jun 10, 2014 at 2:30 PM, Naveen Krishna Chatradhi
> <ch.naveen@samsung.com> wrote:
>> This patch returns an integer error value instead of the
>> pointer.
>>
>> "warning: return makes integer from pointer without a cast"
>>
>> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
>> Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
>> Cc: Doug Anderson <dianders@chromium.org>
>> ---
>>  drivers/spi/spi-s3c64xx.c |    2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
>> index 0c6013f..4594dde 100644
>> --- a/drivers/spi/spi-s3c64xx.c
>> +++ b/drivers/spi/spi-s3c64xx.c
>> @@ -817,7 +817,7 @@ static int s3c64xx_spi_setup(struct spi_device *spi)
>>
>>         if (!spi->dev.of_node) {
>>                 dev_err(&spi->dev, "device node not found\n");
>> -               return ERR_PTR(-EINVAL);
>> +               return -EINVAL;
>
> Isn't this warning introduced by the previous patch (patch1/3)?
> If so then this patch should be squashed into that.
You are right, I've introduced this warning in the 1st patch.
But, realized it only latter. Will spin along with the documentation.
>
> --
> Regards,
> Sachin.



-- 
Shine bright,
(: Nav :)
