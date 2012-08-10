From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: Exynos: Enable DT support by default for Exynos5 SoC
Date: Fri, 10 Aug 2012 11:57:25 +0530
Message-ID: <CAK9yfHzH-gP0ym7JSe9f25X+V_DM4q=S-JCKuwOjav+U8Jn0CA@mail.gmail.com>
References: <1344485719-26111-1-git-send-email-sachin.kamat@linaro.org>
	<0dd501cd76bf$69f271a0$3dd754e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vb0-f46.google.com ([209.85.212.46]:62889 "EHLO
	mail-vb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754355Ab2HJG10 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Aug 2012 02:27:26 -0400
Received: by vbbff1 with SMTP id ff1so815999vbb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Aug 2012 23:27:26 -0700 (PDT)
In-Reply-To: <0dd501cd76bf$69f271a0$3dd754e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

On 10 August 2012 11:44, Kukjin Kim <kgene.kim@samsung.com> wrote:
> Sachin Kamat wrote:
>>
>> Since support for Exynos5 SoC based boards is going to be only
>> device tree (DT) based, it makes no sense to provide DT as a user
>> selectable feature in menuconfig (De-selecting it gives
>> "no machine record defined" linker error). Hence enabling it along with
>> ARCH_EXYNOS5 option.
>>
> Yeah, it's true supporting EXYNOS5 SoCs is available only on DT. But I think
> this is not needed and current method is more clear with EXYNOS4.

Exynos4 supports both DT as well as non-DT platforms. Hence it is
appropriate to have DT as a user selectable option in Exynos4 case.

>
> Note, 'exynos_defconfig' in mainline is supporting EXYNOS4 and EXYNOS5 DT
> together.

Even this config provides a user selectable DT option for Exynos5.
When there is no possibility of having a non-DT platform for Exynos5
(atleast as of now), I do not see the need to provide a user
selectable option (it also leads to build errors with played around
with as mentioned in my patch) for DT for Exynos5 as it _has_ to be
enabled if one needs to build the kernel for Exynos5 machines.

>
>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> Signed-off-by: Sachin Kamat <sachin.kamat@samsung.com>
>
> BTW, I commented on other patch, I don't see why you need to keep the
> duplicated signoff?

Please refer to my reply to previous patch.

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
