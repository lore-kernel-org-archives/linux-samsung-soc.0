Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5097AEB64DC
	for <linux-samsung-soc@archiver.kernel.org>; Sat,  1 Jul 2023 08:02:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbjGAIC0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 1 Jul 2023 04:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbjGAIBs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 1 Jul 2023 04:01:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6036170E
        for <linux-samsung-soc@vger.kernel.org>; Sat,  1 Jul 2023 01:01:45 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9928abc11deso312502666b.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 01 Jul 2023 01:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688198504; x=1690790504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+/7TuI/hQwkZhyymEuytfw8tljO+CF4LNtsLy3kjnEs=;
        b=Ou/rDZBt62vQN0g6wf8sflLQ5ypZfVU4sHRXMyBJBFWIjv9gqQQLTCW8EuKRyG+NBR
         xIjScWjY5dZgKHSHb9rlP8TnNy0on9Y8TcqwZ1UzOn8GrFjI0qhSNC6opsr3C8vcxj4v
         KibRH8x4qmo93VqHlE6Dr/B1pTtee/5+fgVlV9wtt10SAMxLe1UswkSjz5eQ5BFk1rTO
         aZmeLwwNeabJtPoDohYLsGNztEwTH6mjAuDrKhZi/I4BSmNsLP4PJOIfnj8s0Cvmd383
         8Zq2GzVGIbNP+8T/GLoqX/B0e4spM8/Pdr9htwsjSif/G/lHJM5Ig4Svo0dXK9dc/6RD
         NfKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688198504; x=1690790504;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+/7TuI/hQwkZhyymEuytfw8tljO+CF4LNtsLy3kjnEs=;
        b=ARMR6RgBPSSBRmLj7qBDngclG3/OomN9Lt0TIoxvQ4TXXpDQEdqvbxfSjvl6LyNEGs
         BoaZC0U/z1rLQspAY3YUmaLDEEOTZbMEhBxZXp5s7ytGou+JPJhKnqZiJivGVgQfIehk
         7h9gzXh3/WwOyf2w7dEwm8/FFX84E7n44vTHwl+oujfMuee+2SzuSwQUBA6B7lXUD2kh
         MnKWmqw+XpR9VFSwpOAhBB9DpzeQRYpdJMtaWa0YmbQaArZ5pWHhM1tDVCsPRIqj/MYG
         aNrQtdNNYbrBNjLMzRFRFyQ9TOW1YGU7/btiqc9xVpn59XsjK921MpqLJ/m3RWNFBnJ8
         YjVA==
X-Gm-Message-State: ABy/qLY1gl8u9rEWrcIzRvv1G0uKX/VKvf97lfm3llP4UuQdlLabe0/d
        XVa+yZoazk9UA5ZKN0hmMe+2vx68AI2V/YStpSBykbGF
X-Google-Smtp-Source: ACHHUZ5F8xUIAMknqjsoPu2of+I/Txby9lVW5dSl1hKwXHTjXld0F3vDjgHEZdD7r802EbZERuvF+g==
X-Received: by 2002:a17:907:2c66:b0:991:fef4:bb7 with SMTP id ib6-20020a1709072c6600b00991fef40bb7mr4187077ejc.73.1688198503859;
        Sat, 01 Jul 2023 01:01:43 -0700 (PDT)
Received: from [192.168.10.214] ([217.169.179.6])
        by smtp.gmail.com with ESMTPSA id bm4-20020a170906c04400b00973ca837a68sm8996694ejb.217.2023.07.01.01.01.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Jul 2023 01:01:43 -0700 (PDT)
Message-ID: <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
Date:   Sat, 1 Jul 2023 10:01:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
Content-Language: en-US
To:     Tuo Li <islituo@gmail.com>, inki.dae@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        airlied@gmail.com, daniel@ffwll.ch, alim.akhtar@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        baijiaju1990@outlook.com, BassCheck <bass@buaa.edu.cn>
References: <20230630021906.1035115-1-islituo@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230630021906.1035115-1-islituo@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 30/06/2023 04:19, Tuo Li wrote:
> The variable crtc->state->event is often protected by the lock 
> crtc->dev->event_lock when is accessed. However, it is accessed as a 
> condition of an if statement in exynos_drm_crtc_atomic_disable() without
> holding the lock:
> 
>   if (crtc->state->event && !crtc->state->active)
> 
> However, if crtc->state->event is changed to NULL by another thread right
> after the conditions of the if statement is checked to be true, a
> null-pointer dereference can occur in drm_crtc_send_vblank_event():
> 
>   e->pipe = pipe;
> 
> To fix this possible null-pointer dereference caused by data race, the 
> spin lock coverage is extended to protect the if statement as well as the 
> function call to drm_crtc_send_vblank_event().
> 
> Reported-by: BassCheck <bass@buaa.edu.cn>

I cannot find this report. This is an open source work and public
collaboration. The "Reported-by" usually means that the issue was
reported to us, in some way, usually in public. Can we see the report?
Otherwise adding non-public, non-verifiable reports is useless and
clutters our report-credit-system.

Best regards,
Krzysztof

