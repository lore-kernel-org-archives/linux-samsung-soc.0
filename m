Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5529EC7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 17:04:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234429AbjEHREk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 13:04:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234371AbjEHRE1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 13:04:27 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E46026A53
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 10:04:25 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso864738066b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 10:04:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683565464; x=1686157464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Azq7BTbCzWMhIuUB9Y3axAkLlNLga1qcngxokDgUFg=;
        b=jUzZN9XekwyKk7X5mfaXoB2EomeDWEaOyHV6+eLW2CNwSQ3wVpzHNY2Rsf0t9tpM02
         QhlktMqdiR7GVvwROtOAj/T2s6tNHUSNltDXfBBYQcRGr71qpfptukL9TMQf3TkOylPG
         bJ3/mtZaSsgRyG9lckE4sP41XsbsQz66WfN2rQnVHvS/Typ3D6Cnu3nYbIPm1fDtDg+H
         IEN/ZQlKuAkeldK/Rdse1O2dx4qdC9s1R+HMoe1fbml5Ojmb2fhXXh15XgLT6AFyLUb5
         M5cATtIBBISRJTfz0jOwdE/h0Lwc6bf+uMeF43yJ1H/KmzYJU51jUXYXkzD48iSTM7ya
         1s6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565464; x=1686157464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Azq7BTbCzWMhIuUB9Y3axAkLlNLga1qcngxokDgUFg=;
        b=jakxuRf0FK4B6tOQiVi90grUxkIi/UmXqowHWZzBQgf0dfWa5sitp/JEBLZYto5V/Z
         P0HYI6tOWe0xZY5VD5bcwOjICLe6KOMlm7hIl42q/SZg2Y6/lSIlOqxjLlAhOopW6oop
         NX3S+EhjvoMnIPbjCJ67TYvA8GpFdHW1TnI6VSj5Tt/TQVtwMRuuytCabpMhACcevGYc
         0LxJYX87IADvEyB4zYzczYFES0fFfo8XCPZYYEcsvwRKl9/E2eYfmHhZr1AG1Tc/DDxl
         JBjDNA/74Q55CMabMfnyDXWsj8flr93q4u1Toib/Nm+3/oLEr1qslNP9OiMSd1tNy4d2
         rCSQ==
X-Gm-Message-State: AC+VfDzzipx+kWax5JbxwCneUcw3lcpbgfjb+TWGrM4SjyaHaCS9HNSu
        PjYimcHy+rhKEjkr4lSXhxG3UQ==
X-Google-Smtp-Source: ACHHUZ5HokAFGepEoHFVp0yqrFst+OcgQKSYk4tu/BFsbVJiAfG7+Z7SPpuMHlJjwkMUbvWwrp2yQg==
X-Received: by 2002:a17:907:3e05:b0:94e:988d:acc5 with SMTP id hp5-20020a1709073e0500b0094e988dacc5mr9994946ejc.46.1683565464499;
        Mon, 08 May 2023 10:04:24 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00965b7bf6aa5sm206862ejb.52.2023.05.08.10.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:04:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH 3/7] ARM: dts: exynos: Remove empty camera pinctrl configuration in Odroid X/U3
Date:   Mon,  8 May 2023 19:04:16 +0200
Message-Id: <168356544396.281925.13794945904153112539.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-3-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org> <20230207210020.677007-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Tue, 07 Feb 2023 22:00:16 +0100, Krzysztof Kozlowski wrote:
> The camera's pinctrl configuration is simply empty and not effective.
> Remove it to fix dtbs_check warning:
> 
>   arch/arm/boot/dts/exynos4412-odroidx.dt.yaml: camera: pinctrl-0: True is not of type 'array'
> 
> 

Applied, thanks!

[3/7] ARM: dts: exynos: Remove empty camera pinctrl configuration in Odroid X/U3
      https://git.kernel.org/krzk/linux/c/043dc30113758f6b18194227447979e100d3061f

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
