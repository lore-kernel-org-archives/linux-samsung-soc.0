From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ASoC: Samsung: Fix build error
Date: Fri, 10 Aug 2012 11:47:33 +0530
Message-ID: <CAK9yfHx4FA0f_n2jYy3TObFpHJRz1XpmVaP=8n0EOj13YAaSow@mail.gmail.com>
References: <1344405883-27603-1-git-send-email-sachin.kamat@linaro.org>
	<0dd201cd76bd$d57df270$8079d750$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:46492 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754485Ab2HJGRe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 02:17:34 -0400
Received: by vbbff1 with SMTP id ff1so810704vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Aug 2012 23:17:33 -0700 (PDT)
In-Reply-To: <0dd201cd76bd$d57df270$8079d750$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, broonie@opensource.wolfsonmicro.com, patches@linaro.org, sbkim73@samsung.com

Hi Kukjin,

On 10 August 2012 11:33, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Fixes the following build error:
>> In file included from arch/arm/mach-exynos/include/mach/dma.h:24:0,
>>               from arch/arm/plat-samsung/include/plat/dma-ops.h:17,
>>               from arch/arm/plat-samsung/include/plat/dma.h:128,
>>               from sound/soc/samsung/pcm.c:23:
>> arch/arm/plat-samsung/include/plat/dma-pl330.h:106:8:
>>                       error: redefinition of =91struct s3c2410_dma_c=
lient=92
>> arch/arm/plat-samsung/include/plat/dma.h:40:8: note: originally defi=
ned
>> here
>> make[3]: *** [sound/soc/samsung/pcm.o] Error 1
>>
>> Cc: Kukjin Kim <kgene.kim@samsung.com>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>
> BTW, Sachin, do you _really_ need to keep above double signoff with d=
ifferent e-mail?
>
> I think, last one should be removed? Because in the field of author, =
'linaro.org' e-mail is used?

It is just for a policy i had to keep both. Anyway I don't think it
should be a problem as it is practiced by many developers.
If you _really_ feel it is too annoying, then please feel free to remov=
e one.

>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>



--=20
With warm regards,
Sachin
