Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50132C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Dec 2021 18:28:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243343AbhLISbt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Dec 2021 13:31:49 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:47430
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230526AbhLISbt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Dec 2021 13:31:49 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2916A40192
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Dec 2021 18:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639074495;
        bh=0TOWgoinpB6HsHC3TLB9+WhBd19PoQ1CpE+6d8HXmNI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ilG0zfwsbTRBuHtbBcKW1jvBPedMk/ZsqZFZAsGJMMAJMRZtYDLMSdAWBtj+pJ5UI
         q7nwdT63xXnib2O/z7zpAfOXW+obyu4exYunhQGHVxgoJxTj8d2ujZcrZzVNaGdFbt
         R1mSHfA1oHUirDuyooKNGLRJDPRSzI3mXdRF6O8Q1s/W8tLQpne1dfWohQGlHZW8oE
         bWeGsFnLGvRhb7oLxJ9k7pYJa3MAsRMl08KEqdDMjU/iWpa862dzLYhYIWP0Zbtdqz
         vt4N9z5y3AezByqBqlEgnZIdw9EKeR6asxyeoIUjYCdV63/K6LFvhA1GnPBcb+v8Jq
         tuIIz5UiqLugw==
Received: by mail-lf1-f72.google.com with SMTP id k32-20020a0565123da000b0041643c6a467so2962212lfv.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Dec 2021 10:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0TOWgoinpB6HsHC3TLB9+WhBd19PoQ1CpE+6d8HXmNI=;
        b=4110bnv8B/ASDV47SNWBWu8YmoBY418gTunp1v/+/zfS2+Ky/6FWbuhKVpqUWhNpMa
         hXbgIrtSmfItymP524FI2aYn5MD3uzfG5Ktqfn71dBk2KlEgLRmeOp7suX/aScMDeEjn
         nJESNCVlz8kkBODoOrXv3XRTek4K5Xkmmf4ZrbReU07e8zLf+3XyRWlltAiWHRS6Ky3M
         wEx6EbVoh6fCFzMlfPziPd2ty7vg0wn8cgsF6i36cuiaMX8eWBz7KcwA4mAqwWSS+7Mv
         vAS0/mdMznEFoqZO7K8s0S2IO9SFwqI2RtnbTCCDSzHZw38YexrdIdLaIH70UoqjSrKm
         Rs2g==
X-Gm-Message-State: AOAM532YxDJvyy8k7GII4BQFfG453frOatKzBaR2fsn6jrE3K22MORXI
        UuOy3M7LT3bnMVRbZUzMAGw45Ppn3Vrv+o5uNri8EOiImKtVjWceXNcBlb+z5L46DynGmuHc8pK
        QdkgoSnRUCpbGI3wd1aNQjndAl7xsLfNFaVQKzrphyTe5tb0v
X-Received: by 2002:a2e:a4a5:: with SMTP id g5mr8158028ljm.176.1639074494589;
        Thu, 09 Dec 2021 10:28:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzupGrl6vs/wISAHYhPkhki2lDaNP+ZXwbOBSA2s8njyGVfFR6m2hmzQdsCGiDZrJd/tqxzVg==
X-Received: by 2002:a2e:a4a5:: with SMTP id g5mr8158006ljm.176.1639074494392;
        Thu, 09 Dec 2021 10:28:14 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id u3sm56397lfs.256.2021.12.09.10.28.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Dec 2021 10:28:13 -0800 (PST)
Message-ID: <cf76cbaa-5ea8-ebf1-73eb-7b99dc02f2c0@canonical.com>
Date:   Thu, 9 Dec 2021 19:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3 2/4] mmc: dw_mmc-exynos: Add support for ARTPEC-8
Content-Language: en-US
To:     =?UTF-8?Q?M=c3=a5rten_Lindahl?= <marten.lindahl@axis.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     Doug Anderson <dianders@google.com>, kernel@axis.com,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211209164558.13729-1-marten.lindahl@axis.com>
 <20211209164558.13729-3-marten.lindahl@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211209164558.13729-3-marten.lindahl@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/12/2021 17:45, Mårten Lindahl wrote:
> The ARTPEC-8 SoC has a DWMMC controller that is compatible with the
> Exynos 7 version v2.70a. The main differences from Exynos 7 is that it
> does not support HS400 and has extended data read timeout.
> 
> This patch adds compatibility string "axis,artpec8-dw-mshc" for
> ARTPEC-8, and DW_MCI_TYPE_ARTPEC8 is added to the dw_mci_exynos_type.
> 
> Signed-off-by: Mårten Lindahl <marten.lindahl@axis.com>
> ---
> 
> v2:
>  - Change compatible string vendor prefix
> 
>  drivers/mmc/host/dw_mmc-exynos.c | 47 ++++++++++++++++++++++++--------
>  1 file changed, 36 insertions(+), 11 deletions(-)
> 

Here you dropped my tag as well.

Best regards,
Krzysztof
