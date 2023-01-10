Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B347C54EBE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 10 Jan 2023 19:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjAJTis (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 10 Jan 2023 14:38:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbjAJTiX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 10 Jan 2023 14:38:23 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12E85BA32
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 11:38:14 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id m3so9590146wmq.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 10 Jan 2023 11:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eGDhxuNjiAxiZ7fsWZIBfqbUjy1+OKYg09NQ2t+65mA=;
        b=LMg8CmtfWfe8Y9I6CGh5ZeRy5OlI6jPlE6i+w+BE3Zo0DOoklPHxkKVtILrZnxR2Sy
         Kmp2KRdqCGvCFtak4b4DXBOgH4OizSHtQ338flLLYaUIQ0/y9N/5IFAlcgwGnkmR3iee
         dKfFJzCXoa6n/N1pNkh3V4HRsUqL9Q7qc+qRH0y+5FeOHrTdRF9OpELK1iVlQ8oZROm+
         rTwX3oAQjtbele1bd11biI0B8VIvOkr/cT1MEBkemJgfku0DJseebexfB1YQqcY+enDZ
         yiywcsgoVOkYQjJ+RZAWHtV3gOmLp8EKOoqX/QsZK9b4xE9nreBaQzHGv7m2jtozXa6e
         Zbhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGDhxuNjiAxiZ7fsWZIBfqbUjy1+OKYg09NQ2t+65mA=;
        b=1sNlHml1PZFxMKVTJoSyskIMeqnYxdAchRsHudfgqy0YAnK4Nv1xG9i2NIbuD9IZAT
         5DIvBDYnA8lwblZE4STZyntU7q44woaii0pzdixTrNRAc37YjpIKvV2tu2JoH8x+C41B
         89h0GW05dyMPrW6Uxpz0gD4OZynidv+P3Dxb9jGqT4IT1TXwrDGONyL1tyoeYcZogiSO
         NZktW/jz39eAj2bCOFe39Pm3hvux3CcqcOK8Fex7lzRJ/M96M6aQHZC9BskgEcq9hwWb
         BxX5gVxEs/L6qjIWd6xwKGZDGfbruz2JNG0x3mHdQvOi4ofLcMqTcrFnFEpLy1i52BDu
         HN7A==
X-Gm-Message-State: AFqh2krDq0rdTWDlF7qbpp4jAR3Rm/m4Ot2CPhdU7bPtq1dKiefdCZ6P
        HySzk/W/HGWLxElYJbmx294p4A==
X-Google-Smtp-Source: AMrXdXsQ8RMu5nCq/z3RWX49T85kJl7kDS1NdrPdjzIxxghwrbVuytN5J9NMfQOIxGz4R8Y/8GAOhQ==
X-Received: by 2002:a05:600c:3552:b0:3d9:f801:bb6 with SMTP id i18-20020a05600c355200b003d9f8010bb6mr3114168wmq.10.1673379493435;
        Tue, 10 Jan 2023 11:38:13 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q6-20020a05600c46c600b003cfd4e6400csm17253043wmo.19.2023.01.10.11.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 11:38:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sriranjani P <sriranjani.p@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-sysreg: correct indentation for deprecated
Date:   Tue, 10 Jan 2023 20:37:59 +0100
Message-Id: <167337945583.1430972.706879196207710844.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109083948.77462-1-krzysztof.kozlowski@linaro.org>
References: <20230109083948.77462-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 9 Jan 2023 09:39:48 +0100, Krzysztof Kozlowski wrote:
> "deprecated" keyword was indentend wrong - entire list of compatibles
> starting with generic Exynos SoC compatible is deprecated.
> 
> 

Applied, thanks!

[1/1] dt-bindings: soc: samsung: exynos-sysreg: correct indentation for deprecated
      https://git.kernel.org/krzk/linux/c/c14f161c1feda6f654978025fb64efd7280c3223

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
