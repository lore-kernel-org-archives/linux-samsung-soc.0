Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D7B1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Apr 2022 09:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233071AbiDGJVt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:21:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237596AbiDGJVs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Apr 2022 05:21:48 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140B11DE6FE
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Apr 2022 02:19:49 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id p15so9506463ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Apr 2022 02:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=OhZn55oqpDXIvKLvKoNusLeA/Le7lGuQ4Qseb8DPsUQ=;
        b=o4mWa8llyJhR0hXytKXYg8Jm7+j7FbG2XIo9m1ek+brBno+uQo2HZZWkbmW5W/9QcG
         c9Py20S5rz3TcDCjRoQnwxvRO8Pkrhkzh4ftv0afwjRkBsyuHD5Vw70dKpJ84c8wdxnO
         WXI4ShYaC9NoYd9QFGcYQRCek9oQ5gLfsybO/i8ECbYTP1uaaZ6ak7bZ4nXz2PPHNC5S
         j+glrsqr34TjNHReLgx1ujxSXbR82hJgdwJbkae2lxWzi+cz8tIm+kVPdBoGMyS+mCk6
         dUp0UjvY9vxal/bAIH62k2ihxs6F5Ge99WJ7y2gJUnump2hDZi2/9Gv6/qM72qx9usWL
         08rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OhZn55oqpDXIvKLvKoNusLeA/Le7lGuQ4Qseb8DPsUQ=;
        b=TXeBxykQ59T0ZMDz9JLbbqdIoiKA30Wqa1PMGDEaNxtThSfPBCIc7kwyH6YA97ZbOo
         ewvwuC9XiNgUpiDzI9Ac2jg2yImpHaQtBJuHV0Zf8hK8oOx1+ACI7JjSKkqVCePnvzj4
         dTPyV1qaZZmwI+2UaUYdhYiKnqlt9uTb6ezd+87Hk4nG5lI9zZQDGMehEN7f5P7U9/Xo
         PjTzE4UogLXzt7naRr+kcJFobp4s1DHxmye6S2jRQG5yQKed1FuyTq5A59PptZ1fSZu/
         +QOFp9aC6oTk8PCDYfSRtqwxKUpb8YbFpt1u+S9qeP879zYoUtNDh2kIfGhdEXvpdAvv
         pYfA==
X-Gm-Message-State: AOAM531yDPtw/qEBTfmJfYZ4PXCi3PZlp0zmRyqna458v6Ku5jP2jxXq
        sJkvVBYrQ/xEeIt4j9Znuxd0Mw==
X-Google-Smtp-Source: ABdhPJwrfOj4aHp2YqJnDOzcr0lhU3Ho+3z/I+Snr1r/9J1rjLJks+IfGB/rZ/rf9fpkMv+YT4ttzA==
X-Received: by 2002:a17:907:608c:b0:6e7:fc15:2db9 with SMTP id ht12-20020a170907608c00b006e7fc152db9mr12144063ejc.344.1649323187671;
        Thu, 07 Apr 2022 02:19:47 -0700 (PDT)
Received: from [192.168.0.185] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id f15-20020a50e08f000000b004134a121ed2sm9146929edl.82.2022.04.07.02.19.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Apr 2022 02:19:47 -0700 (PDT)
Message-ID: <7da30fdc-cef7-879a-69ef-6993e05beda5@linaro.org>
Date:   Thu, 7 Apr 2022 11:19:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RESEND PATCH 2/2] phy: samsung: exynos5250-sata: fix missing
 device put in probe error paths
Content-Language: en-US
To:     Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Girish K S <ks.giri@samsung.com>,
        Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>,
        Vasanth Ananthan <vasanth.a@samsung.com>,
        linux-phy@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220407091857.230386-1-krzysztof.kozlowski@linaro.org>
 <20220407091857.230386-2-krzysztof.kozlowski@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220407091857.230386-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/04/2022 11:18, Krzysztof Kozlowski wrote:
> The actions of of_find_i2c_device_by_node() in probe function should be
> reversed in error paths by putting the reference to obtained device.
> 
> Fixes: bcff4cba41bc ("PHY: Exynos: Add Exynos5250 SATA PHY driver")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/phy/samsung/phy-exynos5250-sata.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)

I forgot:
Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>

https://lore.kernel.org/all/018501d834eb$01e62ad0$05b28070$@samsung.com/


Best regards,
Krzysztof
