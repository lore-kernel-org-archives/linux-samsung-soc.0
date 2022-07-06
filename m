Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F28C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 15:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233634AbiGFPAS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 11:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233562AbiGFPAI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 11:00:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB35E25C79
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 08:00:06 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id bx13so18812488ljb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 08:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=8q9QgnCTavTwYZShsdEVrXJguAI8lvhTfczLs8cvsuc=;
        b=jvT4mGefaHQg4AubqPLfSjSG9m05o56nCkvuJpnzhlvmj5PJ74l2BdgfvtJUHLKt8f
         hjiyXlIOVbVPXL964FJHBeHnBOPKh3d2NT72oSqFWWeL1XdoNMFUjY/5K8v6SBOeg/yI
         AMjHsOpEun5J5IfnHpTqmjVSOHFV8z95R58bno+4T+YOOhFtMi5IAx631NladgYIcIbn
         W9+WeYGj4YLAhJQvutMuekJ8//WCqg8xselS5huA0S8rRcC2sWp7m8LNkIrdeqtE/rIc
         V8Nk6ArQT/5wDypdUfbO8oK08HSaAxL462s/YFxxXlu9CdFv5nZmtsY4SILIj6leKorA
         OW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8q9QgnCTavTwYZShsdEVrXJguAI8lvhTfczLs8cvsuc=;
        b=GPEHnaFIBAT3RUNle8gmCdePWiJAfuv2cfN1f8Dal4okpmt7PIkYjrZMfVXKzUsnQd
         /bFEbX+fQqkZTVQW90qssFpu3F0wHgV64JhFCe8wCKy50WnvzqY4ZYp6T8wR9PFzMboU
         3FAdxbt/sYOXmvx9/DjKEdFf6Enks+NmwNi3qSZFF1S7ntbfPiHGvAj7HUMe/jEyKQ7W
         +btucokPmFDvpTLnyDn0ItMGRj4Pp5rSlbsTVV+SgTddG5hZ/p9isHy80enhaoWXI2P2
         yOcmZqVyjGgHlecT0r3s2+OYBufdTjpuV3bn9RB1rMPs/QUCamvQ8JCsQdozbslBQKmt
         sr8w==
X-Gm-Message-State: AJIora/YafjLTB29GyNK4LTvaOxk5/KdDDYVzxqJnBHw/xAtCFJW0hEL
        ia0ncsroayRVbchu9Q7O21qeLw==
X-Google-Smtp-Source: AGRyM1uH+o4hDU5xuCNwsntNe4+vJIdSEa+zGAlRi7cU8q+vAzqHbjEnw1pzvxFpyPijaRvwBUq0GQ==
X-Received: by 2002:a2e:7a12:0:b0:25d:3626:594a with SMTP id v18-20020a2e7a12000000b0025d3626594amr5172649ljc.386.1657119605273;
        Wed, 06 Jul 2022 08:00:05 -0700 (PDT)
Received: from [192.168.1.52] ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id e14-20020a05651c038e00b0025a7056f4easm6241838ljp.85.2022.07.06.08.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 08:00:04 -0700 (PDT)
Message-ID: <48bf9619-db6b-d2d4-efd1-a3ad1167abf2@linaro.org>
Date:   Wed, 6 Jul 2022 17:00:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/3] dt-bindings: soc: samsung: exynos-pmu: cleanup
 assigned clocks
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     'Chanho Park' <chanho61.park@samsung.com>
References: <CGME20220706095044epcas5p36a3f3a15e71dc95d11053e9a5343b8fa@epcas5p3.samsung.com>
 <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
 <02d401d8912a$85e10440$91a30cc0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <02d401d8912a$85e10440$91a30cc0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/07/2022 13:21, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: Wednesday, July 6, 2022 3:21 PM
>> To: Rob Herring <robh+dt@kernel.org>; Krzysztof Kozlowski
>> <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar <alim.akhtar@samsung.com>;
>> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org; linux-kernel@vger.kernel.org
>> Cc: Chanho Park <chanho61.park@samsung.com>; Krzysztof Kozlowski
>> <krzysztof.kozlowski@linaro.org>
>> Subject: [PATCH 1/3] dt-bindings: soc: samsung: exynos-pmu: cleanup
> assigned
>> clocks
>>
>> "assigned-clocks" are not needed in the schema as they come from DT schema.
>>
> Sorry, I didn't get this, you mean "assigned-clocks" comes from DT so it is
> not required to be mentioned in schema?

Maybe this is not accurate, so I can rephrase it to:

"assigned-clocks" are not needed in the schema as they come from core
schema.

Best regards,
Krzysztof
