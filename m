Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79FCCFA3741
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 24 Oct 2022 13:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234174AbiJXNmK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 24 Oct 2022 09:42:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236449AbiJXNkL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 24 Oct 2022 09:40:11 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C581CB1DF3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:36:59 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id a66so4604155vkc.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 24 Oct 2022 05:36:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/bSMV1G3NHftbbiOMlkZDGHMaXgJ5YWpzbaRA4vltk=;
        b=i4/IMfcBcqGglzqf/SOvPdhvpU7og45mEipaleqJvV0IxkNgUXpeN/5TqBeDm27w+B
         IQj2IgB/C6j4DCe1/0GlHqq10k8PL5xAGcJIWtEDJ+4DhQb0DpIUOnTArvyeyTG3btf2
         acgOXuAqVzKQ4nSgiYnWsg6RdIJA076s29z+kMFvxN/D9pNE9ifkIJtiX7Nfo+mPIGd3
         KS6lmrFs1I57KeLB4unHBQIPM0rrdTFTWNcnNPqnMJPMRbVZe/EMzCCGeTrEm2sHlibk
         JYibkdFzHQ598Ngik1IJ6MFW6sc5fncG6eeHbHIedrJmnqC9gM3ieMmr3EdmSBJsPFHF
         ozvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/bSMV1G3NHftbbiOMlkZDGHMaXgJ5YWpzbaRA4vltk=;
        b=WDOgCi6FQDdv/9Fy+BQ5LT0JiYxSFhve6cjZORJtO1XOG1mdqSLEl8GmFP7PHpVOnL
         UEjptggE4Co/kPPnY1Jozb439NIJR/W0UFcSdCgT4Jgf71AVMlWYblAosDjyp7EMXg0L
         JPPKfBszXwg5kPJpU1i5tNNCNGVrjnjPS+ZAfF3Svn0QPZpkqY1zD61fNcr729k+7fAh
         9JlQwmcaX54j7tVd47Ol+sRXAYq+eXmEjM6F2b9mlayPSV4srR0/0KidCJ/1Gbv1lYJV
         0cCHCk4Q2/l/QzUTQoq/3pBc2nIK+esNX8PJmOHkER7BLekXGSU3HJqG4RsAMlDKuCHR
         jZQA==
X-Gm-Message-State: ACrzQf2cuahOaD1bo1GJc3I14UkmSro0qmyARlnB/N+WGMfO3/pOT0Hm
        JAz0kxS+V0m9/4G4eEVhwWoqpaQVSNpw5Q==
X-Google-Smtp-Source: AMsMyM7Vpky++x5MIrkJgLvsDPhgytK0mR3B44Tn1o/0g0QQxp6rwdOkC063mLEkuVJ38OVb52Zveg==
X-Received: by 2002:a0c:dd13:0:b0:4bb:664c:5aaa with SMTP id u19-20020a0cdd13000000b004bb664c5aaamr6607970qvk.121.1666614397292;
        Mon, 24 Oct 2022 05:26:37 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id k11-20020a05620a0b8b00b006cf3592cc20sm14672531qkh.55.2022.10.24.05.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Oct 2022 05:26:36 -0700 (PDT)
Message-ID: <774a317d-959c-a40d-5855-d5094ee55c70@linaro.org>
Date:   Mon, 24 Oct 2022 08:26:34 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH 03/21] ARM: s3c: remove most s3c64xx board support
Content-Language: en-US
To:     Arnd Bergmann <arnd@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     linux-kernel@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>,
        Simtec Linux Team <linux@simtec.co.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Kwangwoo Lee <kwangwoo.lee@gmail.com>,
        Peter Korsgaard <jacmet@sunsite.dk>,
        Darius Augulis <augulis.darius@gmail.com>,
        Maurus Cuelenaere <mcuelenaere@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Juerg Haefliger <juerg.haefliger@canonical.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        linux-samsung-soc@vger.kernel.org
References: <20221021202254.4142411-1-arnd@kernel.org>
 <20221021203329.4143397-3-arnd@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021203329.4143397-3-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 21/10/2022 16:27, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> All traditional board files except for MACH_WLF_CRAGG_6410 were
> marked as unused, so remove them now.
> 
> Cc: Kwangwoo Lee <kwangwoo.lee@gmail.com>
> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> Cc: Darius Augulis <augulis.darius@gmail.com>
> Cc: Maurus Cuelenaere <mcuelenaere@gmail.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

