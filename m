Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC70C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Jul 2022 09:38:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiGZJiw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Jul 2022 05:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232374AbiGZJiv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Jul 2022 05:38:51 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC9B2ED56
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 02:38:50 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id e11so15898158ljl.4
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jul 2022 02:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=b7SGVHqiC/LcahRBPxdV17ZFzaLmXUFWlgur8fnyoGo=;
        b=q915kwWdbZzCloULxq/tsjnCD/7pg57Zty4r65ryzBiaWqV8ik4GGDE+PaNwQ/7MRm
         Ybf44uo6mT0+uQHZ2p3mzQf+CtLq61MZrzvMBo7+eZq/v7+vXp02cmWJGhZ28xlWCcdg
         qkqFFHwvH96SZ57z6MlUa9HBKhUKSSXsnQZCGe4PkncPi5qBzA7gd9vmfMZksjuTPMte
         ILWfp7zA8jDHCFZADTgsGomo6nZ2IUiWs1iFz5ntKzuvtu+6KYTrKF67IFb46Ttm5M6M
         b6F8l2YvrMo3LKU9xRXY8ieL+6LKD9GScnHMOjuRIFvS4KcEEPM3kTm/mzdDqLUQIeoy
         HUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=b7SGVHqiC/LcahRBPxdV17ZFzaLmXUFWlgur8fnyoGo=;
        b=lbiE2TLqzEcSSweXamrnnnr8Ix3jQApx9WTNU9Lu4VFMw/OasW90RX3TdSBFXDEdq9
         9vHe6vrKd9mWEfkxzZ7HsRSWpDV4vYG1S8dDevG2G9L2rx+I5CiljXzrKTcbKZSg9z2L
         PtqoUkZIZol5H8uIbq1ffQeue8mygdECFLO1DEZ5B1aRsEZq4LCc+K+96CZFg5LD3bOF
         LN7i/T0Gprlry7HBz/ztIuNWCoNpP0/XszAaU6IAnYFTaujMVOw/EbxE4f5pqqcieXfe
         BNTow5lmLbQKw4v2BjAo+NMeQU6fbuW48h3msYJ/AwslNthua6bS4UvRof5oC3MtYsmE
         BzsA==
X-Gm-Message-State: AJIora+ENxPLoDTt2/onwItZ4DNXiW4fxjgr/QTxn4U7K5U9wwdpDxZg
        TG4nJjOZMon4EmfdbaoEf9tQx9jbj71BAQFS
X-Google-Smtp-Source: AGRyM1t4iQXe6FBUVHUA2aJr7A8KhCIdqS2zEyHfHgaZfoGUtQsQBZBXwbcJpkFu81tPcyYul63zdg==
X-Received: by 2002:a2e:6a11:0:b0:25e:599:e394 with SMTP id f17-20020a2e6a11000000b0025e0599e394mr3437320ljc.131.1658828329110;
        Tue, 26 Jul 2022 02:38:49 -0700 (PDT)
Received: from [192.168.3.197] (78-26-46-173.network.trollfjord.no. [78.26.46.173])
        by smtp.gmail.com with ESMTPSA id i20-20020a196d14000000b0048a8d1b127dsm1075575lfc.283.2022.07.26.02.38.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 02:38:48 -0700 (PDT)
Message-ID: <a0e3d65f-6ab9-cd70-13d2-0f686e31ff04@linaro.org>
Date:   Tue, 26 Jul 2022 11:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 11/13] ARM: s3c: mark most board files as unused
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org
References: <20220721141722.2414719-1-arnd@kernel.org>
 <20220721141722.2414719-12-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220721141722.2414719-12-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/07/2022 16:17, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The s3c24xx platform is already scheduled for removal in early 2023,
> with s3c64xx meeting the same fate a year later.
> 
> Most of the s3c64xx board files appear to be unused, as the better
> maintained ones already got converted to DT. The main exception is
> the Wolfson Cragganmore board, which remains in use as the reference
> design for Wolfson/Cirrus devices. As the other boards get removed,
> this one stays around along with the DT based machines.
> 
> The s3c6400_defconfig file now disables the unused boards, while the
> s3c24xx defconfig files all turn on CONFIG_UNUSED_BOARD_FILES to
> remain usable.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
