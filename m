Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80845C46467
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Dec 2022 15:17:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231801AbiLZPRY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Dec 2022 10:17:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbiLZPRW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Dec 2022 10:17:22 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE89F2DD3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:20 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id z7so5779272ljq.12
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Dec 2022 07:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NE9vhGolKZh4qk6h13gH/hif2BGc/nXGsk3gcrABu0s=;
        b=Snp+V/1JNPEJWCzyjiW0XERLLTqxUhNzRMR7zbzie3Y5TIPw/Tlz0FXyAozn4yu5RH
         /BC42f+bsjZ6gT4yXvHJ9YcfBFs43KgD8CRFZGunLDgpu0uT/oaPbfXKEtVdBzEpaLN3
         LrB2mlQX93L30I/tRaEBUVSiuWsyqnniotLc0NnkH+oWRwL72gPS66O4yxi2iav/w+Zd
         LjK6XdUBdn0Fx49TxCfq3MuhO5puSLKvUDDL2sFHdUnODG60EjXtVdJSQ8CMlpQ6q1J6
         VQTiSZ2XhHGCx9sWGVweBdfgWVt8y9AMzfMDk+tp0h+wKdCZxInhaR7UmPWOTDcGg+A2
         vfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NE9vhGolKZh4qk6h13gH/hif2BGc/nXGsk3gcrABu0s=;
        b=fWuNhQNIXq5vF62dn2mv40Fh1d9+8dP0kiKlvcdB94Sd8h+2Ojb1cvEEpqEA9Qdm5u
         xqcgRNF3AYcI8gG/b6zW2YWydqwToXXCNoTsYoPMjUe8192qlh4K7nKXjiGPbW8kYss8
         nL+PTJe94/CrlXaejPH1PMN+m6DQBvFz3upv42F5K3ey1aAMoDfOSvmL9H8thPM26hGW
         xRdivvEX3RhaQch7Xyjule1AJI0LxocalgbTdltgYmN587D0eEmnl2xZix+ogw6zrmSm
         HX0JsO1o1wHiCZetgRyyRpMkjtlL0gHMhYk0RB6VqDUoGi5gkE8C+v14aJq9VC63cfd/
         RSoA==
X-Gm-Message-State: AFqh2kp2D1gNWHoXLQ8JHREU8G325a46kpEju2G5qrPQYgCRP2L7lDmU
        iXj/DUeaZSlUlmCwIjcW8PD06A==
X-Google-Smtp-Source: AMrXdXuLyt4i7NA9WzbUQrj7oRqYpVf8cgATRPCrU4EG9oywAaIM6lbk0rHTzoFGKzlVMlYlclyIDw==
X-Received: by 2002:a2e:3c11:0:b0:27f:c557:697a with SMTP id j17-20020a2e3c11000000b0027fc557697amr377016lja.53.1672067839073;
        Mon, 26 Dec 2022 07:17:19 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id k2-20020ac24562000000b004b4ea0f4e7fsm1821286lfm.299.2022.12.26.07.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 07:17:18 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos: use 8-bit for SPI IR LED duty-cycle in TM2
Date:   Mon, 26 Dec 2022 16:17:12 +0100
Message-Id: <167206781676.20416.5753749208705846208.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204104242.117558-1-krzysztof.kozlowski@linaro.org>
References: <20221204104242.117558-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 4 Dec 2022 11:42:42 +0100, Krzysztof Kozlowski wrote:
> The 'duty-cycle' of SPI IR LED property is u8:
> 
>   exynos/exynos5433-tm2e.dtb: irled@0: duty-cycle:0: [0, 0, 0, 60] is too long
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: use 8-bit for SPI IR LED duty-cycle in TM2
      https://git.kernel.org/krzk/linux/c/254b8f4b219211e1e2fb6c91edd96aa583c78720

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
