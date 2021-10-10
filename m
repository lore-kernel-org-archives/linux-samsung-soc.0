Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 914F0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 07:16:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DBF960551
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 10 Oct 2021 07:16:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhJJHSD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 10 Oct 2021 03:18:03 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:41418
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229916AbhJJHSB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 10 Oct 2021 03:18:01 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A04D540012
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 07:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633850162;
        bh=k4FEo+R2PPzniUn68O7kiRbxrh5HJoaNN/ovFoAxqV0=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=nh33PvV2SVpDNnncn/VM3yMyHz3yeB6mB5pVv+9NjVRCkGv/vLcNTF39iPY5SuGzG
         roIwSoLt3MXqqaN8535CUzkqiS4iDV4bDiPbZm/MvIixp+wnA50Ch9wO1etGow2llu
         AQIikCXb9L/dxiHXss+iS8G//LjAEcrCAwoSWazOZrSwI3ILxP1c9YwafTaaJVCCa2
         bC+GLHEG7h5MP2e/7SsfJPjWS5mJIhysV1MfFQHYvtebFub6fcUWj9ag+vh0l5ORH1
         Xv+lkS9mtJaK1XystrjOJgfpierfzjVfxPBmYIYp35E4ODNPPzh0cJc6pT9TGIsSzi
         EfnrSlhiyLPKA==
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a50d648000000b003daa53c7518so12906250edj.21
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Oct 2021 00:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=k4FEo+R2PPzniUn68O7kiRbxrh5HJoaNN/ovFoAxqV0=;
        b=aOwiAVqNy4u8ftQjJCiBNsdIsu0r/EdyY7+Byjf2Auq63CIDTqEIBfeSaolUCZmzdq
         tGnNrVdjbCbqYzXBNA+rLi4/fcNSiV4Y3JRBWQV0Deulk/tAhcE2K9XcrAggnFzE9OhS
         W3WVuNC4P+YPGWmjFEW2dPgon1XuigjWZf2gydwfYSYTd/b5yn0sqozsyIk4vVrA51Lb
         9onPNwhrH3LCkKYzszmFayL95rdBsNHzVqxgTqA0cJNBd2bTPWRBqNoAJCjbJK1OmhJV
         6Ena774fx50vwZtsuFIav8Vt2F1LpYcP6GF5zulMLyuFCB8wrDE4oTvUBEsl21s3ZeKt
         f2EQ==
X-Gm-Message-State: AOAM531Xy5rpDpHg7TAo82WgUja1P1YEk13F+CMOjfk1reT3bZQTH/89
        oklUEGuPAptp2fUXn0wbjPWaHtopWY8bTmRFxknB1wmT4fMNCvPCElF+ReKo8mMyNitb1kv3cB8
        e6EyreQ+8G5bNma07Y1T4sErw2T4xly3WFjXvfZ+Zc4WLoJGd
X-Received: by 2002:a05:6402:447:: with SMTP id p7mr30046090edw.261.1633850162270;
        Sun, 10 Oct 2021 00:16:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKJ1LnCMDlzvINCMqobmWUknzNB8ILpJGIav9Gfqt0DYWqrzDusZHDUAUIdl48qhK1WrNnCg==
X-Received: by 2002:a05:6402:447:: with SMTP id p7mr30046080edw.261.1633850162146;
        Sun, 10 Oct 2021 00:16:02 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id bw25sm1786265ejb.20.2021.10.10.00.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 10 Oct 2021 00:16:01 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: add samsung,exynosautov9-sysreg
 compatible
To:     Chanho Park <chanho61.park@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
References: <20211010032246.146939-1-chanho61.park@samsung.com>
 <CGME20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3@epcas2p2.samsung.com>
 <20211010032246.146939-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6d300a40-2f6d-84b4-22ba-a47ffeba8d10@canonical.com>
Date:   Sun, 10 Oct 2021 09:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211010032246.146939-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 10/10/2021 05:22, Chanho Park wrote:
> Add document Samsung's Exynos Auto v9 compatible for system registers.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
