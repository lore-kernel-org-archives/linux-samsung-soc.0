Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E7E6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 12:27:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241457AbiFTM1W (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 08:27:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242640AbiFTM1R (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 08:27:17 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0CC17E29
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:27:16 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id eq6so7559479edb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 05:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4vB4Q89ficeECRN8+UPrIdmEHUS7f2caO3K21kMQabs=;
        b=ydtsStDn284MzKmsq0MtNzu0S+TJnJsI3r17pEGtXoiUzkcbpPXsCNluThCnu7PSUl
         AokfhGThZRANaroZaKbYjDh4B8Jrq3cJ9XBZNwM8aaeQa39YFuehjHzmtxGm1SMSc67n
         dSX7az3laG0qrWn4H2agszHD8W6QilpaALdEqV00uOl4c2ZL/I2kVjdfUlvoTAsKYeZp
         33yl2Tqw0tss5MG5f71gWHaH18jZk+SST1JWNF1JtqiFZ8HI4Rn8rA1RHX94cSPjcRwr
         JoCX2BpOfQ1m1dzcrV8U3E0D4XMA4W+VhHQ25fiY6PPY2pTHfJHODpOBctJy9mbetK20
         ytRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4vB4Q89ficeECRN8+UPrIdmEHUS7f2caO3K21kMQabs=;
        b=qCprcL6krVcRswVULseFS6ADLCmy+kxhunlnDMxzr6XP0tqTDdqGqzlwLRUiQhughl
         FY/He/5GkdmUhC/Ym5gn8tDbqKqEqOFezMYuDFF0W59sBZOR91uzSX7IK9wFwZ5W8WQV
         WlffOd765mTV64Nu/eZ/ZE0RN3z/zsrqtMXwUXJp1eKVoET1pdQJNJOz3Zoq/lI3yz4l
         GlDgHfen5v3UU9J1yC12VBkkoiINGYmzElWNsy0u4cZk39ncuJptr7XzW7e+FsEfUZcq
         2PDSbSJ9G6HKnAGpnVCeDj1iYtZdxMwPO0McKNm1XdvQ0j0LN+ryX+OtJ53xBLAQXbIF
         SlDg==
X-Gm-Message-State: AJIora+KKcEYJ9r8T4/azpYThfXX2WiUiD5LxdnMUHxMJWH2k+0FBv48
        EnHwzMOED/NLVj9u1H4EdUzApSqAE4doQw==
X-Google-Smtp-Source: AGRyM1uMp3iw93ubXPa99A12M8kv6df8xBOlVMniOSKM29Q1ujY0faKLtebfWYFbuG+EwepyqbUXkQ==
X-Received: by 2002:a05:6402:2804:b0:431:7dde:6fb5 with SMTP id h4-20020a056402280400b004317dde6fb5mr29550142ede.379.1655728034292;
        Mon, 20 Jun 2022 05:27:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id 4-20020a170906300400b00722dcb4629bsm15987ejz.14.2022.06.20.05.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 05:27:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 5/5] arm64: dts: exynos: Add internal eMMC support to jackpotlte
Date:   Mon, 20 Jun 2022 14:27:09 +0200
Message-Id: <165572802724.43913.16422699466513017279.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220601233743.56317-6-virag.david003@gmail.com>
References: <20220601233743.56317-1-virag.david003@gmail.com> <20220601233743.56317-6-virag.david003@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 2 Jun 2022 01:37:43 +0200, David Virag wrote:
> Add the nodes relevant to provide clocks for Exynos7885 eMMC and to
> support eMMC. eMMC is the internal storage used in the Samsung Galaxy A8
> (2018) (jackpotlte), and all other known devices using the Exynos7885
> SoC.
> 
> 

Applied, thanks!

[5/5] arm64: dts: exynos: Add internal eMMC support to jackpotlte
      https://git.kernel.org/krzk/linux/c/ced37411d7f597129fecc0c3ca2324f44e33f4c8

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
