From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH 1/1] ARM: SAMSUNG: Remove description corresponding to a
 deleted element
Date: Tue, 19 Jun 2012 15:02:19 +0530
Message-ID: <CAK9yfHxgz4a7knmPwTAXgt=zGd3Wy3aBr_UHFoYQhsiuDT-8nA@mail.gmail.com>
References: <1339479059-18527-1-git-send-email-sachin.kamat@linaro.org>
	<01a101cd4df8$c329ff30$497dfd90$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:54022 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751067Ab2FSJcU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 19 Jun 2012 05:32:20 -0400
Received: by vbbff1 with SMTP id ff1so3214135vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 19 Jun 2012 02:32:19 -0700 (PDT)
In-Reply-To: <01a101cd4df8$c329ff30$497dfd90$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, thomas.abraham@linaro.org, patches@linaro.org

On 19/06/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Commit 3c582647a9f84affd5c86e89d548157c62f8d9ca removed the default_win
>
> In this case, 8 or 12 digits commit id is enough and please explain the
> subject like following next time.

Ok.

>
> Commit 3c582647a9f8 ("video: s3c-fb: remove 'default_win' element from
> platform data")...
>
>> element from the structure, but the description was not removed.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>>  arch/arm/plat-samsung/include/plat/fb.h |    1 -
>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/plat-samsung/include/plat/fb.h b/arch/arm/plat-
>> samsung/include/plat/fb.h
>> index 536002f..b885322 100644
>> --- a/arch/arm/plat-samsung/include/plat/fb.h
>> +++ b/arch/arm/plat-samsung/include/plat/fb.h
>> @@ -43,7 +43,6 @@ struct s3c_fb_pd_win {
>>   * @setup_gpio: Setup the external GPIO pins to the right state to
>> transfer
>>   *		the data from the display system to the connected display
>>   *		device.
>> - * @default_win: default window layer number to be used for UI layer.
>>   * @vidcon0: The base vidcon0 values to control the panel data format.
>>   * @vidcon1: The base vidcon1 values to control the panel data output.
>>   * @vtiming: Video timing when connected to a RGB type panel.
>> --
>> 1.7.4.1
>
> Will apply after updating commit log I said.

Thanks :)

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
>


-- 
With warm regards,
Sachin
