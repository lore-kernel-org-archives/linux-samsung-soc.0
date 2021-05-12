Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74B2C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 May 2021 11:47:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EDB061353
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 12 May 2021 11:47:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhELLsS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 12 May 2021 07:48:18 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55324 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELLsS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 12 May 2021 07:48:18 -0400
Received: from mail-ua1-f72.google.com ([209.85.222.72])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgnKW-0007OO-Ut
        for linux-samsung-soc@vger.kernel.org; Wed, 12 May 2021 11:47:09 +0000
Received: by mail-ua1-f72.google.com with SMTP id b34-20020ab014250000b02901eb696c5fbaso3081606uae.22
        for <linux-samsung-soc@vger.kernel.org>; Wed, 12 May 2021 04:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yBitZcNhIM9z4KET6YAuzNPYaMvvVUiEAXXH4qj8xVM=;
        b=ZJ0AeT+nb3maAbr4XSGeJL0RUIp9R/hQwjIXJNtEeCMy8ppq8I+YBg53UiE4pWeOI3
         F8zrkPENOu0/dyLGEbcMfPYlu6eTZC++9unZ5BZmavgD0VI5/1NkRM5Bo0VV50JjT/SA
         EdA2nLaXaDuolfS+UgMgXDjBN/vHO2UdWsZNEP2ioZxu8EDcPHGK2dX4xZv8KFciGCBZ
         dXpkyS4xIFIo9zxkh5DUzTXAOWrlg071bsvjFz86zbV40/MpEbBqHxTBwIo3DVd2QmyD
         7wmAnHvdkPCvpzcU0w2e4Lz0qAcZa9199cnEtGqFIBFd5XHAb6H2bCTC/VSUNIVg8qLE
         e9iw==
X-Gm-Message-State: AOAM530BEt0IOODoqTSvKnDSX5qiY0ZmNZz+NjN6d5cQBwSroqcdc4VA
        zW1gdxq7byoaR09JNbifKOz7A7MvhzlyPRpZHNjoZ6w0VWOH5NVW+nxDYNCJjBME8ioCjRlmUCz
        SvDnJMh9VM17pIwozgkmVVoNrQqPGq4SDLo8Iw3DKvNraJf4y
X-Received: by 2002:a67:e915:: with SMTP id c21mr32088443vso.32.1620820028096;
        Wed, 12 May 2021 04:47:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYslrlexrDVfJAQWZv27Gx/WKb27rynSQ4drYxmvnOGuiXWdUXlFKZ/Vt3FdWmjVrKIrO69Q==
X-Received: by 2002:a67:e915:: with SMTP id c21mr32088437vso.32.1620820027940;
        Wed, 12 May 2021 04:47:07 -0700 (PDT)
Received: from [192.168.1.4] ([45.237.48.6])
        by smtp.gmail.com with ESMTPSA id s200sm2594366vks.34.2021.05.12.04.47.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 04:47:07 -0700 (PDT)
Subject: Re: [PATCH -next] dmaengine: s3c24xx: add missing MODULE_DEVICE_TABLE
To:     Zou Wei <zou_wei@huawei.com>, vkoul@kernel.org
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1620801555-18805-1-git-send-email-zou_wei@huawei.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <ee04c671-1194-402f-c82f-36c139dd5ca7@canonical.com>
Date:   Wed, 12 May 2021 07:47:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1620801555-18805-1-git-send-email-zou_wei@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 12/05/2021 02:39, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.


Hi,

Thanks for the patch. It cannot be built as a module.

> 
> Reported-by: Hulk Robot <hulkci@huawei.com>

Please make the reports public. This is open source work and public
collaboration.

Best regards,
Krzysztof

