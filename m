From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH] ARM: S3C64XX: Add IRQ mapping for wm0010 on Cragganmore
Date: Thu, 21 Jun 2012 03:28:45 +0900
Message-ID: <4FE2165D.7000909@samsung.com>
References: <1339775065-13211-1-git-send-email-dp@opensource.wolfsonmicro.com> <028c01cd4e9d$16c0f9b0$4442ed10$%kim@samsung.com> <20120620160210.GA27145@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:58340 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757524Ab2FTS2t (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jun 2012 14:28:49 -0400
Received: by pbbrp8 with SMTP id rp8so952725pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jun 2012 11:28:48 -0700 (PDT)
In-Reply-To: <20120620160210.GA27145@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, 'Mark Brown' <broonie@opensource.wolfsonmicro.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, patches@opensource.wolfsonmicro.com

On 06/21/12 01:02, Dimitris Papastamos wrote:
> On Wed, Jun 20, 2012 at 01:28:06PM +0900, Kukjin Kim wrote:
>> Kukjin Kim wrote:
>>>
>>> Dimitris Papastamos wrote:
>>>>
>>>> Signed-off-by: Dimitris Papastamos<dp@opensource.wolfsonmicro.com>
>>>> ---
>>>>   arch/arm/mach-s3c64xx/mach-crag6410-module.c |    1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
>>> b/arch/arm/mach-
>>>> s3c64xx/mach-crag6410-module.c
>>>> index f347336..7c8ea3c 100644
>>>> --- a/arch/arm/mach-s3c64xx/mach-crag6410-module.c
>>>> +++ b/arch/arm/mach-s3c64xx/mach-crag6410-module.c
>>>> @@ -47,6 +47,7 @@ static struct spi_board_info wm1253_devs[] = {
>>>>   		.bus_num	= 0,
>>>>   		.chip_select	= 0,
>>>>   		.mode		= SPI_MODE_0,
>>>> +		.irq            = S3C_EINT(5),
>>                      ^^^^^^^^^^^^
>> If there is no reason, using tab is better at the mark ^
>
> Oops, yes tabs there, will re-send.
>
OK, you don't need to re-send :)

>>>>   		.controller_data =&wm0010_spi_csinfo,
>>>>   		.platform_data =&wm0010_crag_pdata,
>>
>> I can't find platform_data in my tree (just v3.5-rc3), there is another
>> patch?
>>
>> Now, just applying this patch is ok?
>
> Applying this patch should be fine.
>

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
