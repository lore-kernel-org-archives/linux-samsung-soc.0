Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66ADBC76195
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Mar 2023 14:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231287AbjC0OIv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Mar 2023 10:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjC0OIu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Mar 2023 10:08:50 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73DEF1730
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Mar 2023 07:08:17 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j18-20020a05600c1c1200b003ee5157346cso7471497wms.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Mar 2023 07:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679926096;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=21y/evTkpjPKQEeFY9kdZ69EKgiGSSUmP8nCU331B88=;
        b=gpGy6wspGty+JLkAAdj2ah9OL5xcG5BQC953fC9nzu9Z6f4dGGO5uciz+ETR9/Kx9N
         PGBCL5R2S8kMkp72aMdyFPAEpm5L7qlukeEmmXTIopLnvlkwj3SowVzkkYF2lIVlINOT
         L5xOLGEE26x5g3pHfaETm+BtTsvZEcSgZ1AO+vHLYwnNPlJZMY9SUBJ+CmfFV7/k9nbq
         oMyW0MtwtOHnHBnUAJjCTgscsEXytgqbtbEmlmVFIWebmFmL7wDQNWJ+7F8XZTX5VeRY
         lypiJsCmOn3760Qq7HNh3MBEd7ppHpu3lGX48c3mD57WQe9aQbfSrbtrBadZHbnvfLwV
         O0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679926096;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21y/evTkpjPKQEeFY9kdZ69EKgiGSSUmP8nCU331B88=;
        b=iayN57VGdTbap9Ia+fTWK8JG6P2k55orUgsxqroFjLRkb/Y1FaxcQ8064CaWZ8qclg
         d8Kctahjn4DUMWmT0WCTAx75WZseYPi0WgasEZUnzdACyu/XDt9l+O08BAn0wcZ5+ZwU
         wavgSjPeuqBgRJTFj+PZyoXtQK4oXrmSons0c6WCwuQumgNMOAyp7A8BkGxJorpMu6d7
         7I7VhKAeePVwlqV7EgrUxEWKTF5g+PSLz9z/65fIzI157qwnFKpLKpgtO762s7jCjfcD
         DTIAvVCNqPvsQbOL5ExOktzo43TKk+1xTd9Jw8zMuE4fEFjaKs4FnlNtfF1utJB0hBeT
         W9FQ==
X-Gm-Message-State: AO0yUKUphEqNQjKuO4mauHvtKea1e8gdHwE8BSWqh6yRWbIGEP2EnVfc
        dxyMd+G2W8wg6L6OpPk1kLI3XQ==
X-Google-Smtp-Source: AK7set/LNLPuOD5QZbI7JnDWHLz5OL9solWh9xxsmAwklo2TB52apWlF0KO6JOGgXR2G0gIWfSsV5A==
X-Received: by 2002:a1c:6a04:0:b0:3e2:662:ade6 with SMTP id f4-20020a1c6a04000000b003e20662ade6mr10054762wmc.26.1679926095951;
        Mon, 27 Mar 2023 07:08:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2? ([2a01:e0a:982:cbb0:ef3b:2a41:93d:75f2])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b003ef6bc71cccsm5086219wmq.27.2023.03.27.07.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 07:08:15 -0700 (PDT)
Message-ID: <794538dd-f29a-571b-601a-f61c60d00382@linaro.org>
Date:   Mon, 27 Mar 2023 16:08:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From:   Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v15 00/16] drm: Add Samsung MIPI DSIM bridge
Content-Language: en-US
To:     Fabio Estevam <festevam@gmail.com>, Inki Dae <daeinki@gmail.com>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        Matteo Lisi <matteo.lisi@engicam.com>,
        Adam Ford <aford173@gmail.com>,
        DRI mailing list <dri-devel@lists.freedesktop.org>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20230303145218epcas1p2e77bc610f57337830924e3c6c02ca291@epcas1p2.samsung.com>
 <20230303145138.29233-1-jagan@amarulasolutions.com>
 <000001d94feb$ef651bb0$ce2f5310$@samsung.com>
 <CAOMZO5DFhFTh9kd2NdEe1m2AEs7Se0PNeWZ+5q-cSAz-QVoPDg@mail.gmail.com>
 <CAAQKjZM66M6wgtoBmAcQifq8LgBUos0bZfbTkRBqnOb7E-05tQ@mail.gmail.com>
 <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <CAOMZO5ArYAf72oSY-WMSdfH6w5HAvvrLz24eR+4YBzOASp7U-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/03/2023 16:34, Fabio Estevam wrote:
> Hi Inki,
> 
> On Mon, Mar 13, 2023 at 9:51 PM Inki Dae <daeinki@gmail.com> wrote:
> 
>>> Could you please apply v16?
>>
>>
>> I am planning to merge this patch series soon, but I will be proceeding with the pull-request next week. As the DSIM driver is being moved to the bridge folder, I would like to wait for acknowledgment from the bridge maintainers. However, if there are no further comments until next week, I will proceed with the pull-request.
> 
> A friendly reminder: do you think you can proceed with the pull-request now?

I can apply the entire patchset to drm-misc-needed if needed.

Inki, is it ok for you or you still want to take it in the exynos tree ?

Neil

> 
> Thanks

