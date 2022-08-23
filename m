Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67CBDC32772
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 15:07:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242254AbiHWPHQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 11:07:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242257AbiHWPHB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 11:07:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AACE329919
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 05:34:54 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id u24so7789703lji.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 05:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=LKZ/vD9wmefmxQhO5lusEK9ST+HwNC5+PjaBESEeuys=;
        b=PNuO0zhUMklVqPdf6qtK0nfdumM0D/Hwz68Et5tlv2nG5/gv32viakxB828FJTpumU
         Aae/Z+CSJylb7YeQo5ZpvXQLQBvTL5ZPweD7ZtbTxAwnasS5Mjj8P1Z3SY0UI8zJkw6E
         alks5XAmeD2iTCBoE+pPEEV74Rs4QYHRof2L+p43UKmz1BjeU4zLhfgW3mbRp3khtQhN
         y7P1p799H1Gew4TPx3MUn/Kpx1RKjY1Nj8yfVOi35Zx7TxglHceo+qf52K6WbRm1eNuY
         o9FQw7e/FUccFk62vxZdki1FO9wlC6zf35I9uEhvfKpCfvJWuyzrkbB3pzdBve80yQSq
         Kbhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=LKZ/vD9wmefmxQhO5lusEK9ST+HwNC5+PjaBESEeuys=;
        b=R15ZQJQpBVcsssOrx8gZVKZ8fm2JDH6dXkcW/9b3i+hysq10I8wLyUuDAjH+qGCBiL
         KUn9t/qfon1qeGkpXlkX8S949KNq1D2lhfUmrl8VBRgjIuMPkvYhanmTH1D55tIB7ky4
         I3lxO8mXDGvyueUtxr7QJiVcBlT81lnaxuhSloP1PaBivoe8xyqONCrR2x6e7tgaFwh9
         AVvuG0U5IA+5u7EQxZ0HGF4JI15jwykAkZ/WyuIGK+0cVeUbXH2S6h6Yt3zDwQlBqzVw
         OczMQCCfw1FteuW4rxXoW0/QoOlZy++eMldL+6OooklGrwTgsAh7QxkK7oJa2akA+aLT
         msJg==
X-Gm-Message-State: ACgBeo1HZgeEqbTh0kenpirlBTbGgEKVNbFP/zh1gIzYtlwysarnEzoU
        Nu5kpjV2nimNv1JDjGvgFpRQAw==
X-Google-Smtp-Source: AA6agR4JmXTLU+9iQlgcfuYvL+JDv7qCLq/Y3gaBjTKTmiOhXuKPPQ+hEuE+Fzp0Ch1sp1ZHonydVg==
X-Received: by 2002:a05:651c:905:b0:25e:67a8:4dd0 with SMTP id e5-20020a05651c090500b0025e67a84dd0mr7700929ljq.232.1661258092397;
        Tue, 23 Aug 2022 05:34:52 -0700 (PDT)
Received: from [192.168.0.11] (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id b10-20020a19670a000000b0048a9e899693sm2492704lfc.16.2022.08.23.05.34.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 05:34:49 -0700 (PDT)
Message-ID: <577fc85b-3bdc-35a1-c54b-fbc37774b34b@linaro.org>
Date:   Tue, 23 Aug 2022 15:34:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] drm/exynos: fix repeated words in comments
Content-Language: en-US
To:     Jilin Yuan <yuanjilin@cdjrlc.com>, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220823122117.15757-1-yuanjilin@cdjrlc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/08/2022 15:21, Jilin Yuan wrote:
>  Delete the redundant word 'next'.
> 

Use scripts/get_maintainers.pl to CC all maintainers and relevant
mailing lists.

Best regards,
Krzysztof
