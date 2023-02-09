Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CB80C05027
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 11:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjBILKx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 06:10:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229991AbjBILKu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 06:10:50 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26DD512867
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 03:10:49 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id bg5-20020a05600c3c8500b003e00c739ce4so1210400wmb.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 03:10:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WgvDq8izpGDGgZG/G1lE/XLQlEGXPYj1Wz0Qt9tGmU=;
        b=MhWHyPJGIXaSxsbjFgj67SzyssBvo4G9mgh272nqIhgw5vv4LCVzdz/+R6wX6mm8aN
         mAg1mUQFFb13A9wWYtBvQ+Gx/d1aGII/0dkxnmLymp6khXt3vYp1yrGMoe2F1T9g52IX
         P7j9ETg07RVQR6+qge3XVXwXJ3skIKMoDGco0+Xzo+SL9JmBNY3UfTTBmDf8VDJWiGmB
         ew/qS3F0oT/enovL1w0ibv3S0sxW/DjJgy2HpyfbCBFNrwqb+PcZxZcg12c5s3VCjvWx
         g2DQqFC+bKcNhrK6taU6JPsvaitVRTuCVOKppe+WuPxKyTNDyjVPwTKPuJOrY1mx9dgP
         0mGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WgvDq8izpGDGgZG/G1lE/XLQlEGXPYj1Wz0Qt9tGmU=;
        b=Gapr9rvc0HQLRdnyxmtsX12GpqcN9XwILpGLQXgoO4VHeNJkUNkfKKaOT7gbet6IJS
         fWkY/a1OqcgOw9ciWeIteldP2pAqr5ZTj+SQaEoOoY8FJaP6t9hjV3dMNjKgEF9GX1yg
         qQyuDuBzk0PO2m8kB2H73uby1NlVrMO22kE499TLPwtsXzzxxmL/vy1LiV0vCJg3ZEhr
         TQp4yqqgUBIPLmj3sgaf0D8Mk5kYw98l1mIL7Olf+LE05euqFOMZTN+VN0omOJkze4s9
         +ku3KBEfGcwzLkSjnMpcBQtJdofbTiARsGDjdm9W8FaG4OHxxCpecwu444qapNgYss5a
         MW5g==
X-Gm-Message-State: AO0yUKUEHkPlUtQXS1A/ps8F1C/eT5EB03LKC9re5bXmpQgla7ZPIUzs
        Bj5DyBUQEiH8BUEt3aUmPauYZA==
X-Google-Smtp-Source: AK7set8Gruv2WGMHN1T/zyEgxfFJbCMFrlNv7kLGkXH1/1Te/R6LXe8qHMwGjLyKvEy7wagU+c8nHw==
X-Received: by 2002:a05:600c:44d5:b0:3df:30c9:4865 with SMTP id f21-20020a05600c44d500b003df30c94865mr9411756wmo.26.1675941047805;
        Thu, 09 Feb 2023 03:10:47 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q13-20020adff94d000000b002be099f78c0sm963207wrr.69.2023.02.09.03.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Feb 2023 03:10:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 5/7] ARM: dts: exynos: drop default status from I2C10 on Arndale
Date:   Thu,  9 Feb 2023 12:10:39 +0100
Message-Id: <167594102110.781687.18442933896252736402.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207210020.677007-5-krzysztof.kozlowski@linaro.org>
References: <20230207210020.677007-1-krzysztof.kozlowski@linaro.org> <20230207210020.677007-5-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 7 Feb 2023 22:00:18 +0100, Krzysztof Kozlowski wrote:
> status=okay is by default for new nodes.
> 
> 

Applied, thanks!

[5/7] ARM: dts: exynos: drop default status from I2C10 on Arndale
      https://git.kernel.org/krzk/linux/c/4804e14912bd48db57f1aec0d41f6f92fe80c870

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
