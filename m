Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8F55C54EED
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 23 Jan 2023 15:37:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232715AbjAWPhU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 23 Jan 2023 10:37:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232713AbjAWPhU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 23 Jan 2023 10:37:20 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295E41A976
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:37:19 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id c10-20020a05600c0a4a00b003db0636ff84so8890283wmq.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jan 2023 07:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=t5PriCepxNWbx3CJFkfx8mWLYrTlYai55ZReEXgm7VuFu0YZ60muJdfQe0CJ5i5HK1
         HfdV0S0tsNdQUI78o87AzuEtjxRHznyXDAJV5RhXQyeLus2P6zIComcp4nUv4yJuC58V
         D7Ag06WtJBYy9kgp/eQMOSXERUFi3680TE83B5bWgFS1sVL5A/NRo7E7vWpObV8Pce0g
         LPsydiuN+8uxRJNY6Cba0afWzlDerSQZrT4GOdKQixe+Stejugr3QdnJHrGPMPOY1RmT
         kDUHxGs65AeI9PHGgAJ1JrqOd41VU+Vht3l9gYX8FQvn0K1A++/S6LJUBDl98YhNhd6i
         228Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5cq6ayhJIiujuCk7dC1Dlzy/ufBwMT4etpRQGBEg7fw=;
        b=Qv9CBRoQGdgw+eoTgmYUPlcrTJeLluvnpC5s9KiO3KnSZRFzBJ/4YkK3FAyJwiJnoc
         /KNE0PmoallLkGjczQx86beCx31sSTLctjoApRElc1m0zcvsb9iEhUjP6cts8az7Cao0
         7kRQOsVQT3H8iAtfhfC9X4vXKBpMkbqAiQNUXa+Qjxl27dOK9rneRHZalfdpJYcB3JvA
         mcFwZHlawSYhng2ZIu3pA5EWvOZjhwOXYBE0Fg9e1O+1pHmx5SGmkLbSu8ZY4rFF/Ndp
         PRjTf5iqAR7EWlQjMH+U9Fn/58YAAo1j/YR+FfhFKaQMEKil5F7ee8Tl2OFinwYmkB/u
         fOJw==
X-Gm-Message-State: AFqh2kol/9HUT/ORV5RIETop+/vmUyclSxJNX6E4o/UN+w8dKGmVbi8V
        KlsVX+/zlCpUdEUPdKuKNdchjg==
X-Google-Smtp-Source: AMrXdXtcZWKJ5j0oRc5YZzjtqWQUSggkx82WJfQ2d9BqVHEZ6eTWX69Z3Ae8Af4FxfHtaoxFpVIblw==
X-Received: by 2002:a05:600c:4d91:b0:3da:fb96:53d with SMTP id v17-20020a05600c4d9100b003dafb96053dmr23424328wmp.4.1674488237771;
        Mon, 23 Jan 2023 07:37:17 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l7-20020a7bc447000000b003dafa04ecc4sm10808395wmi.6.2023.01.23.07.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 07:37:17 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-kernel@vger.kernel.org,
        Markuss Broks <markuss.broks@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Mark Brown <broonie@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Correct inaccuracies in Exynos5420 and Exynos5800 device trees
Date:   Mon, 23 Jan 2023 16:37:11 +0100
Message-Id: <167448788767.376527.17795531099793665794.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230121201844.46872-1-markuss.broks@gmail.com>
References: <20230121201844.46872-1-markuss.broks@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 21 Jan 2023 22:18:41 +0200, Markuss Broks wrote:
> Use the proper compatibles for the DSI host controller and MIPI
> video phy, as the current ones are not compatible with the hardware.
> 
> While this fixes the kernel panic while trying to use DSI, I was still
> unsuccessful to consistently produce image that isn't noise on S6E3FA2
> panel of Samsung Galaxy S5. It seems to only work sometimes.
> 
> [...]

Applied, thanks!

[1/2] arm: dts: exynos5420: Use Exynos5420 compatible for the MIPI video phy
      https://git.kernel.org/krzk/linux/c/bf5de14225625627a35d1acb6739068fc126326f
[2/2] arm: dts: exynos5800: Use Exynos5422 compatible for the DSI controller
      https://git.kernel.org/krzk/linux/c/234b8dac096d74e330ed1266956c756efddf3676

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
