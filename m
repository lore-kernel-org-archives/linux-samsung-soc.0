Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6629BC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 09:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232622AbiFBJuV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 05:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233218AbiFBJt5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 05:49:57 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF4AB29421C
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:49:55 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id n10so8912516ejk.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 02:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=p0yz5l9S1tSy2buhTZElzgLvRGRoFCpmLIWAz9pUW9k=;
        b=C6MsfkKx33wlafzB5jS3x2gGWVyt6Cz/qpDQSNH3FFZ/GnK54Mh5raDSBusyir/hQT
         ByWPUXeXBOV9q75B0sDuWf0P5y6/Uvendqkc3nR05fpC6dJNKhR6bCbZVj1kHwZ0tLAk
         DOemjBB1nNzuf+UOO8BqnP+rt4v7Ez02PNHUdoASALPN8P3ou1X9zmL+xwJkctt58Uia
         5dc++psB3H9PS/vOUOiNsnf+xuRjCzBrV5czbGnwZF41oInIiMx4bvUR0GbDmSx38Y+n
         E7fMRWYBUxJpH8sTEvgeSZ3vruAFqo4DXayLODFIC4tIjJWD1KXv2Z12BK0v81HRU5cM
         Ymaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=p0yz5l9S1tSy2buhTZElzgLvRGRoFCpmLIWAz9pUW9k=;
        b=TCID0KMmCcNujFYmz/46z47UHDSucepWBfJddi25AaZL4s/nR4i5lv9btQ8SQO8gsi
         yrUgwRWZ3CmRO+ANAZ1xR1iPXQKHULdGaOdLMmi8JH570DBCZ9iRyzVUkbZxXYwzndCj
         7J1IoXDqxEpjvJmZcxVnlSMuala/RCNWWlkkY3vcUFvfVozwqVWIhxqeolO6PyAgfsB3
         JcuLx8YrnaSNJPk0NFqKsnFXekJve8Sp/xabtbFMSwLsrZcW9pjfdRNKLzwjvuV7vHc5
         aJbDms26e8n/PvewPJscxhKDX78YDhCxfmxHkfxQVN1rmCK8IAYw9KKzsWI65uE3pBtO
         MDuw==
X-Gm-Message-State: AOAM531hhWoxHzBOqujlXh/p7GugTfL9Z/rdpVYA9II83mZJaP1cXOyb
        BlGMafXraofiN92Qn+RwbAPvww==
X-Google-Smtp-Source: ABdhPJwtA7IDRXjyprOMFtXFDEdlRst60x1P9bif0uKmU1TeReEoBqoWfIo1dS/Qd5LHhawMWbQOvA==
X-Received: by 2002:a17:907:6286:b0:6da:6e24:5e43 with SMTP id nd6-20020a170907628600b006da6e245e43mr3368001ejc.449.1654163394255;
        Thu, 02 Jun 2022 02:49:54 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c16-20020a170906171000b006fed85c1a72sm1565086eje.223.2022.06.02.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:49:53 -0700 (PDT)
Message-ID: <7fa34789-c0da-17fe-a560-e61084d16fea@linaro.org>
Date:   Thu, 2 Jun 2022 11:49:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 4/6] arm64: dts: exynosautov9: adjust DT style of ufs
 nodes
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
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p407039a6087b6c460d6687b1cc1f3872a@epcas2p4.samsung.com>
 <20220602053250.62593-5-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602053250.62593-5-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 07:32, Chanho Park wrote:
> Drop "ufs0-" label name usage of ufs phy and hci nodes.
> Regarding the comments of reg properties, we don't need to illustrate here
> because we can find the description from the dt-binding doc.
> 
> Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---

Thanks, DTS look ok, I'll take the last three patches after merge window.

Best regards,
Krzysztof
