Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B27DBC63797
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 15 Jan 2023 15:02:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231253AbjAOPB7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 15 Jan 2023 10:01:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231161AbjAOPB6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 15 Jan 2023 10:01:58 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F3F869B
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jan 2023 07:01:57 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id mp20so16077130ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Sun, 15 Jan 2023 07:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3bq6rsilb+yzIau6JvOZs+9VdaUZxUWRaQK2SaliZM=;
        b=PsQwIqKmv8mUgQAfKRBTar7hkJFBWu8yHkUFdSFiONL0FtNX3oQmt62fwmI1uJMD+J
         +sddKvh15EIZgSODInndERNNqf33Cxj0ivluoXf/++txbGPkWKElLS3YwqdsE9CxR7MN
         CdenhB8vdwxa1nD/TPDp6Ks/nG7rbqocCxvY5xAvtvDTAq/QfjJZ00bC/UXZ87uvwgLK
         5EBa7NXKP7Zyockn+St7pD/YqdEIrRqXeagIwccNWWpN9BdwkiNngvUrNSCBJvy5LmRf
         D/2VGuv18XneRm2cv6sFDRTVuyjhIDREtzOIfVOKy4maK43/FZ8/uQMgI2RpWSJ/nlCS
         i4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3bq6rsilb+yzIau6JvOZs+9VdaUZxUWRaQK2SaliZM=;
        b=gVhPfTv83zp6Vsm5AgRe56ixdk62o21I+tYx9jXncIgRclOJbeZTuH5MzkYQTPbQ2G
         xBNVOadI21qDzPZl2qkNAlaelGJsMk925nAhEmViy5gV2+HCl6ScudrxWCeu8hgMo5TK
         ccbU3T4pkAa+995qY426vgABYZzBTPi3uy3bKyYZ1HWc9HmeXopB1DaicOzGNRpBHQL8
         kxzX3Uqes43taja21an65QKk0T8zJOXsTsfR/DrtjdZ2lG7Uos0jlReWA8rlsXPYIyER
         6aUAibR6TmelJ/6pPuWXI4dKfOHEHLHw75G5eKWsdF3WYi1aECiotnaizUH9l/xluwMU
         iX3A==
X-Gm-Message-State: AFqh2kq6tLeJfNyZGfXfUrMYG/EVi4Lf1Pmd8DtqyfH+johqjoTxMAeg
        HXjHv6BvIy4WRWCZEdsIVGOwyw==
X-Google-Smtp-Source: AMrXdXvutsPygOCMzesZ9qxp8xuN8emB9CtkFkWEFKnljtZ5h28K7Ck5Gtyv2iBBY6sW3n/hl5B9WA==
X-Received: by 2002:a17:906:850c:b0:7c0:f44d:984 with SMTP id i12-20020a170906850c00b007c0f44d0984mr95610347ejx.74.1673794915641;
        Sun, 15 Jan 2023 07:01:55 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b007c14ae38a80sm10633909ejc.122.2023.01.15.07.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 07:01:55 -0800 (PST)
Message-ID: <3c2c4da5-c63b-dd2a-c918-4b8163a52512@linaro.org>
Date:   Sun, 15 Jan 2023 16:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: Add FSD I2S controller bindings
Content-Language: en-US
To:     Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>,
        lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, s.nawrocki@samsung.com,
        perex@perex.cz, tiwai@suse.com, pankaj.dubey@samsung.com,
        alim.akhtar@samsung.com, rcsekar@samsung.com,
        aswani.reddy@samsung.com
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20230113121749.4657-1-p.rajanbabu@samsung.com>
 <CGME20230113121816epcas5p469f952d775cdd709de18ec63b24cedf7@epcas5p4.samsung.com>
 <20230113121749.4657-2-p.rajanbabu@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113121749.4657-2-p.rajanbabu@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2023 13:17, Padmanabhan Rajanbabu wrote:
> Add bindings for FSD CPU DAI driver which supports stereo channel
> audio playback and capture on FSD platform.
> 
> Signed-off-by: Padmanabhan Rajanbabu <p.rajanbabu@samsung.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

