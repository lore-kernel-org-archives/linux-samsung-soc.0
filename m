From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: S3C24XX: Fix potential NULL pointer dereference error
Date: Wed, 21 Nov 2012 09:13:45 +0530
Message-ID: <CAK9yfHyA+kOzzX+sqBMqJ-Gmj=Vwj36kg1WbTU06cnXJO3uN2Q@mail.gmail.com>
References: <1352365291-32433-1-git-send-email-sachin.kamat@linaro.org>
	<CAK9yfHyJ1r7KeNHfUAnNhZRBaV+_grjr=pP6r3a7yHoeWywt9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:51947 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752080Ab2KUDnq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Nov 2012 22:43:46 -0500
Received: by mail-vc0-f174.google.com with SMTP id m18so3167849vcm.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Nov 2012 19:43:45 -0800 (PST)
In-Reply-To: <CAK9yfHyJ1r7KeNHfUAnNhZRBaV+_grjr=pP6r3a7yHoeWywt9A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

Hi Kukjin,

You seem to have ignored this patch before sending out your pull request.
Can you please check this?

Regards
Sachin

On 20 November 2012 10:28, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> ping Kukjin.
>
> On 8 November 2012 14:31, Sachin Kamat <sachin.kamat@linaro.org> wrote:
>> chan->end is tested for being NULL. However in the event that it is NULL, the
>> subsequent assignment statement would lead to NULL pointer dereference.
>> Thus dereferencing it only when it is not NULL.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>> Based on Kukjin Kim's for-next branch. Compile tested.
>> ---
>>  arch/arm/plat-s3c24xx/dma.c |    9 +++++----
>>  1 files changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm/plat-s3c24xx/dma.c b/arch/arm/plat-s3c24xx/dma.c
>> index db98e70..0abd1c4 100644
>> --- a/arch/arm/plat-s3c24xx/dma.c
>> +++ b/arch/arm/plat-s3c24xx/dma.c
>> @@ -473,12 +473,13 @@ int s3c2410_dma_enqueue(enum dma_ch channel, void *id,
>>                 pr_debug("dma%d: %s: buffer %p queued onto non-empty channel\n",
>>                          chan->number, __func__, buf);
>>
>> -               if (chan->end == NULL)
>> +               if (chan->end == NULL) {
>>                         pr_debug("dma%d: %s: %p not empty, and chan->end==NULL?\n",
>>                                  chan->number, __func__, chan);
>> -
>> -               chan->end->next = buf;
>> -               chan->end = buf;
>> +               } else {
>> +                       chan->end->next = buf;
>> +                       chan->end = buf;
>> +               }
>>         }
>>
>>         /* if necessary, update the next buffer field */
>> --
>> 1.7.4.1
>>
>
>
>
> --
> With warm regards,
> Sachin
