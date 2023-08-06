Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD419C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  6 Aug 2023 15:43:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbjHFPnp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 6 Aug 2023 11:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjHFPno (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 6 Aug 2023 11:43:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD961988
        for <linux-samsung-soc@vger.kernel.org>; Sun,  6 Aug 2023 08:43:43 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4fe0d5f719dso6143542e87.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Aug 2023 08:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691336621; x=1691941421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oWs4U2ro/t4/q4Z3II5xjIwWsnCpXNAMYIlFzVA7to=;
        b=d/KHmHcFTscfybAgeJW/vORuTjCnWcizHj3JJbdw2Uzg+gGgoRalYZsn8Hfn4GNyWL
         JFgwztEuuItCn9ikVJ2l1amtITa1Sy1ZcwhLeEcBXdIIZPiJFTpcNq+osxAiSxB6DqQ+
         uYoxDSfhQKF8e2iOEyJSh2eBoiazcHCSO+pwqdit6GG2RWBJ8Vae7zBeo3OTr6k9j3eP
         Kn9hE7BkdJyT3t8Z5x6dKmvRTbWADKq7XYMTlP0uAj+xOWp+PbqLH0B+//p0y/amSrjS
         GtIsZsB8dDb4vxMctISFAf9t5yzODAHBRlU3EiXNy8UXrzxkxJunEdvymlp7Pz2wozHw
         XLgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691336621; x=1691941421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4oWs4U2ro/t4/q4Z3II5xjIwWsnCpXNAMYIlFzVA7to=;
        b=K4QaD337ATVsrk3i57W3b+quHZ1GtI23AgNWtOyg2g+7+1zjCv52XfWhqoeGaodTQu
         rjq6A9jZot8Y+iQn9mkNzAlqal4hEe2HO4HMSRRAkAIvU3V1yen4L2pT+MHg/r2PScwB
         +q0+JIwOR7XMEsCVdJvZqoU+4xMLcbGdWjZvtOfGBN45pKNP/3cUO8sx4fzTehW3o4wr
         +0QDfbStZySdZId3mhn07KHNd0+bc/0HBdNEvvJKcrqoAHkXni6Smxz5lCtkACc11ddw
         t9e9ZJlcRUX+trDzMAbqYCm/M5RJI2luhlmG4szZRUQz6buOePRJro1wDftR67Mq95Vh
         KOgA==
X-Gm-Message-State: AOJu0Yz1NOLhNGFjpTxMv3C+Jq5IKIniphjxM4eeBt2UrkBma0rGl9MN
        GLsZHxaynKP1mJbayN3hmFB2Ew==
X-Google-Smtp-Source: AGHT+IEWCJTsvsSIf8enwv7oo2giSQDBES8kdxqCPcfEumlUYVlBTwRhmSAmKQTz+OOWgMXQu4p+3Q==
X-Received: by 2002:ac2:55af:0:b0:4fe:589a:857d with SMTP id y15-20020ac255af000000b004fe589a857dmr4116275lfg.34.1691336621334;
        Sun, 06 Aug 2023 08:43:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id d14-20020aa7d5ce000000b00522b7c5d53esm4020402eds.54.2023.08.06.08.43.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Aug 2023 08:43:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay
Date:   Sun,  6 Aug 2023 17:43:37 +0200
Message-Id: <169133661267.27382.4777449887249443533.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230731090821.104733-1-krzysztof.kozlowski@linaro.org>
References: <20230731090821.104733-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Mon, 31 Jul 2023 11:08:21 +0200, Krzysztof Kozlowski wrote:
> status=okay is by default.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay
      https://git.kernel.org/krzk/linux/c/d157d43754582f3981b7eefc691abc4d865430e1

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
