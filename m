Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51161C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 11:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbiFGLXp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 07:23:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241539AbiFGLXn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 07:23:43 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AEB29875D
        for <linux-samsung-soc@vger.kernel.org>; Tue,  7 Jun 2022 04:23:42 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id gl15so20663409ejb.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 07 Jun 2022 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0bdzMNhV+eEkaALdIGf5lJGoFxZEf1N7uScazlN3ABI=;
        b=AQj3G2h/moiSY90+Zprxhki7NKUcfZ1jVdtK2htMWc0U8/rII/5R9GJjcrR72PktfO
         9jrq77utdRXjm5SzKL/KKU7spjaJDcX0kyTgg6E1zrAEqbvONK1PcpW5njWT0DxGArui
         natuICTBSPCEHXt3GEXrzkEymw9VNlesh8sAkC9JWIulSeRn4GwEb4E4nGHCc+JrZAjr
         ppTjacxZZMuAfiAyKTl4NTLIRnuiYtq2GnHMpyiHrZZF0x5Ah46IyMoBkYYcj2u37he9
         TFWZCU3DCn/phiPXxHfHxWx3FS4B9HPjXgLTpIFHg1DuxwJXz74NEhIS8OOvt7TR3cdL
         7fqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0bdzMNhV+eEkaALdIGf5lJGoFxZEf1N7uScazlN3ABI=;
        b=qA3BY7BNYLYaLM/taDdn8AFjJp6tIQRIUNFacoNlwSF1L2C41UXKbx1C8rdHHiQbQ5
         T2YcgEeYyND4YN98L2OHHK5ThBUGzE0rQmRCOSPD4NQ4b1hFBtbeCtceFD+a7DXCzMEV
         bhEapVzyREgVCJ7ZFdA8SKimIhHFO6k2mLN2W1nwa4x3Rid5p9OBVG3cRcBl98NMSdMP
         n8siBxuv9U9IFE6z7blxsJiq+/Y8GIFGCcvyHclaimRcGCKxwrNN/eq6t3zYyG9z9Tr6
         D+j8Sa/4o6nmHNf3u04oXP11nupyelVOGByaJlfH3M1opqSpSwq0WsXIHhH9vAlkMXwb
         wHXg==
X-Gm-Message-State: AOAM5335wJ6UgNNooaiz97mi4w2VHAbgJ9qg75BN7hyo1hj+0toU+i4W
        +DnndOoEyE67/htkOCsKqz9Tgg==
X-Google-Smtp-Source: ABdhPJyNkoR93R7Td3RPfDitzwFDD3/QZ+0tDUF3Fae0/IAJyHXMcRvv/v3MvfX+oytsSYwgkF8F1Q==
X-Received: by 2002:a17:906:99ca:b0:711:bdca:b85a with SMTP id s10-20020a17090699ca00b00711bdcab85amr12530244ejn.224.1654601020710;
        Tue, 07 Jun 2022 04:23:40 -0700 (PDT)
Received: from [192.168.0.183] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id v2-20020a170906b00200b006ff05d4726esm7512210ejy.50.2022.06.07.04.23.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jun 2022 04:23:40 -0700 (PDT)
Message-ID: <d5310b6a-ffe9-a72d-f324-2c00db036ae0@linaro.org>
Date:   Tue, 7 Jun 2022 13:23:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v4 3/5] phy: samsung: ufs: constify samsung_ufs_phy_cfg
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
References: <20220607072907.127000-1-chanho61.park@samsung.com>
 <CGME20220607072938epcas2p4aa59fc2826fe0563bc1f8f68301e2bb4@epcas2p4.samsung.com>
 <20220607072907.127000-4-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220607072907.127000-4-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/06/2022 09:29, Chanho Park wrote:
> Put const qualifier of samsung_ufs_phy_cfg pointer because they will
> not be changed from drvdata.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
