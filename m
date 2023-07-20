Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0F89EB64DA
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 09:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230184AbjGTJfs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 05:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbjGTJfb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 05:35:31 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0481268C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:30:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5216f44d881so717942a12.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 02:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689845368; x=1692437368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v/NyCrI4EzkDt9EAmshDvGJM2CpilgtcwKIHXzlEGk=;
        b=cm3sk9kXEPgW3mYvIJKWgHIbyXxBIyeP2GTzXYpaMPjDpJ/uaI7lCU6PWmZxS7v1s0
         E8o0r8kOa3X0Iz1hpieE0ahN498wbAqczIEOvz0eyVNLLW0vboO74MPckWNaYGTBffGx
         x6NFgB6TCeNxzODYAuCKMAlymb9r7XrFQ6QDOfs4x2gnmnZpuC/FHgE1u6mX4XjNt1jo
         BdTvidWmBY0iisUGw4ge4LkJRAHcTIQjyFTZRTIncfeMUYZUAZmMMwmAl2wgfiyDULXy
         5RILXJ+CzsEZ4gwj0nF783r+dn7Mt/nYVi/4Ih0gXIx/PGL0n8c9LL3Y+xp1pWj/58YZ
         L3jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689845368; x=1692437368;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9v/NyCrI4EzkDt9EAmshDvGJM2CpilgtcwKIHXzlEGk=;
        b=AZJLo/0ONbW4KR9+YEHLDeOQ54U5TtCHV70m7sIP/EBokcGmBouErFGZb7lFb08oLf
         GltSs+I01d40zxFiuNN491JhO7X2k96nc1lkxUOGT1SfW/CJyJt7hWTrwMP/WIm952fx
         C7jGz5A9nGEeAMsmUf5dlz8DPj466ZV50uBuS+Xx0Lo9xJ+Rv641IEvlhNHW7BhfhLgx
         P1V//NkblsqCxLVsHt4zzioCD/sIhHm+b6Q0Ekq5dBBGXhfcSkG4hYtiR9q8J/8RF81q
         pc3TGPYJdo9quTRvBxgoJ9jSTRNLeZB+iigLVuA85zzaWsZaIBec4s+xeV7WkqVkdmNf
         uNbA==
X-Gm-Message-State: ABy/qLbr8L2aPwghriZmGKYSeQAnSrqwzIaIRnAP544QUWueTO2TB/w2
        /vg3pWeuznWrpqjrE1oQNNH+Fw==
X-Google-Smtp-Source: APBJJlEEj98eLgSZMkjuQISPkfJD8TekAKb3FPjOs8P62kj4VtSlkNTRHhSJ/x9oW5axUArfoycKKg==
X-Received: by 2002:aa7:c309:0:b0:51d:d4c0:eea5 with SMTP id l9-20020aa7c309000000b0051dd4c0eea5mr3670330edq.40.1689845367972;
        Thu, 20 Jul 2023 02:29:27 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7cb51000000b005217a24addbsm481875edt.20.2023.07.20.02.29.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jul 2023 02:29:27 -0700 (PDT)
Message-ID: <2d3f49f1-1bd4-45ec-8bdf-2d76d338a384@linaro.org>
Date:   Thu, 20 Jul 2023 11:29:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] ARM: s5pv210: Explicitly include correct DT includes
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230717225446.3211738-1-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230717225446.3211738-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 18/07/2023 00:54, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.

Your SoB is missing.

Best regards,
Krzysztof

