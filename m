Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A39EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  4 Jul 2023 07:28:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjGDH2E (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 4 Jul 2023 03:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231320AbjGDH17 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 4 Jul 2023 03:27:59 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88CF41A6
        for <linux-samsung-soc@vger.kernel.org>; Tue,  4 Jul 2023 00:27:58 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d804c7d14so5942522a12.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Jul 2023 00:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688455677; x=1691047677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3YoY+iSD6Np9p95iaJOkPaZT5d5FqBDJwy3gxODYPIM=;
        b=ZYwoymNdL4pHjRlq3LRAPmwddv8/opiq5FRFEUDc312dEzBw3nUl2ptJ81guCMMxkY
         Q0Jo+fxLK+NYOVRi+TgUFm55kxo4lgi42H0vZZUvsUSLxyiXkOmSwCgRoWJ6yB07OHgw
         kB6Bqp4U7xwf+RltOIXSkgdIflGTCilR+Yskip739qZZKZ9dV9qV8fEHfRATnCkI0MbI
         JpmJHH/aw9Rm4Sw7EfoBvFtYEJULviPOT/l2PCP0LccJfsPlzOu5zWXdATNa8pXisFMU
         jOJ+gvrNzf3k7QzkNY9em9+rbwdVr2xnGNDS0jffO01vH3ZgDyUou4cunpsMcZMzgni0
         4Q0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688455677; x=1691047677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3YoY+iSD6Np9p95iaJOkPaZT5d5FqBDJwy3gxODYPIM=;
        b=b2ycDCNtf/pYvXYSgtY8h4Bf2ocOQC4/tlmI52gblEoKs3DDFyk9XHkHe+MKt9gFD1
         P6l1dxVh8E31Nmh84veL5y2IC2RheJr+Zazp35u8q/Oo+rYh5j9ROMvctUZq3Lg5SQKF
         6OUnu4QpsHPFziyOSvo+9aaa+4XYwFYsL9aoRoVsjNM4S2lV++G6twWPrw9K8IrBnuFz
         dSimTcJEa7tqyath+Mxo/7942IqD3mY5veKQ9eHWdGPJoGljMVmxSvH/vRzSEWSFzMGq
         8Z0oyFv3gVkSvahrxrZr6itJcIX3Mv0H+ZlZJCWSg581K2qdvtxKbuC7NhtINXim+6Qu
         PC3g==
X-Gm-Message-State: ABy/qLbCdYkbKb2NtlNVX+v6qQFqhJgDbQ/u7NjoEThgfR+eP4k5k7Aq
        kAjFpGK48nbdcEauBWZxf0fEpw==
X-Google-Smtp-Source: APBJJlF3lwsUUl5he9hWhqVwK2wsuzCzvElTQPZv9+BAYLgg8PPM83ZwmFKGnT7RGtq4NA18Bx4BqA==
X-Received: by 2002:aa7:cb47:0:b0:51e:d4b:3c9d with SMTP id w7-20020aa7cb47000000b0051e0d4b3c9dmr4847864edt.23.1688455677150;
        Tue, 04 Jul 2023 00:27:57 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u21-20020a056402065500b0051de3c6c5e5sm6010424edx.94.2023.07.04.00.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 00:27:56 -0700 (PDT)
Message-ID: <1df9a1cd-980f-3f09-fbbb-bc24b80af8fb@linaro.org>
Date:   Tue, 4 Jul 2023 09:27:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] drm/exynos: fix a possible null-pointer dereference due
 to data race in exynos_drm_crtc_atomic_disable()
Content-Language: en-US
To:     Tuo Li <islituo@gmail.com>
Cc:     inki.dae@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@gmail.com, daniel@ffwll.ch,
        alim.akhtar@samsung.com, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        baijiaju1990@outlook.com, BassCheck <bass@buaa.edu.cn>
References: <20230630021906.1035115-1-islituo@gmail.com>
 <207f70b5-e017-33bc-bf46-206b3fb69a04@linaro.org>
 <CADm8Ten-1yBdQFaETvS19j=_UFC4GEJqH38DU=7xPXLkOnvvzg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CADm8Ten-1yBdQFaETvS19j=_UFC4GEJqH38DU=7xPXLkOnvvzg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/07/2023 05:00, Tuo Li wrote:
> Hello,
> 
> Thanks for your reply! The report is publicly available at
> https://sites.google.com/view/basscheck/home. And this
> patch is from the 8th report on this website.


Great, thank you!

Best regards,
Krzysztof

