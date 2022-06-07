Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1576CC43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  7 Jun 2022 06:32:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236999AbiFGGcu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 7 Jun 2022 02:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237001AbiFGGcs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 7 Jun 2022 02:32:48 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8408227CD2
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 23:32:47 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 25so21336364edw.8
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 23:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=jdLvKxR1Z6t2c0hErw3/qchn3RYb6tyzzSPggFOMX2I=;
        b=t82zzV+jvai9G2AknGaxPwASMP1QZ0N0isBE83qyXKWwykwcmJo9aEx/Q6hiMH1iTP
         9gCea/EeG4sVdvQOCfIsSaoFeVLIfo+WYMrRKhONdNjNxIh5Ndhlcrgc/glI7fz21KnE
         LDOHxNblAq4ArPPbHgT+RNKT+AQCoNtBgv88saHTS4YPYt4PEb8tml43HIWCF9wO93Ll
         wG4GUA21zoe/zcHctKs6nhW0BIv7hnJHQsH+uH5mybHla40BpVOt2SznjGyXn9LVj+8t
         qbWTZDhHHCs1rp2dWf09mM6nYbB8uMcBIEKSmt8PYJw3xmQoDR4X0/3LbTriN4lMpWsQ
         mOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jdLvKxR1Z6t2c0hErw3/qchn3RYb6tyzzSPggFOMX2I=;
        b=6+MlTdTTi0kuVKFaQcV6FI1EuSdQr5U5PpioFrG3L5mjqj11eupQ2HqdgfCw6KL3Qe
         ic8jk31RZQZQvahAwLPwZIw9M/DezF/03wCiWQ4aKpwszrYHFb2hZ9zMewubO1OS86Br
         b9j+uAOck274HbEo8PePaW/CV2Y0KNhooypQasqUgeTrI1rhIkc1bJGgHxvjh7J2zXad
         gMOAmC2tL4zixoQ7MzDOczkkPpUqHzV6lyBUzROYJCCaEGMLIj5hrna5k9V1wUOaUg90
         IsgqFd2mZFc9OZ1yli8WQw3MVG5ukhBxnu1T7Q65pjdEQA52IADlEMLhGMe9iI3nnzLt
         zHbA==
X-Gm-Message-State: AOAM532x8d13URATNLEzpdVJ0vWxZ2iH0OkcjI9eO5lTW59bMi4HvL5x
        vvxeBXFGIgCRrEOB1St6PD0l5Qs/kRTr8A==
X-Google-Smtp-Source: ABdhPJwe3Habr/xYh2komg4xDDgNgQVn6qt25dw+usJac2OhwSPJ2zYyN3IUkCpg9bEII8U6RZz/lw==
X-Received: by 2002:a05:6402:1e88:b0:42f:b1ff:7858 with SMTP id f8-20020a0564021e8800b0042fb1ff7858mr20912601edf.407.1654583565664;
        Mon, 06 Jun 2022 23:32:45 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id eg13-20020a056402288d00b0042dce73168csm9796349edb.13.2022.06.06.23.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 23:32:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos: adjust whitespace around '='
Date:   Tue,  7 Jun 2022 08:32:39 +0200
Message-Id: <165458355452.6489.13343990795732516629.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204323.832243-1-krzysztof.kozlowski@linaro.org>
References: <20220526204323.832243-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 26 May 2022 22:43:22 +0200, Krzysztof Kozlowski wrote:
> Fix whitespace coding style: use single space instead of tabs or
> multiple spaces around '=' sign in property assignment.  No functional
> changes (same DTB).
> 
> 

Applied, thanks!

[1/2] arm64: dts: exynos: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/6f8c75ad5a1550257d60883eef6d5e97f6268022
[2/2] ARM: dts: exynos: adjust whitespace around '='
      https://git.kernel.org/krzk/linux/c/3b0a91e586dc92da738af9eb35352d5897b8b279

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
