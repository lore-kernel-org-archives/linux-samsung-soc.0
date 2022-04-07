Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8554DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 09:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239510AbiDGJQZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:16:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243756AbiDGJQR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:16:17 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E7714FB96
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:14:16 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id k23so9513270ejd.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=T9hbqxWr3I36mglxxaMPa10oONO0MCgwf6BD0FLzWtw=;
        b=eO4MUCyyGxX9SOB5z9Lont0uzM3DcZSWLOusZOuj8rzTIb6Fp2yFzTdSQDIpCWauqS
         vtK2nv1Um/l7zzyAQFdfYN8jhZM2BxO2cM3X4HvKKNAEBZZ8kEaqGR9buc2NadHdFLtV
         1rw7v0SPt1GAerhe6wVNUOxjln43HXUZXXes5AG/QwahrnirdDcE7w5Xn0CMJ4X9ZEk0
         SQsypivARX3TBNAp7cqf5R1dbbCCMX5sACcACcf8tXCYfWbPIVmlcNJzo6u4iOMgP+kz
         Sg18cqif/zI9ejI2zGIHfJMmB1Zb8zW7JVigRNnLWzFX1Mc/0H0SlCHzZgd4F7hFB3jL
         lY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=T9hbqxWr3I36mglxxaMPa10oONO0MCgwf6BD0FLzWtw=;
        b=AfwAcNdTlu5Gx/CU50rq8ZLibbcAtPxwnE/k+/Txxq1ZGzIJitIklN484G7qHzvRLv
         o9tSx6q+e4RMkbQvokWhyDQkiSLttTH2O3CIB6FkkAAJfhq6hOMTdyATCdNEn19HCotX
         rnPFvEdPqqwgehYA2mtxKwGcOvGbZ8bVrJhn2S2yeCoC5glC/wtf1g0vZPvbIeqpKpZQ
         +p4P43kX2UMJiWpZNG8UgQnMKwNlAyBhYoDfeZHJ3Sik/bOdSRcF2cA8dZUKlh/Fk2kG
         9uix2S/MDuQbrcnQ3RzeR+I4CGHOm4ihtkxxeKdHC7c0+pO1bg2zTf1b8rBM/yRzrU9p
         2t+A==
X-Gm-Message-State: AOAM532FUAtw87YG2jlkpxQOFPqJIlnHCw4U15g7GH1Ug4MAkhNzVGvS
        lbusujv7XrWPtKbLW+w1aDCLNSVdzqN9MLgX
X-Google-Smtp-Source: ABdhPJwWNaQ5itZKFjdK/emZRoqIvnB/M7RMtAvxJPctGsYKAbriUxk7937cvCqFjNX/RfsRsgbTaw==
X-Received: by 2002:a17:907:97c5:b0:6da:c285:44f5 with SMTP id js5-20020a17090797c500b006dac28544f5mr12375007ejc.208.1649322854974;
        Thu, 07 Apr 2022 02:14:14 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b006e4b67514a1sm7515638ejb.179.2022.04.07.02.14.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:14:14 -0700 (PDT)
Message-ID: <ee0439ca-cf95-909c-3a9b-38dceac2daab@linaro.org>
Date:   Thu, 7 Apr 2022 11:14:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] phy: samsung: fix missing of_node_put()
Content-Language: en-US
To:     cgel.zte@gmail.com, kishon@ti.com, vkoul@kernel.org
Cc:     alim.akhtar@samsung.com, lv.ruyi@zte.com.cn,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
References: <20220407085958.2491783-1-lv.ruyi@zte.com.cn>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407085958.2491783-1-lv.ruyi@zte.com.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 10:59, cgel.zte@gmail.com wrote:
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
> 
> of_parse_phandle returns node pointer with refcount incremented,
> use of_node_put() on it when done.
> 

Please add fixes tag and rebase on this:
https://lore.kernel.org/all/20220309170028.51913-1-krzysztof.kozlowski@canonical.com/

I'll resend it because it might be forgotten.

> Reported-by: Zeal Robot <zealci@zte.com.cn>

I cannot find this report. This is an open source work and public
collaboration. The “Reported-by” usually means that the issue was
reported. Usually in public. Can we see the report?

> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  drivers/phy/samsung/phy-exynos5250-sata.c | 1 +
>  1 file changed, 1 insertion(+)
> 



Best regards,
Krzysztof
