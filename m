Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 972A6C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:44:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DEEF61053
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Oct 2021 11:44:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231248AbhJNLqT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Oct 2021 07:46:19 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:50808
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231194AbhJNLqO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Oct 2021 07:46:14 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DA4C04000F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 11:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634211846;
        bh=YPH2WVu5uDitMh1aWqloZ1ZtuO3sS7qJNLEyKSmSBJE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LzddoGzSKTefcJ2k9L/kwzLDThvp541Tp8/qjghOlInoSpz3eIhCxBTi/RdxIYKfH
         2sNXub6rwoUI8mv+VTOw9fG1jLeVW+q5+3EGcqBWvC5NFo3sq9216g4DqEn2WU139k
         vbkHGX69ep1MeZpgTpI1iYJDCBbya4Nm0DCKgcdZQIBjtJQPxlK+ogxyARcgZbnP0s
         4S8BXIZAIm0vZS3A2Zj12uzN6NSYT0xhaeHr3zP0UyON8eRwVZxdHZurIYWkWWgF5H
         1+4fe6aKkMj2nEfV8D5gyiwIop4QNqXiZEb9oFpV8bNDS8qfEbqaqC+B/NKqPjHJwL
         wGv7pvAWHBnxQ==
Received: by mail-lf1-f70.google.com with SMTP id i6-20020a056512318600b003fd8c8c2677so4175144lfe.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Oct 2021 04:44:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YPH2WVu5uDitMh1aWqloZ1ZtuO3sS7qJNLEyKSmSBJE=;
        b=zxJad/XG9Dnre9swGn23PZxwldmDOVPhot52iY9BQ/92l38Xe0vyWCnv/TOeWSWeXo
         FvF+Ev0FCgT99MKOQyhMM1OO28jlGVKQmKWld6/1DoB49/kM1T0RsGBTyNouf3cNmCyH
         Tqbkxbg4QdqJc67zFVCdpuH4I1hEI38+O1x1eDJD7BtnMnsdJ4tvfb5MV7sxQINhn1j/
         ydjlz4P04Wzq9+x9n6g7m8tew13vkJYhB4lhJAJElvDrHIXu8nSBhZl5zp4BeUWDklhF
         b/POSGHsUSCjCKZS4DFMj940v23JX5E7B2Ax6d/7DmfOhAOFHF6P0gVRP1AIvRXF9+o4
         gWPg==
X-Gm-Message-State: AOAM5326SppbWS2VpzhfzLj+yA+Qmz8Lwir5GbMwxznYjrzm/04e8Zvy
        nBYYkfQSfNnEf8Skl5uYhv16vud7kqewMc0wbQxHCryZTVZHhUJ2HxnIcWQHZEGB1BVDR3PiIV+
        e+UKtIPx2kBpedwsH7OXRIfdLL8RscEXRZ51KA+tncyW7gg6W
X-Received: by 2002:a05:6512:3b07:: with SMTP id f7mr4464259lfv.67.1634211845403;
        Thu, 14 Oct 2021 04:44:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLFOioy5nBCsU+Bnh4Jdc1/IvTUpnD/zPAtB+U5lrR/RgFHNx1XSSNThY8LhzFdmwR/kZAHw==
X-Received: by 2002:a05:6512:3b07:: with SMTP id f7mr4464244lfv.67.1634211845204;
        Thu, 14 Oct 2021 04:44:05 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x4sm205011lfq.246.2021.10.14.04.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Oct 2021 04:44:04 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] soc: samsung: exynos-chipid: Pass revision reg
 offsets
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20211013202110.31701-1-semen.protsenko@linaro.org>
 <3460c787-0a72-3c37-1075-dfee9cc2c0b3@canonical.com>
 <CAPLW+4mw8e+r=Jf8unQtLGXHpxvioQinOjrDChdvs8S+hddotw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <d1a0dd67-6f29-1b4f-5cdf-5d203297adb9@canonical.com>
Date:   Thu, 14 Oct 2021 13:44:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4mw8e+r=Jf8unQtLGXHpxvioQinOjrDChdvs8S+hddotw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/10/2021 13:25, Sam Protsenko wrote:
> On Thu, 14 Oct 2021 at 09:41, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 13/10/2021 22:21, Sam Protsenko wrote:
>>> Old Exynos SoCs have both Product ID and Revision ID in one single
>>> register, while new SoCs tend to have two separate registers for those
>>> IDs. Implement handling of both cases by passing Revision ID register
>>> offsets in driver data.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/soc/samsung/exynos-chipid.c       | 67 +++++++++++++++++++----
>>>  include/linux/soc/samsung/exynos-chipid.h |  6 +-
>>>  2 files changed, 58 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
>>> index 5c1d0f97f766..7837331fb753 100644
>>> --- a/drivers/soc/samsung/exynos-chipid.c
>>> +++ b/drivers/soc/samsung/exynos-chipid.c
>>> @@ -16,6 +16,7 @@
>>>  #include <linux/errno.h>
>>>  #include <linux/mfd/syscon.h>
>>>  #include <linux/of.h>
>>> +#include <linux/of_device.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/regmap.h>
>>>  #include <linux/slab.h>
>>> @@ -24,6 +25,17 @@
>>
>> Include a changelog please. Your patch does not apply and there is no
>> information on tree which it was based on.
>>
> 
> Sorry, my bad. Will do in v3. As for the tree: it's based on the
> latest mainline/master. I'll double check if patches apply correctly
> to that before sending v3. Please let me know if you want me to rebase
> this series on top of some other tree.

Mainline/master won't work in most of the cases. You need to rebase your
work on maintainer's tree. This is sometimes tricky, so usually it's
enough to base on linux-next.

In this case, either use linux-next or for-next branch of my tree:
https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git/

Best regards,
Krzysztof
