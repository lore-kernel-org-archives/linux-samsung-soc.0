Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F2D2C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Mar 2022 16:12:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234814AbiCCQNA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Mar 2022 11:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234893AbiCCQM5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 11:12:57 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32095198D37
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Mar 2022 08:12:12 -0800 (PST)
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com [209.85.221.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EAF7D3F07E
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Mar 2022 16:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646323930;
        bh=1BGQjVNrvfbXoY5ZS3EibqKZUO0QZ3KFVt6NQJQD05k=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=NIPG67g6pM4WCHww7sn+e8s0AaE7IRQSF3xv/qcecqlFLCYRvD/b1hkrBfMoizcfT
         yRv2wn9SdsMtZ4WygyhOMCyHpBkB+SDgJra4AnIx40JJyW/JRf2vFfXGbGZD/2FNRQ
         rTZORRnX5RmFRMbEoQFyafk8NdE+UD4y0z21+FkhCYCiOWlYNvRMEMYZq9dwDukXX0
         39/B2j9mvX+eZBtDzY0gsV1609xTIQlsY+ufLVF1bCcuIa4ODk9x/Sl/y2MR/XFO8x
         wuU/u+m1IEoihqYozrXR9mivTJuFGdD8mpqsCP2FWjhIpNIjApyrT1lurCTMoVRqBe
         jZcv7Wub7KxJQ==
Received: by mail-wr1-f70.google.com with SMTP id c5-20020adffb05000000b001edbbefe96dso2203590wrr.8
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2022 08:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=1BGQjVNrvfbXoY5ZS3EibqKZUO0QZ3KFVt6NQJQD05k=;
        b=iOiTV4zJ4xxc0Pa6LPIzRPGZLGSlSDa+kSBekqcE5MgzJR6gRcWmmXmO5jrgP0vJLy
         ApKnwJOgY/cOUp9ryLs+hwQN+bgnGyeYN8x2Ph0brfb/bMg2mxCe6wY6KL0EU8o2xThX
         +nuVi/70o/pNOwD3fQNFBYnZEXdTMuCcCA/vhZ4XXdV6/YZmQg1RtqnsLkHYRuxIYFf6
         VIlga464ODy6G5YX/8OL9rtUY24dCX59sJkSEyJnct+I6lMaohuqZ/ybBLFeBgX5zlcT
         RXxlMjrlfDO6ihhY2Mz7nT5j1JVD2JmLKJ+ar9wIJqw7Kz6c/Yw8cRnSD6JXzFRmcO6r
         5V2Q==
X-Gm-Message-State: AOAM531IKOa7OsVIeulKXvi/AbS0Kqd6cSd8mczezRJQe/5rHIOvkYNX
        9PHFrZTOPc0ZNc5k9Z5eoGbly78y+bExEWzYeVQyqoYxFa4ihLMHLBITJjrwFfsDAFk/IM4hKGY
        1EM0wDv67TthsUeX+XG0Dr6/sDxfvYvpu1D1Lgsv/hdyP0V8y
X-Received: by 2002:adf:9dcf:0:b0:1e3:200d:a363 with SMTP id q15-20020adf9dcf000000b001e3200da363mr28146360wre.105.1646323930558;
        Thu, 03 Mar 2022 08:12:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7RxXzehx6WHCRoPsdx4WU9Q0UoR4WjMDO68zYZ8/KBCOOAFgdSIOncP68hbntK0mVj4ZDXA==
X-Received: by 2002:adf:9dcf:0:b0:1e3:200d:a363 with SMTP id q15-20020adf9dcf000000b001e3200da363mr28146340wre.105.1646323930366;
        Thu, 03 Mar 2022 08:12:10 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id s17-20020adfbc11000000b001f023d197b8sm2407077wrg.68.2022.03.03.08.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:12:09 -0800 (PST)
Message-ID: <7288b8b4-0043-1d2a-10c3-964008ab2948@canonical.com>
Date:   Thu, 3 Mar 2022 17:12:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
 <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
 <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
 <ac077b37-5861-594f-560f-654f9257959d@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <ac077b37-5861-594f-560f-654f9257959d@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/03/2022 17:11, Marek Szyprowski wrote:
> Hi Krzysztof,
> 
> On 03.03.2022 17:03, Krzysztof Kozlowski wrote:
>> On 02/03/2022 02:00, Inki Dae wrote:
>>> 22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
>>>> On 25/03/2019 08:13, Andrzej Hajda wrote:
>>>>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>>>>> They can be used as extra planes with support for non-RGB formats and scaling.
>>>>> To enable it on DECON update_plane and disable_plane callback should
>>>>> be modified. Moreover DSD mux should be set accordingly, and finally
>>>>> atomic_check callback should be used to limit the number of active planes.
>>>>>
>>>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>>>> ---
>>>>>   drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>>>>   drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>>>>   2 files changed, 72 insertions(+), 14 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/ex
>>>> Hi guys!
>>>>
>>>> I am working on DRM bindings conversion to DT schema format and I found
>>>> this set only partially applied. I merged the DTS patches ("dsd" clock),
>>>> but I think the driver and bindings were not picked up.
>>>>
>>>> Nevertheless I am going to include the "dsd" clock in the new bindings,
>>>> so the DTS passes DT schema checks. Let me know if other approach
>>>> (revert of DTS change) should be taken.
>>>>
>>> Sorry for late response.
>>>
>>> As of now, "dsd" is a dead property not used anywhere.
>>> This patch series makes real user not to work correctly due to ABI change.
>>> How about reverting it until this patch series is merged after fixing the real user problem?
>> The Exynos5433 DECON bindings were already merged by Rob, so someone
>> would need to send a revert. However this does not answer the actual
>> question - whether the "dsd" clock is necessary, whether it is there
>> (routed to DECON). If it is, it should stay in the bindings.
> 
> It is routed to DECON hardware and enabling it is needed to make the so 
> called 'local path' (when DECON takes image data directly from the 
> GSCALER hardware block instead of the memory buffer) working.

Awesome, thanks for confirmation! Bindings are good then.

Best regards,
Krzysztof
