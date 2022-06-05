Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 077B4C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:13:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349869AbiFEQNz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234405AbiFEQNy (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:13:54 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A585439802
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:13:53 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id u12so24750142eja.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=lLHJF8itDbCGt5pN7A8NEdfZyjPyqD4Q2iUB6Pm/cZI=;
        b=gCYvF/1H1j+deX0Y/2/FaDJPBMTqvx99p9n/PNmRiwrh9IFGFd1IzqHL47KaRa/6ju
         dEhJrdk5RhtB52l6qON8qGwcXsblI7XwBZeblHyYOvCWcZIJmdvCQHRRUJCdwAHZaedc
         X08gX8FPdL1ZkcJJ8dfMZtqE0dkT+cycYnw6GpEi3huju9obp9JYDkA6PStBJ3qHeVeb
         L0f8vi8yqyJEj9i+adbDIulAW5SJcwacUeifWMD1vDG2R3DarFbJYAVFeF++ObFXeasA
         9HTyq4YfG6ysQMDEL9SqDK0gpmn69OTDgbgM1bQrU8fVFbUvcG1Z/KhdXeEQrPcCHXsG
         /xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lLHJF8itDbCGt5pN7A8NEdfZyjPyqD4Q2iUB6Pm/cZI=;
        b=Fop8vWgVJzUBIbINI201oQClxAw+9G8piYOtWgTc2oHNwapJJlmxr+E1fQPsC79vHx
         oXtZFLtalVCMu01Wbvn+VQT7alNzqDLztZ2ATNSkNPfIZu32j1CwT1BZHyKyeGEglrFT
         iYaOnn2uu6dtolunOYtU+2VKJR4Zi8ZYpnnSj4AOt3nAOqIq7aG8q88beeV/ky40WggQ
         /fSTnZkbZq8+tSLIbKaMSXsW53M9yywWgyjDuZpKvoMDyeYwj9gqbg9d3dGcsDK6E0qO
         +oSuOQUd5ei88Q3Segh5n4lN4QZIimIq+yY8TXMnHRedf7q8IWs7EFHiGNm4Rmg+FWCG
         Ib7A==
X-Gm-Message-State: AOAM532mUL2JjFMK72QaOXlft9Q+Flo4xHH0n3aiyommMrH6UMmkhacP
        eu176nj5Fp3yQ0vv7ETkNUrnLA==
X-Google-Smtp-Source: ABdhPJwwQYWTE5gohxGjKVA+yFqOkqxemhBBY3bbZX1d8bQy/ZXhYxTyuC3zFWFIOKQAAd4IZI/qXw==
X-Received: by 2002:a17:906:2001:b0:6f3:bd7f:d878 with SMTP id 1-20020a170906200100b006f3bd7fd878mr18306906ejo.133.1654445632295;
        Sun, 05 Jun 2022 09:13:52 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id e20-20020a056402149400b0042bd75c53casm7095695edv.83.2022.06.05.09.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jun 2022 09:13:51 -0700 (PDT)
Message-ID: <8c125973-0221-6610-79ad-df1587cc70fd@linaro.org>
Date:   Sun, 5 Jun 2022 18:13:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 4/5] phy: samsung: ufs: remove drvdata from struct
 samsung_ufs_phy
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
 <CGME20220603020426epcas2p43c70afe414dc36f3abb18cbdb1d450a4@epcas2p4.samsung.com>
 <20220603020410.2976-5-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220603020410.2976-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/06/2022 04:04, Chanho Park wrote:
> To change an offset of pmu_isol, we need to store its data instead of
> having drvdata's pointer. The definition of the pmu_isol structure
> should be extracted from samsung_ufs_phy_drvdata and rename the name
> with samsung_ufs_phy_ prefix.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
