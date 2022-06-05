Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78D00C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:08:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347051AbiFEQIo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:08:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241758AbiFEQIn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:08:43 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2A75A1B1
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:08:42 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id z7so15843647edm.13
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tIgKVMtmhbJ/yQDQy1ksmKE3q8q6VHVyHRkt89LKTUQ=;
        b=G4emj7bhfnaa3mfF/MnUDuWYGHLr5bxddaecNKd+brBrtkI5NCY5EekgN8TRNliJev
         7jH7SyTHMWFLDwAlmR1hKROa17156HQ23w6DNuCOUe1CYER6ecLKHbZlPBWbklqLtGkJ
         fuuCPy0rkHzIaXQegRz8XRWvw0mzAaSBLfRRRTWeM80jkP0HrBfy9kJYiPpC5OgxSCDF
         CsyHoFewNkNiKUbxRY9X+k0WVcEIZKwgsExwIeyWyd3WvwNVAg1gJLV9nER1ekhVO87F
         q6D2s1n6BdNxZjK1gkCHMh3EAkMHC+0A9P7fdY6uY/BCf3Tq1HXOEVW27HQRS6Rp2JE8
         3nPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tIgKVMtmhbJ/yQDQy1ksmKE3q8q6VHVyHRkt89LKTUQ=;
        b=dELqcTPxOM6B8ES/tN2D2mtNJ1BOnE277xYFPhs71vGLeySpNRvVyy4jFYlbuZmj9N
         frPJILTenLdXnB3QRULID8ipd/f9CMsXEzvrJyALRYmwHo0OyxKo/WcPwCUYvVO7cLmY
         oycyt7muEmiXiuVpHeTSoHEqHuUI/8hKyQ0RBd0WOFBQvp33uXsog61UYzGliAHv8d9V
         gL2ntgf7qetCeBOkS0MnTO279hZvnP6OYWmHyRIUM5dMBQy8Mxc3jorXRrBReZiKjOzf
         fsTOohndmBVQ+5j/lpQrOjSWRiJl7ZjdE7nRz4nKzG/BaD0YvP77Y4tnzrowsNk0NKZG
         sk2w==
X-Gm-Message-State: AOAM532848S1RD/qAoGoo4uuCGZ42P/edBMzAu7DdHHXH56qcAUsbvRE
        M3BCm3nFpH7RtFvxLch8OsEc0zbQtpnbrw==
X-Google-Smtp-Source: ABdhPJy8Hs4LLrm6+pH+VUU7Dq9ew5esPZNY3uTM3+0zdWwA5oV1gsR+RpwU/zB37h+RM1xxjSKTxw==
X-Received: by 2002:aa7:c492:0:b0:42d:ed6a:26e5 with SMTP id m18-20020aa7c492000000b0042ded6a26e5mr21719521edq.64.1654445321340;
        Sun, 05 Jun 2022 09:08:41 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id l15-20020a056402344f00b0042dd3454512sm7023434edc.63.2022.06.05.09.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:08:40 -0700 (PDT)
Message-ID: <2b6e5c23-ed33-4aaf-415e-02a826e8642b@linaro.org>
Date:   Sun, 5 Jun 2022 18:08:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/5] phy: samsung: ufs: rename cfg to cfgs for
 clarification
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220603020410.2976-1-chanho61.park@samsung.com>
 <CGME20220603020426epcas2p484be447d93da1c015415fb2847f659a7@epcas2p4.samsung.com>
 <20220603020410.2976-3-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603020410.2976-3-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/06/2022 04:04, Chanho Park wrote:
> Rename **cfg to **cfgs to clarify the naming.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
