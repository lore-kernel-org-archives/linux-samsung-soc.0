Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DAFFC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Apr 2022 21:27:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350040AbiDDV1m (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Apr 2022 17:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379374AbiDDRDz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Apr 2022 13:03:55 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BBC840A23
        for <linux-samsung-soc@vger.kernel.org>; Mon,  4 Apr 2022 10:01:59 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x20so4021995edi.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Apr 2022 10:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3H9g58AlHBPTQrDhIy8bA3VbPYT/p5tUvM0gVBca9kM=;
        b=CXS8DhcR4gnY7ZaqZuAj1sRKqwIDzdlFemejqYrMwifHuO/DJTGr9skQ0OhQKwolVi
         IYrbjUrpVFcVTsO/+gwVZbxc3wACQKWMoCliP41cFoxCpTyuRPQ9V2JfrzKUD9xeEBnZ
         9ASHxQXWKVlokRBzUmroiyaGsZag5M8n4ib220T1KlbMVz2BX+KKvoGboHlN3/zWm7xS
         RRrCl5YASsx3E8x2+RqCUyUrEcs/Wp8j0Us5ffs+jvy8yJtPKJouPI8qUYP1OLb1Ir2M
         2GKIAK/R9pTvioW4AJlqijBJj3rb2PUpoli4SgdyI//tldS270UpzzTd33mO50O+7MwV
         gnKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3H9g58AlHBPTQrDhIy8bA3VbPYT/p5tUvM0gVBca9kM=;
        b=aHBjb+JdqiQCxvoijZMUCRshCANTYQLUmdz/6AroauLA9G5G8vQAHe1+z27e5o0nlr
         vf3o8lysJxDHkAnq2Gd9rk0r4UORI4MYTSpruR7EaHkpoW4GyJF6g5v0IcXxh3LItt2r
         pjS1Ie70qtw96pDQrkHpm6dBCaF644RgD780gwTKjyJX0V8NBR79gZg7tHSpHsMWQJfP
         v0iAe+RJhC2F0/u6hf2CBNbyhsoaGC9WfzU9UVUrFC7aiCIjXGJqsCYguf4Fnq3tAiXN
         YEzkBO6kEMWp7kzUWcUXKVBgd0E7QuVB/ba95hcjfSFvZcOIVpI93wX4pago3eHJ5IE4
         7aXA==
X-Gm-Message-State: AOAM531ZBI9tZygTKTl+losUBKEr5L4PLsOKAoNEunLw38ymN1Ygj9Rw
        +fDkX/U0Ngtz21scbLJiBKAhgg==
X-Google-Smtp-Source: ABdhPJwVtuji7QDmg3IAIKiltBHSnjyfm8HAaRf/K80CqRcwNqpO4nk2Qz2pabYVosG1AvuUJmDFCw==
X-Received: by 2002:a50:d0d5:0:b0:41c:be47:b959 with SMTP id g21-20020a50d0d5000000b0041cbe47b959mr1079093edf.337.1649091714542;
        Mon, 04 Apr 2022 10:01:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id c5-20020a170906d18500b006ce371f09d4sm4557770ejz.57.2022.04.04.10.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Apr 2022 10:01:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 2/3] ARM: dts: exynos: add a specific compatible to MCT
Date:   Mon,  4 Apr 2022 19:01:44 +0200
Message-Id: <164909169270.1688455.18335841373677729835.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225153650.289923-2-krzysztof.kozlowski@canonical.com>
References: <20220225153650.289923-1-krzysztof.kozlowski@canonical.com> <20220225153650.289923-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 25 Feb 2022 16:36:49 +0100, Krzysztof Kozlowski wrote:
> One compatible is used for the Multi-Core Timer on most of the Samsung
> Exynos SoCs, which is correct but not specific enough.  These MCT blocks
> have different number of interrupts, so add a second specific
> compatible to Exynos3250 and all Exynos5 SoCs.
> 
> 

Applied, thanks!

[2/3] ARM: dts: exynos: add a specific compatible to MCT
      commit: cca50a59f60a6b2b5aa2c90d8c173da89f567ee3

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
