Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CF06C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 13:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358162AbiDDNsi (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 09:48:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241323AbiDDNsh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 09:48:37 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05363255BD
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 06:46:41 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a6so9129093ejk.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 06:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=vfQJmcM0qrYi49vcCG2B2KxC0x5r/jsGZIFrh4niQZc=;
        b=sfdjINLCI7yuAvcOi9KAnb6V86j9QN3KifvcftXLDut+PGBdMIQThW4FvRrmxJqLmd
         QFcTxZRQ3/UbrId+SsClV+HVS1KzpmLCM2iKMQm+JCVEAxQeVapEVO9WQ+rT8ObVNev7
         KfCdHN00ZjbcQy9yqhVrf3I2SJ/F+dmwz3zIFy0oqzrcW71CB/ivFoNuFmhqUffhA/tF
         RSYMJEB6NKp33l3dBxF5Sj1vhQ7Ooe9UViHI7cN2Aihf9Jxvww4j0ktZo9tacyj/mqbn
         p0hwt93y85vKyrVBkxArcMZb04g9v7UAG9oFrpm5lZHdMCgdetLR7WnUUFPuG30IBR7W
         Ye7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=vfQJmcM0qrYi49vcCG2B2KxC0x5r/jsGZIFrh4niQZc=;
        b=Rl95MewkiO7hHX4qJDmhAvjNI5ZRD1gmG8tZF49n/DPyzGKYQW/7nc1d5fh74ojnlm
         Qs7WdKeQrWv+nYln0OlKGmzDXRo5k/PBgeQOtpQC40+hDis3hEthczzqXehmO+G25mLP
         dqm42wcD++zjkBbNP3bNw9iTN+gtFegV+4dvIHWKozC4ACAyMci1noyPZjNDRXi0y3/e
         1Oy7UGoEIm8mSbkaE9nZl9jryh/sRUGg+y5uc2fpPwCBe7aNTetiPCgXMTPOXaan1Hq/
         7VTDm1GAlhKkegG+J0DOBMLX3dyv/Dl7RvjE2XT6PlXQ3RcuvxrF6o0W5PEHWeG/761V
         4prQ==
X-Gm-Message-State: AOAM532pfhdOQZw2AbWtBNpjO8KkzhjubVJegemcZbAqkYK4dSav2s8h
        4pFPaqnLvr8Mwezf/Bgt64/Rrg==
X-Google-Smtp-Source: ABdhPJz/Fl/ycPt27uPD1jfBCnT7L/KvY41FuL5OomKqLLI6JcbOroETTemTgVbLNByEEPw/1Ty4xQ==
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id sa17-20020a1709076d1100b006dff38bb698mr48232ejc.711.1649079999583;
        Mon, 04 Apr 2022 06:46:39 -0700 (PDT)
Received: from [192.168.0.176] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id ke11-20020a17090798eb00b006e7fbf53398sm697669ejc.129.2022.04.04.06.46.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Apr 2022 06:46:39 -0700 (PDT)
Message-ID: <d470dd28-8084-2cda-10b4-006bb90c552a@linaro.org>
Date:   Mon, 4 Apr 2022 15:46:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-nfc@lists.01.org
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
References: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
 <164907989905.809631.16161802401962719876.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <164907989905.809631.16161802401962719876.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/04/2022 15:45, Krzysztof Kozlowski wrote:
> On Wed, 30 Mar 2022 09:40:14 +0200, Krzysztof Kozlowski wrote:
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>>
>> Hi,
>>
>> I can take both patches via my Samsung SoC tree, if that's ok.
>>
>> Best regards,
>> Krzysztof
>>
>> [...]
> 
> Applied, thanks!

Applied to fixes, as Rob asked for.


Best regards,
Krzysztof
