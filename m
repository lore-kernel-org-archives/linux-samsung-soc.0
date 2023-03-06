Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D03B6C6FD1A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 11:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjCFLjT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 06:39:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230181AbjCFLjS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 06:39:18 -0500
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D418D10D9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 03:39:16 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id o12so37148076edb.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 03:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678102755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Azv3qOIDSN05R8VHm1Ql58xd4w4JXBO4sj4yqG9o8CE=;
        b=VrZHHNkx3aCXSPeBIiiLNZ192hhHTr0EX/uNtCUDfpTC9VR2bED7KhWmhZ+yPLi0jl
         Q8GQ3f4Iu3RfllT5gqHEShh0K9/9hCYTYxbHUQps2QGis4Wl/LQzzdp2+OuC/D6tjP2y
         S3qpy8t5SHVkUrxCHURSUfpc0CmyUJwv2ooPaGNGc93c6Qky6sdpFNf5GR+DMOmOoL+Q
         57A2T96FJQ052/U64d797m1NMGnMWijKfRnuVoG5ygIF2YAlzo28Ig/R9h7uzYlTsQKG
         s9e1P1yU7pD69sA7DKeGvXqVTVuF9dWzCcmern8ERuJa9jFqd3lxcDmZyjnO7JA/VzqF
         qgtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678102755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Azv3qOIDSN05R8VHm1Ql58xd4w4JXBO4sj4yqG9o8CE=;
        b=AIvR8mkCrGBZXuI0bK/CE8WyQg+ORzscjsH1EOX4Oh5SOfX72WhmiKD/y1zKvyiiNE
         ZMDbXru/WMPVH8PRQ0Z2DjaZVCVwqmU01lYpo9PrJJMjR9xwNHCjVRkuaH0pmsQ2Nbk+
         gSvjtQLmJOW8yIy2LFIuAiJX3RXomz0JQC2PTy79q7nOp76zWtSHnniXi3wejJghN9bn
         aK/qI7mPKjviMt6UAguCGaMGZX2/ycqRRa9HVvMtLhRVdw/3MEpL+UzBV6FPU56YxqLj
         uWobHWUNEe98v93ZeVFeJkGBO96jJcyc0G0BW4H5loKZ6Q1HaVdA4bbyhivaNmjqBbyS
         uZzQ==
X-Gm-Message-State: AO0yUKX73jmgdG6QRYJV8CZe/kAUh0SZrtZjhZYMqkSuzmiIyO6rinXC
        7JYOvZxg4xrXcIrMxGY3VpfoMb1Bb1A2PBgdCaQ=
X-Google-Smtp-Source: AK7set/cOiPi/iANfWLzS0Zcu7y+SQCp7WrKRWZcRKxhG+dIQmkKYLtMY+nmvAIYTMvAupcnMNZvQQ==
X-Received: by 2002:a17:906:d9c8:b0:8e1:cc38:6ab0 with SMTP id qk8-20020a170906d9c800b008e1cc386ab0mr9312257ejb.16.1678102755191;
        Mon, 06 Mar 2023 03:39:15 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:d85d:5a4b:9830:fcfe])
        by smtp.gmail.com with ESMTPSA id ch10-20020a170906c2ca00b008cf8c6f5c43sm4411936ejb.83.2023.03.06.03.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 03:39:14 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] ARM: dts: exynos: align STMPE ADC node name with bindings in P4 Note
Date:   Mon,  6 Mar 2023 12:39:04 +0100
Message-Id: <167810274093.82312.7401325487979471571.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225164050.42522-1-krzysztof.kozlowski@linaro.org>
References: <20230225164050.42522-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 25 Feb 2023 17:40:49 +0100, Krzysztof Kozlowski wrote:
> The node name should be generic thus rename STMPE ADC child to "adc".
> Bindings will expect such name as well.
> 
> 

Applied, thanks!

[1/2] ARM: dts: exynos: align STMPE ADC node name with bindings in P4 Note
      https://git.kernel.org/krzk/linux/c/9aa8727b3b15c4d941353c784f61f49e33513b3e
[2/2] ARM: dts: exynos: drop fake align STMPE properties in P4 Note
      https://git.kernel.org/krzk/linux/c/74cbc0e6b2051a604c9bec8c825d83832def0462

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
