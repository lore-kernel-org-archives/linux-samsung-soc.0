Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6492C4708C
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  6 Dec 2022 10:11:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235202AbiLFKLr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 6 Dec 2022 05:11:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234492AbiLFKL2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 6 Dec 2022 05:11:28 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6952923BDB
        for <linux-samsung-soc@vger.kernel.org>; Tue,  6 Dec 2022 02:07:21 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id h10so16632353ljk.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 06 Dec 2022 02:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NMekL2LEk3JOOHB+JWji+lnO2nhMD5gf3MzPJiCM1Gg=;
        b=zUSRpnmTc/RFKY0PPPOizXNQWMOmVuMoluFjVWCiV+y0JRoq9PKRKsnPLuWkRfegVy
         lvfZ9F21HyLiXCuIwExrwL8Z5jwN1Dxx6yqN62A5l9sxY851fdyR0uTwUk+aZMr00KNE
         ihmWwGw6PhJVPHsDTKorJinY9wBcTOvku5MmtsXEVIIunRv7pgDWnNZGdNdQENhYaVEj
         nzFhav+U4nd+ot6HgsbLRfOE0P6Lv4rwKdC20iKoRYXHE2RIoB+bRQsSHAXCUicFTJO0
         fR3jtohuRIdMNBSLfJsOzxCe2JOVL4ED/rtPpZfW1+VJEfaQxw4Niv4bP2x/I7KNzAKP
         D0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NMekL2LEk3JOOHB+JWji+lnO2nhMD5gf3MzPJiCM1Gg=;
        b=XGJujRSzklHnkegE98IW0sw3Zi265qbjDpk+2gA19CMjHzRDiejO+C+Q/4P3GkoI4u
         EWEIXQUBCNyYh5vnOzppLJc2glPq7Pt7BO/raMWp5jNOn9DRygtfTV8ilQnMwj6tSZPZ
         LG70uglf3kpHTlVura2I14VNh+DHwn8taxf9K1dbrAJud0WbogXpZQVBxndhylw3r1GF
         vyptChVMcFe29OvZfL2HappJrbUDbFvNZ31cPClIlg7/7oGf1RO00sU1sAI3ZrNAz71V
         4R5f0sdttc4O2MRAH81gDFcTLPFjF6uJhK5X5K2FNddusgW4c9ZPlPDRrW2NQU4PUSN1
         ojXw==
X-Gm-Message-State: ANoB5pkq268FH7M2ntDr2xq3f7yXYdKtKG0gPxMu+8HRht2JY+I7WUkL
        H0NfAHdna28UZIL+Do4G8ovDlw==
X-Google-Smtp-Source: AA0mqf6ypVuG5zWj9XR/Lb4mql4LSQssNDupVw8L/tQ9hJunntmG6nm4nXjDV75baL3SH/xhfVddEA==
X-Received: by 2002:a2e:b0ca:0:b0:279:c096:2e8a with SMTP id g10-20020a2eb0ca000000b00279c0962e8amr9625320ljl.433.1670321239588;
        Tue, 06 Dec 2022 02:07:19 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u18-20020a05651206d200b00498f23c249dsm2414432lff.74.2022.12.06.02.07.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Dec 2022 02:07:19 -0800 (PST)
Message-ID: <853c1bff-f657-8696-e927-5b5278593234@linaro.org>
Date:   Tue, 6 Dec 2022 11:07:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v4 0/2] arm64: dts: Add SYSREG nodes for FSD SoC
To:     Sriranjani P <sriranjani.p@samsung.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, devicetree@vger.kernel.org,
        alim.akhtar@samsung.com, pankaj.dubey@samsung.com,
        ravi.patel@samsung.com, sathya@samsung.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <CGME20221129115540epcas5p370eb47c404a8d2c08ab4f264ae983481@epcas5p3.samsung.com>
 <20221129115531.102932-1-sriranjani.p@samsung.com>
 <01ff01d90950$c7768fd0$5663af70$@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01ff01d90950$c7768fd0$5663af70$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/12/2022 09:57, Sriranjani P wrote:
> Hi all,
> 
> Gentle Reminder to review this patch series.
> 

If you ping me, then:
1. Pinging after a week is a bit too fast. Standard is 2 weeks.
2. It is too late in the cycle for me to pick it up. I will take it
after the merge window. Anything sent after rc5 usually misses upcoming
merge window.

Best regards,
Krzysztof

