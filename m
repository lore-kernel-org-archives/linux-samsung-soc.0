From: padma venkat <padma.kvr@gmail.com>
Subject: Re: [PATCH 2/2] SPI: S5PV210: Enable the SPI driver for S5PV210
Date: Wed, 6 Jul 2011 13:08:40 +0530
Message-ID: <CAAgF-Bf8X8zoVn=UaQx-b4neinTJcHNr92F7q3nFdyyEo4kgOw@mail.gmail.com>
References: <1309801476-29678-1-git-send-email-padma.v@samsung.com>
	<1309801476-29678-2-git-send-email-padma.v@samsung.com>
	<4E13D362.7010107@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:44160 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751150Ab1GFHkC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Jul 2011 03:40:02 -0400
Received: by wyg8 with SMTP id 8so4473516wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2011 00:40:00 -0700 (PDT)
In-Reply-To: <4E13D362.7010107@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hi Tushar,

On Wed, Jul 6, 2011 at 8:45 AM, Tushar Behera <tushar.behera@linaro.org=
> wrote:
> Hi,
>
> Patch 1/2 looks redundant as both changes can be very well accommodat=
ed in a
> single patch.
I thought it would be better to have seperate patch for two different
SoCs. So I made
the patches like that.

Hi Kukjin,

Please comment on this. Shall I make a single patch for both of the SoC=
s?

>
> On Monday 04 July 2011 11:14 PM, Padmavathi Venna wrote:
>>
>> The SPI module on S5PV210 is similar to the earlier Samsung SoCs lik=
e
>> S3C64XX. Enable the existing SPI driver for use on S5PV210.
>>
>> Signed-off-by: Padmavathi Venna<padma.v@samsung.com>
>> ---
>> =A0drivers/spi/Kconfig | =A0 =A03 ++-
>> =A01 files changed, 2 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/spi/Kconfig b/drivers/spi/Kconfig
>> index 91d607b..ed1ebea 100644
>> --- a/drivers/spi/Kconfig
>> +++ b/drivers/spi/Kconfig
>> @@ -340,7 +340,8 @@ config SPI_S3C24XX_GPIO
>>
>> =A0config SPI_S3C64XX
>> =A0 =A0 =A0 =A0tristate "Samsung S3C64XX series type SPI"
>> - =A0 =A0 =A0 depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC1=
00)
>> + =A0 =A0 =A0 depends on (ARCH_S3C64XX || ARCH_S5P64X0 || ARCH_S5PC1=
00 \
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 || ARCH_S5PV210)
>> =A0 =A0 =A0 =A0select S3C64XX_DMA if ARCH_S3C64XX
>> =A0 =A0 =A0 =A0help
>> =A0 =A0 =A0 =A0 =A0SPI driver for Samsung S3C64XX and newer SoCs.
>
>
> --
> Tushar Behera
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
