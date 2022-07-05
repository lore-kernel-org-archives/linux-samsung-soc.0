Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D17E5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 09:32:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230170AbiGEJc2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 05:32:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231203AbiGEJa4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 05:30:56 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54FF113DC2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 02:30:54 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id i18so19532140lfu.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 02:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=25RFioIXsDd1V/OTuFJDIoijZiLPJ85nAmDq5oM1rXE=;
        b=RjDqVyyHnHJTKwb1zAXIYHD8G47BhHa9faCZRb8LhoO8l2Acfm3WfCLa3S3YQrnqxr
         7rJBu9AfOHhMjg9Tg5TXqqEYYQct2sIZR3hiAFEfuG3MNyoXyb4qH6Uj25eYz++znS8D
         FDj+vYEVidM8FlxN1Z+a7FS9hoXSohWFhobUGuNe+yNpTve4kf8DP+YK6J8k7VMIdfgM
         dOL7rE6gkk5ZzGN75LJF04FdntRQt7Vj1NAEcFpl/6y3wfR7xfplZUVpBAKdzAR+1Nhr
         7WpZZIC6bzYrxOsB2sKc9T4UL6/HSchnysI4fJIq962gD1Et6lWLJiycEGq/iEKM6nE8
         foRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=25RFioIXsDd1V/OTuFJDIoijZiLPJ85nAmDq5oM1rXE=;
        b=SDTSLeu2VrAKMU9R27MaJCgX2FKNqUADArSIulToapZ1fTAx09R/vr/Mr0X95io3MF
         c7Hipo/lNThPdc7oR+UjYddEF1OZux317XGLfwizLq8zdlaDYwQsHkSPFeP5Mc9/ZyyV
         zJEJkLkgQTH5PQ5oSdOaREqdpmtgTK/qBPUhSrLczaqaTAuorfoKd5di8U5xdPFyQuJf
         EEkckH3AmXjqWsNma/ooatDHq2eHLBjBg43Z4rtBe7LMHTJmvGg385mlbw+tK/G7ueFm
         nJWGc7qIqr8ch2o4WMc1Fops4uxeTcSlYpc2cBS4LeYap04SCed0GaeH7KdBrPh1Tc5V
         56+Q==
X-Gm-Message-State: AJIora8gNbbTiOLbUNnx8MSfTiNrVJkxIg81GyEHjatu7m+JUkugjcMQ
        sFO9rCUiw/Z5BSgBcwjaHd+vNQ==
X-Google-Smtp-Source: AGRyM1tzHaMhD9AcvedsJKlqa3XUgEpYZiDx0EQv97JGtZN0QNuEQBVtHzNKqU74KximQc03N/+4ZQ==
X-Received: by 2002:a05:6512:261f:b0:480:fd2b:23c8 with SMTP id bt31-20020a056512261f00b00480fd2b23c8mr22443229lfb.434.1657013452562;
        Tue, 05 Jul 2022 02:30:52 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id d17-20020a0565123d1100b0047f7a5e0c23sm5592896lfv.275.2022.07.05.02.30.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Jul 2022 02:30:52 -0700 (PDT)
Message-ID: <d57a09cc-ed11-44d9-f2b3-55bc461f16de@linaro.org>
Date:   Tue, 5 Jul 2022 11:30:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] phy: samsung-ufs: convert phy clk usage to clk_bulk
 API
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        "James E . J . Bottomley" <jejb@linux.ibm.com>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>
Cc:     linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20220705065440.117864-1-chanho61.park@samsung.com>
 <CGME20220705065722epcas2p2973795cc88ee436480abcb48435059a8@epcas2p2.samsung.com>
 <20220705065440.117864-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220705065440.117864-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/07/2022 08:54, Chanho Park wrote:
> Instead of using separated clock manipulation, this converts the phy
> clock usage to be clk_bulk APIs. By using this, we can completely
> remove has_symbol_clk check and symbol clk variables.
> Furthermore, clk_get should be moved to probe because there is no need
> to get them in the phy_init callback.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
