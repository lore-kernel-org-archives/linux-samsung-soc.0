Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A6EC25B4E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 07:26:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjATH0A (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 02:26:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjATHZ7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 02:25:59 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91CEA10A89
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:25:57 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id b5so4064454wrn.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Jan 2023 23:25:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h9i+Qv4HbQL4wTmwii3nOO+NZ/copcGQilvpnum3F3M=;
        b=IR/FIY8pS3+kqyyg3eNASM67BT3+BwXFJTsQkQPWbb7nGAHU3nXxnGYWKViEP1b4zs
         zUPrAO+XB3ZN8yOLqYNyUTQV0s2/5IXvm1aYbJO7RnowcPumYRKRDNvsmQQqZ+l6vx/2
         /yGaRhF6Vj5BYYtWCrWsEzFr3JPxqaq6e/zBS2tKSZfk2EQAAt9XuKdmIUDzZXcS8Z1e
         Rh3dJrKlv1sAilKaVuq1efC3vRz7f5LZs8dLPQo0TM55K0cG9luxluk131P+cW2mgHoL
         RgtPf5ooZ2nzbPEUmw3nYWJWGB5FvyJCEGoR4Son5jtuhI2ndLSy5b2hrMogk5nvH4LM
         p8FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9i+Qv4HbQL4wTmwii3nOO+NZ/copcGQilvpnum3F3M=;
        b=gF8/IHmqCVfDPNnh9MV3xf2/jglaxvth4e9QMSS2bu5FxJbE+Zv+WN5D/6TA8wjg4s
         8u5z4svghEhoMl7xHsg0HCaoEzmYlS5MBvKg6+lbCIko88rvHuEFsU0qUpmhJ9fvM1m9
         +WHwpy4Gk4E1kd42lqYgrznuy8BXuzulx/XwfHILmPklfBcngEbau5xImk4yF6f8MGZs
         SoWjDrsvxyp3+xYerWew1wzenZiPxalHpsHDuTBnp2mgWRYGSLWGhXe6k2kAd/ZYBnnK
         tXm4AD9iDbYxhdZ6qpLKg4WpABJMk8Yq9xgk/gAGfF1aXXfgU+T7A+/HLdnY2BjToRBL
         JYjA==
X-Gm-Message-State: AFqh2kqdyiAg7HI8g+N2hmv0mBTu86UAP4n10OYT8ycIdI+hjpCjiyPR
        LMiLXfpU9/dXI7Hb820fzv7aLGQwp4RBKgPo
X-Google-Smtp-Source: AMrXdXu1tnJAiVhajJfg57xXl5eiuSAI60G4qJ3fw0fpK5VpqvH2qkRBe+F2spmEiznl0QygzEWwZA==
X-Received: by 2002:a5d:6b4d:0:b0:2bb:f88b:43b6 with SMTP id x13-20020a5d6b4d000000b002bbf88b43b6mr11897926wrw.3.1674199556125;
        Thu, 19 Jan 2023 23:25:56 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600001d100b00241d21d4652sm34958634wrx.21.2023.01.19.23.25.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 23:25:55 -0800 (PST)
Message-ID: <53361cab-0b41-0613-2fa9-64044cbc4e2e@linaro.org>
Date:   Fri, 20 Jan 2023 08:25:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 1/2] Documentation: devicetree: bindings: Add compatible
 for Samsung Galaxy S5 (Exynos)
Content-Language: en-US
To:     Markuss Broks <markuss.broks@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        soc@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
References: <20230119185848.156502-1-markuss.broks@gmail.com>
 <20230119185848.156502-2-markuss.broks@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119185848.156502-2-markuss.broks@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/01/2023 19:58, Markuss Broks wrote:
> Add the compatible for k3g in the Samsung Exynos5800 boards section.
> 

Use subject prefixes matching the subsystem (which you can get for
example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
your patch is touching).

Best regards,
Krzysztof

