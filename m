Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26AA7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Mar 2022 16:03:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbiCCQEF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Mar 2022 11:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbiCCQEE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Mar 2022 11:04:04 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3236CF5B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Mar 2022 08:03:19 -0800 (PST)
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com [209.85.221.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D4F8D3F07E
        for <linux-samsung-soc@vger.kernel.org>; Thu,  3 Mar 2022 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646323397;
        bh=gmVjym9cd+uCsI0b9eeIUMjOCAOQQ2Nu9Za2weChuPo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=EDs3Hz6eyZJc+CXFcQsG4Gd8s99pM3LTEJhm5TQqiBUN3/3GeWX+HSBBD9Ig1AnQL
         JSU99pxwopWAUP6FE6T+OG471SbwFziQlyVftw0fu3IUdxVOQtJ/Y3rn4FuyoqnTDK
         ucrpzynJAsN6VAxFNy3Ma2+cjTherOvq3w2B+IXS2s6RjdDmu3Yoy15gsoD6DC+b1W
         HaAc0pdu8YnowwqiLC3OK1WzO8gY/suhX/s50atKuQc4WkwGkUONxc54lLIfyTj7hI
         Aa8vC6CzyFNGTPdpJRXp2USjgLGwk8BPt86nIgaUANLKeZCnz1qUV9v904DqiTLGRU
         xAFh3uPKVCuxQ==
Received: by mail-wr1-f72.google.com with SMTP id g17-20020adfa591000000b001da86c91c22so2206543wrc.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 03 Mar 2022 08:03:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gmVjym9cd+uCsI0b9eeIUMjOCAOQQ2Nu9Za2weChuPo=;
        b=e65dr9ul3ajsX2ByjSPcDghzv8Wu/SB/wxJtq6zjjaFoy12NEFZr0efnP1QQgw3O8e
         5SHd6OsLiOXa/grHPLQcDnpVfZLutMjF50vzIDfUF3Pf+ZmKYwJdkAq/CbeBNRWqpQyV
         20M4mauYMD8XQCoIeXWcfGQykIPVo09Jslg6GW76bsAjKA5Jonol4Vn05mfakUg2YR1U
         tJDqUhTGrsdCOp9K0hZSXb2rJGMvbwYqPC4LEBPNrTvpNry7MnYzNftbDqEhEXqiXpPp
         yUgmxn+TEXGDWd36kPStFcog7baiFpp1k2geM3w70O+fu7p3LlH8ARyKqXL1U3XLb/4R
         vpQw==
X-Gm-Message-State: AOAM531Z9vGW0hi1Qwb1AOSG6Ov9C9S1C5wivbB9ZHeoMXBymZYofmRb
        tHBThUvgLhboS5bVGCmda5ceJmSZVtgLLjx9SzHgZ5RP3OVWqpWAeS5NIdm6qyGNSqrt2AnATnK
        yHcHpCHkpnlByMkO7bJTcWj46B9mrmbApU+81UOzatVV/ep2X
X-Received: by 2002:a5d:45cb:0:b0:1ed:f938:7e17 with SMTP id b11-20020a5d45cb000000b001edf9387e17mr27109110wrs.170.1646323397172;
        Thu, 03 Mar 2022 08:03:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD6l0dLxfnigO1O4ROoidzn9kyVra6G61WTQNQDFli8qZZO6vBD6gcGbzDEkzc7uGrF/hq4A==
X-Received: by 2002:a5d:45cb:0:b0:1ed:f938:7e17 with SMTP id b11-20020a5d45cb000000b001edf9387e17mr27109091wrs.170.1646323396953;
        Thu, 03 Mar 2022 08:03:16 -0800 (PST)
Received: from [192.168.0.137] (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id r5-20020a5d4945000000b001f06372fa9fsm1176056wrs.54.2022.03.03.08.03.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Mar 2022 08:03:14 -0800 (PST)
Message-ID: <9c1dc8ee-c717-377b-879c-0706a1613cf3@canonical.com>
Date:   Thu, 3 Mar 2022 17:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 21/24] drm/exynos/decon5433: add local path
 support
Content-Language: en-US
To:     Inki Dae <inki.dae@samsung.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>
Cc:     linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <20190325071349.22600-1-a.hajda@samsung.com>
 <CGME20190325071401eucas1p10df709b256570f1aba9cbc4e875da1b3@eucas1p1.samsung.com>
 <20190325071349.22600-22-a.hajda@samsung.com>
 <b3c98aa3-751b-acc4-8e57-5566af27f922@canonical.com>
 <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <6270db2d-667d-8d6f-9289-be92da486c25@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/03/2022 02:00, Inki Dae wrote:
> Hi Krzysztof,
> 
> 22. 2. 7. 01:51에 Krzysztof Kozlowski 이(가) 쓴 글:
>> On 25/03/2019 08:13, Andrzej Hajda wrote:
>>> GSCALERs in Exynos5433 have local path to DECON and DECON_TV.
>>> They can be used as extra planes with support for non-RGB formats and scaling.
>>> To enable it on DECON update_plane and disable_plane callback should
>>> be modified. Moreover DSD mux should be set accordingly, and finally
>>> atomic_check callback should be used to limit the number of active planes.
>>>
>>> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
>>> ---
>>>  drivers/gpu/drm/exynos/exynos5433_drm_decon.c | 80 +++++++++++++++----
>>>  drivers/gpu/drm/exynos/regs-decon5433.h       |  6 ++
>>>  2 files changed, 72 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ex
>> Hi guys!
>>
>> I am working on DRM bindings conversion to DT schema format and I found
>> this set only partially applied. I merged the DTS patches ("dsd" clock),
>> but I think the driver and bindings were not picked up.
>>
>> Nevertheless I am going to include the "dsd" clock in the new bindings,
>> so the DTS passes DT schema checks. Let me know if other approach
>> (revert of DTS change) should be taken.
>>
> 
> Sorry for late response.
> 
> As of now, "dsd" is a dead property not used anywhere.
> This patch series makes real user not to work correctly due to ABI change.
> How about reverting it until this patch series is merged after fixing the real user problem?

The Exynos5433 DECON bindings were already merged by Rob, so someone
would need to send a revert. However this does not answer the actual
question - whether the "dsd" clock is necessary, whether it is there
(routed to DECON). If it is, it should stay in the bindings.

Best regards,
Krzysztof
