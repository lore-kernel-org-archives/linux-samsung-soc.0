Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB0AEB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 Jul 2023 07:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbjGDHgA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 4 Jul 2023 03:36:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231322AbjGDHf6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 03:35:58 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C9EB1A4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Jul 2023 00:35:54 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98934f000a5so605578466b.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jul 2023 00:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688456153; x=1691048153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JgkFjDmJN4L2mqgKB/0BaH17v6L6ydu/UCB0MlAoBco=;
        b=XbB2CLRM6WmaMSTNEHIOJpeVYs4bCWJglJGn6V25auCeVm/GMm7BQ+zHJDDIuAoUoP
         EtBS1J62jz6pz3PEc4w8Lkw+tnRAHpF0Wvw7+Be3x1jMgWZ70up0ou0i5WzRYhYGr0+L
         kykn+LoNoRGk1ijBZrBNq+i5xKOKgJszEmyWgxNDtYImT/SKoDvlNqExo+495CilRhLK
         +Ok/X/pxJPZyh6NpNaJ/Pv0zbri5fyNQlF/p1vRhlNnOoaBoXOAvrxZR/uyWDBI4aCoa
         VwKX1lqhkIQONhRSle5dM4ROKmMoAyl8eOFZU79d0QTmF8Q2a/aWhCwZviVvmKtIViQ7
         G+rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688456153; x=1691048153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JgkFjDmJN4L2mqgKB/0BaH17v6L6ydu/UCB0MlAoBco=;
        b=LVYGwbN8USnFt7gBtNO6ZH2Z0zua1WVE6lC21yhS0GHppHT+LK2PwqKd5ReavVhhpG
         yC+9M6z/CAdZPZGgK7cFIYEfcboa1oBJNwaslcyFGDavDWBohYF++0901iXkHDzamA0k
         5mjS3EXAP2h/NJq91OaxqP7A7Ar996TOrhScPBHLeXoT6vadsipOigt5h9dzszjSjuX5
         OtceULn/zsr4rRR7Cs50ufSZ+M/3ddSDFkbxFvKWT40x26GyQW/+lLwzW7JLOWjN1gMa
         FMaXNmpgp6IUCCyJv7Z3zIaImnuslaw8q+ZxdV28aRj7mxolujyZ8s60fcRqOnVjb2Y8
         wOoA==
X-Gm-Message-State: ABy/qLZDLcfDrlXfhB2ovF3sSdIW2gtwh0l29I0HF+02DIceu83QyPeO
        H267njKeHtoUo2iflM1Gy2IucQ==
X-Google-Smtp-Source: APBJJlF8KCRzGhgGld7oGDnmBvSCdNcyLsFRT7uwR9ICZAIjQ65DHVppLpZmPi1mo/hvSiAXP/RX5Q==
X-Received: by 2002:a17:906:ae51:b0:966:471c:2565 with SMTP id lf17-20020a170906ae5100b00966471c2565mr8331205ejb.48.1688456152720;
        Tue, 04 Jul 2023 00:35:52 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id x26-20020a1709065ada00b00992025654c1sm9721649ejs.179.2023.07.04.00.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:35:52 -0700 (PDT)
Message-ID: <88edab79-5f9a-007d-f2e9-d264178fe80b@linaro.org>
Date:   Tue, 4 Jul 2023 09:35:50 +0200
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
> Signed-off-by: Tuo Li <islituo@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

