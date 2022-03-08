Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B592C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Mar 2022 14:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347436AbiCHOip (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Mar 2022 09:38:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347508AbiCHOio (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Mar 2022 09:38:44 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA0C42A72D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 06:37:45 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1AE1C3F613
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Mar 2022 14:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646750264;
        bh=GQhf5FMMDwlXkcpGtUZU5kpnoxqIM3H1XBt87rWPIas=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ZJHj12rWGbVi6KEEt7guWjkujYjuPXxSd73w83pLTleiFf0s9n9M2TayIjc8hw0Du
         Nq0Ta0HSA7ipNvyRKS6ytiOwt2spN8c5a5bLrq7ydyEuKTDkqyWe2xordGZmpe8YPs
         sCw5seGE77J3dX8bT5JR1Fg9RUPAfF1XIAPueySy+K/uCKTggctZ9npLHnv5iAw0g+
         uDxtHca1m9ypNJvgw0kLIdd1kWeIwH/l+B5cchcuXqxyFDTu9WDkkSg/G1uOgGoQxp
         Xy5ZF2MIPgslEcd7pzDrn5oqaGuDUvyOmrLfzg+nvwdGm3+gRdlOnQ7wDxF5HUriv6
         wEqo4yMPkKf+A==
Received: by mail-ed1-f69.google.com with SMTP id l14-20020a056402344e00b0041593c729adso10736490edc.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Mar 2022 06:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GQhf5FMMDwlXkcpGtUZU5kpnoxqIM3H1XBt87rWPIas=;
        b=U7W95cGQtP78HohZ8ZVtDALNJlMFNYNoxum0giJx8p3cqaaqPJmSd7emQPtg1USPQ+
         seSLc5LT6ld6ZK4SOrs5Z28rtz6+xz7si9SujguuXYUa3u3bpqyaDRK0pXNuUv4KrGiw
         a/hPZJR+lQn11zuyY0LZH1CF9UJLsCJhEFIizSkWFLtHTIl8K4Jth6yX8lunE/BvsRNZ
         6+FDQS2fQ7+urxXFZ/GNkz5qBiXDGgx2O605UyPcG8uL9gTYv59gpaFEbkEhcFAq7Ap0
         +tXX+/By7zeHRtOzPbXJoedNnj80662OFydfhem6GqypLZJ80wmi0rmk8vKXw85w5zGF
         8wPA==
X-Gm-Message-State: AOAM530LwfqyREYQ60Nu6U4jlJYm63CVnQN8hQnD6Qck4cZ9Ciwv1RvV
        tCsF/9H237dHzKVnkUU0MHra/cl8zAx9y4bT0HkjjbEAOF6B0Z3Im7DrVYpnIwlRGvc8w/nKuof
        F0REY3aZ8VTUK+MfYLKJDatpxPsBFAUYMW02ylLKmZ3J4xC0/
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id m15-20020a170906848f00b006cf723408aemr13893174ejx.620.1646750263864;
        Tue, 08 Mar 2022 06:37:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHPs13dq7ClqBcdJtQ2TjHjlfNW1+0JBLXqLPlMbYx0Qdb5usODrxQXpim42hs00FIxKoO4A==
X-Received: by 2002:a17:906:848f:b0:6cf:7234:8ae with SMTP id m15-20020a170906848f00b006cf723408aemr13893155ejx.620.1646750263680;
        Tue, 08 Mar 2022 06:37:43 -0800 (PST)
Received: from [192.168.0.143] (xdsl-188-155-174-239.adslplus.ch. [188.155.174.239])
        by smtp.gmail.com with ESMTPSA id a102-20020a509eef000000b0041614c8f79asm5773963edf.88.2022.03.08.06.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 06:37:42 -0800 (PST)
Message-ID: <3fb46905-6946-7164-4229-82d5d7d345b4@canonical.com>
Date:   Tue, 8 Mar 2022 15:37:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 1/4] dt-bindings: timer: exynos4210-mct: Add ARTPEC-8
 MCT
Content-Language: en-US
To:     Vincent Whitchurch <vincent.whitchurch@axis.com>,
        tglx@linutronix.de, daniel.lezcano@linaro.org
Cc:     kernel@axis.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, robh+dt@kernel.org
References: <20220308142410.3193729-1-vincent.whitchurch@axis.com>
 <20220308142410.3193729-2-vincent.whitchurch@axis.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220308142410.3193729-2-vincent.whitchurch@axis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 08/03/2022 15:24, Vincent Whitchurch wrote:
> This SoC has an MCT with 4 global and 8 local timer interrupts, add a
> specific compatible to match it as is done for the other platforms with
> this hardware block.
> 
> Signed-off-by: Vincent Whitchurch <vincent.whitchurch@axis.com>
> ---
> 
> Notes:
>     v2: New.  Requires Krzysztof's "dt-bindings: timer: exynos4210-mct: describe
>         hardware and its interrupts".
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
