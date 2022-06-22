Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 221B2C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 22 Jun 2022 11:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243391AbiFVL64 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Jun 2022 07:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357990AbiFVL6z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Jun 2022 07:58:55 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CFFA3CA50
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jun 2022 04:58:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id eq6so16216230edb.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Jun 2022 04:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2m/Xok7VP5vHqSQB1NxN4Vt4Oche30w655bnlAJC9ns=;
        b=GHj0W9jx/ls0eud50fyPFj6LSbk9xeABMP0XG/KqiwAkuV1zXBi85xCOJwcysQ54IC
         hgVbVw+0Ial+A6tk/15Gj+M61dGgLbRNKpkYFVa1AXZfszysHl4aa+NzSpRfAfqANTbU
         A77LUCvVkk8OwPldSbAA3azvVrmdHjp6BavhuIik6GgjwG3i3XNfN/dQr9AuDga5RkH5
         Jop/SUTK9HDU8zs3czTlEBOQLHiIndndal/I6dvZfS8yGT1v8Apy79du/CINJw0PVwV2
         zGz+HHsWlCVR4XsX/D5Vhj69K8PGvbi4qypfs0vM2IucE3OjvuzijKu9SpmzB2t5VBI5
         9nTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2m/Xok7VP5vHqSQB1NxN4Vt4Oche30w655bnlAJC9ns=;
        b=k1ByFvK0zPAGUpiWihqyTU/RlPwkKUO9H1Mqt+LWLSAq7CTaIVw6wjnltfid5D1l3S
         wR2BY8/iqVtxtop1DB5iUlVHHrJJQNSpCbAkqvLXqM3vcj1SuyPDXhnsW3oDfZb1VTyr
         xIXEhOji9hOIeD7cmB6ASkKLyIG+HpFygcp2un5lhYkd768pPxUO42bhYdlwvb5eA7aw
         oc6Gxan5y9QaWgJM9uLyMWvDulsdK8C7eMFFRrW/Q05EJxWjRlaLEB8vlOmLG5X9Urxb
         kAMyQDrth0nsRrRF+iWYMw531Rby6tkxzgv7Le2OUHiBIOH/wqEOB38bZbDwAnwUwS+6
         Ls1g==
X-Gm-Message-State: AJIora9npD2JbQMPecOw8V6/sKznEzir3eyNEVbWZmUpc4C/YcqKC/ow
        52jAr8w6CSTzuswoYeBTsSeQ2Q==
X-Google-Smtp-Source: AGRyM1vwg5dlvt0/0txOycj1ppClDiPg4czGwjacnZTFwy9IM8e66vJ8VQc767my9WOGMHUqz5QHhA==
X-Received: by 2002:a05:6402:452:b0:434:a373:f9f8 with SMTP id p18-20020a056402045200b00434a373f9f8mr3713602edw.290.1655899132816;
        Wed, 22 Jun 2022 04:58:52 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id qw21-20020a1709066a1500b0070c4abe4706sm1746212ejc.158.2022.06.22.04.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 04:58:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
        krzysztof.kozlowski@linaro.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, robh+dt@kernel.org,
        linux-arm-kernel@lists.infradead.org, alim.akhtar@samsung.com
Subject: Re: [PATCH v2 0/8] ARM: dts: iextend leds on Exynos boards
Date:   Wed, 22 Jun 2022 13:58:48 +0200
Message-Id: <165589912783.8422.4884246748120605140.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
References: <20220620175716.132143-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 20 Jun 2022 19:57:08 +0200, Krzysztof Kozlowski wrote:
> Changes since v1
> ================
> 1. Drop the label from several places, per discussions with Jacek on other
> patchset.
> 
> Best regards,
> Krzysztof
> 
> [...]

Applied, thanks!

[1/8] ARM: dts: exynos: add function to LED node in Origen 4210
      https://git.kernel.org/krzk/linux/c/f64bbfca314663886575b6fde16a5ba9afcda0fb
[2/8] ARM: dts: exynos: add function to LED nodes in Tiny4412
      https://git.kernel.org/krzk/linux/c/ff4275fa0737f2312880d6fb0a4f582a73342465
[3/8] ARM: dts: exynos: add function and color to LED nodes in Itop Elite
      https://git.kernel.org/krzk/linux/c/a149eb5f1b118afe27a5b08d71c0abd2572be0a0
[4/8] ARM: dts: exynos: add function and color to LED node in Odroid U3
      https://git.kernel.org/krzk/linux/c/3e8368fdcee3c9072a41946f4a92517b5bfacb03
[5/8] ARM: dts: exynos: add function and color to LED nodes in Odroid X/X2
      https://git.kernel.org/krzk/linux/c/bcad13fca717a56cddb334eb131edba92c6b5494
[6/8] ARM: dts: exynos: add function and color to LED node in Odroid HC1
      https://git.kernel.org/krzk/linux/c/f0945faa4a1a23d288ca8b92abab10d5145f33a1
[7/8] ARM: dts: exynos: add function and color to LED node in Odroid XU4
      https://git.kernel.org/krzk/linux/c/99f6b77f74c88ac1bc4c81e089dd0cbbf882aea6
[8/8] ARM: dts: exynos: add function and color to LED nodes in Odroid XU/XU3
      https://git.kernel.org/krzk/linux/c/82cd16902a51773cfc0ee05bbd1ab470db5181ab

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
