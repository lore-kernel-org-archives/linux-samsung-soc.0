Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11479C76196
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Mar 2023 07:19:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjC1HTG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Mar 2023 03:19:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbjC1HTF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Mar 2023 03:19:05 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97137272A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 00:19:04 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id i5so45866362eda.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Mar 2023 00:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679987943;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2YyLtcWfck99XSuqte56OpC8fUbT/DMhZm1MlJJ7vA8=;
        b=z1sqXxQK/OtJ1ZoqcpRiUEqtysmThq/PWJo1jm3zyBVh6LaVkSGBoxN8ooZDIBhrRi
         AITIizoPzmojNxjJAffW6kihGC0PGvdhqWbx2MwKQ6xCm5aB5V3VavxKn6aHF5MgmO82
         mmMBH9Sd1ZL46KOA6eb5bj9VQRcH8eTNpI0K/isyA5zlWFkeB4/ll/K69oFb1YXm6ary
         Kv3/1K2WGEetv3zLP1p+ylZcOp0kT+oeNCf/ki8TG1Zj+qJo69PtyeQMBx95h2IJpDir
         Z5r4DObtH2ILFJJ0A6MxX1BswYzhkDdJbjVnE2lZe6oVWxFbeOrbooUC0DejK7kosH+Z
         polg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679987943;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2YyLtcWfck99XSuqte56OpC8fUbT/DMhZm1MlJJ7vA8=;
        b=hyHj2oz2iAouTxJl0uctyHYh6mfGJKQGLYevwcT6Vn/9o6e9VB7gkTu6X9TjA0V7S/
         nNtLCbJpFTwdnzQ1o9KtfTLVKJh/cUTFeVl+yUZVLdWzLigPBU2ffOZk5tyLO0evBXyX
         V9O3IkbmL2+i+X5pg93XK9IhIoIn7Xj3SVO5UcEb7iFwYG05BLDusfkeD3sOhgiPgDw2
         RqGY/7pIwUMA0SvyZazxmIYy4VUE5KqTuxGkNvQnJ6v4WtYn700CAJjxgOBMFp0DHvAL
         luARYcz/GPX+rDZRO2OcujzM2JTcmNdO4HSkc+JZc9M61ubsLMywYZpduHuBpy3Pg7i1
         +FQw==
X-Gm-Message-State: AAQBX9ecGhYxo4eRvmhdgf8Y/N2zjVuhIDCbKpQsf8wswj4gy1OSMuLp
        deQHa3EDxKBMSag8txxNzOOlVBTgmvkQXADrPYs=
X-Google-Smtp-Source: AKy350bneuuGtkW4SO7vxT4eJZc8NFZcpqqqi3sMZmlLvaa3a9JEy+Nj0eljodAD/Qx+zXHyGfM3gg==
X-Received: by 2002:a17:906:8288:b0:933:44ef:851e with SMTP id h8-20020a170906828800b0093344ef851emr16333902ejx.55.1679987943119;
        Tue, 28 Mar 2023 00:19:03 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9e92:dca6:241d:71b6? ([2a02:810d:15c0:828:9e92:dca6:241d:71b6])
        by smtp.gmail.com with ESMTPSA id zc14-20020a170906988e00b00927f6c799e6sm15053068ejb.132.2023.03.28.00.19.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Mar 2023 00:19:02 -0700 (PDT)
Message-ID: <8779217b-bd70-37a4-c779-139690048d4d@linaro.org>
Date:   Tue, 28 Mar 2023 09:19:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next] devfreq: exynos-ppmu: Use
 devm_platform_get_and_ioremap_resource()
Content-Language: en-US
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     kyungmin.park@samsung.com, myungjoo.ham@samsung.com,
        cw00.choi@samsung.com, alim.akhtar@samsung.com,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230328053853.23159-1-yang.lee@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328053853.23159-1-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/03/2023 07:38, Yang Li wrote:
> According to commit 890cc39a8799 ("drivers: provide
> devm_platform_get_and_ioremap_resource()"), convert

I don't understand why do you reference this commit. There is no bug
introduced there, there is nothing related to this driver.

> platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.


Best regards,
Krzysztof

