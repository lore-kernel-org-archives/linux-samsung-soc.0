From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ASoC: Samsung: Fix build error
Date: Wed, 8 Aug 2012 17:14:01 +0530
Message-ID: <CAK9yfHw7pYBJ=5E4EX9OzApz0YM=_2PNSCqspTT=rRTR1UrneQ@mail.gmail.com>
References: <1344405883-27603-1-git-send-email-sachin.kamat@linaro.org>
	<20120808110926.GK16861@opensource.wolfsonmicro.com>
	<CAK9yfHzE4sRKj7uUKAEWtonV2uVBcg5_JhL1Ny4d1ohS5g+5yw@mail.gmail.com>
	<0b1401cd755a$552fb9f0$ff8f2dd0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lpp01m010-f46.google.com ([209.85.215.46]:45875 "EHLO
	mail-lpp01m010-f46.google.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754825Ab2HHLoC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Aug 2012 07:44:02 -0400
Received: by lagy9 with SMTP id y9so338967lag.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Aug 2012 04:44:01 -0700 (PDT)
In-Reply-To: <0b1401cd755a$552fb9f0$ff8f2dd0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, patches@linaro.org, sbkim73@samsung.com

On 8 August 2012 17:08, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Hi Mark,
>>
>> On 8 August 2012 16:39, Mark Brown <broonie@opensource.wolfsonmicro.com>
>> wrote:
>> > On Wed, Aug 08, 2012 at 11:34:43AM +0530, Sachin Kamat wrote:
>> >> Fixes the following build error:
>> >> In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
>> >>               from arch/arm/plat-samsung/include/plat/dma-ops.h:17,
>> >>               from arch/arm/plat-samsung/include/plat/dma.h:128,
>> >>               from sound/soc/samsung/pcm.c:23:
>> >> arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8:
>> >>                       error: redefinition of 'struct
> s3c2410_dma_client'
>> >> arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally defined
>> here
>> >> make[3]: *** [sound/soc/samsung/pcm.o] Error 1
>> >
>> > Shouldn't this be being fixed in the headers?  It looks like they
>> > reference and disagree with each other on Exynos (my primary development
>> > platform is S3C6410 based so I'd notice if it was a generic Samsung
>> > issue.
>> >
>> > Pasting the error message isn't really that useful unless the fix is
>> > obvious, it's better to explain in words what's wrong.
>>
>> I had sent the initial patch trying to fix this in the headers and it
>> worked for exynos4 config. However Kukjin pointed out that the patch
>> created similar errors with 2410 and 6400 configs. Fixing it further
>> in the headers did not look quite straight forward as there are many
>> headers trying to include one another. Hence I felt it is better
>> handled in the current way. I understand i should have added this
>> information in the commit message. Below is the link for your
>> reference that provides the complete discussion.
>>
>> http://comments.gmane.org/gmane.linux.kernel.samsung-soc/11274
>>
>> Please let me know your opinion about this.
>>
>>
> I also agree with Mark's opinion and current Sachin's approach cannot avoid
> whole similar build error.

With the current change I did not see any build error with the configs
(2410, 6400, 64x0 and exyno4) i checked with (after enabling audio).
Please let me know if you observed any such build error after adding
this patch.


>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>



-- 
With warm regards,
Sachin
