Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D45DAC32793
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 23 Aug 2022 07:26:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240950AbiHWH0o (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 23 Aug 2022 03:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240937AbiHWH0d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 23 Aug 2022 03:26:33 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 889F562AAD
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:26:24 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id l23so1648959lji.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Aug 2022 00:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=BiwaO+tJ6D9uFFRuqrFJ6Lk+1eZHbSFwYlokO8SI9kY=;
        b=YD8vBeQEgbua10OlF5G7F7MHSy5oYfrAV/X3+6j11WcGONzNMADqmn/n2onWuanIy6
         U02noFuouG/A0/KelIXPUOJESqawCX9/EE07hno/z3a2GELw/INFZFBRwNJS4AaOz5T9
         1NPvqkL0PxaweziqFGP00M7xjrJITjLDpP/XaG9o0GWsQvjeXqNJqXunLAj2Wk3OzZX7
         foFfbhSUMobOqwJ32QqawF7mSzy42KIjBP8CDdcJmzZ0y8qsJVfsBE9T945tir/LTbBT
         gAt6F258wGRySck2Ow9oZ9ScGw/XnFDz15fRNYs9ffbvOmN+BXdRV+mOkob26biy26iD
         QkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=BiwaO+tJ6D9uFFRuqrFJ6Lk+1eZHbSFwYlokO8SI9kY=;
        b=cym+lkl2WzFNc2l1Kz7QJisPlVxL3LeWUfNliVjB61seg03d2ErGlFju5SvJ9P+2oC
         ecngEZnzdZhRxkzxs0T0RY2bAAheDMJ5LLnhsKPbgsvnDOlpk/xsQeJ5lFp2guMjLuet
         g2ssFYqmhW/dbx+FiunjzB2eKYFMvEF6ZmP5idiNG8hK+gmDZSTTkuBMHXhePIhaQEXl
         y1hKFWfrXphbFMASV3pFjKZonYLWnvw1ZWMnOW0wXtz+2HX4iORiWfoszAyCoPARP0T3
         M+c2rvaPl6HR33ReLVgIcuXPKPqotvJabTMO2eUNXRUdvme1jpK5uNIAPT/lbs83fI0E
         5aPQ==
X-Gm-Message-State: ACgBeo1Y5yAdmMmjkaWU18Ps0ziAIjh4d2WryP3EY+eBxn97wtIzTyRN
        MboJ5BzMLzqkHWW2mfWbCbIQXg==
X-Google-Smtp-Source: AA6agR54KJxfGU8ZHsWZgTp1U/cK9UNGx+bhRs55yUskY6DvKcheUuSilY9tKPgpyRuXBtqjH8IX+g==
X-Received: by 2002:a05:651c:2227:b0:25e:cc38:a1e6 with SMTP id y39-20020a05651c222700b0025ecc38a1e6mr7088816ljq.84.1661239582903;
        Tue, 23 Aug 2022 00:26:22 -0700 (PDT)
Received: from krzk-bin.. (89-27-92-210.bb.dnainternet.fi. [89.27.92.210])
        by smtp.gmail.com with ESMTPSA id i24-20020a196d18000000b0047f8e9826a1sm2357410lfc.31.2022.08.23.00.26.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Aug 2022 00:26:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>, chanho61.park@samsung.com,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH v2 0/3] fixes for exynosautov9 clock
Date:   Tue, 23 Aug 2022 10:26:15 +0300
Message-Id: <166123956379.357728.7509148041951328796.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220727021357.152421-1-chanho61.park@samsung.com>
References: <CGME20220727021823epcas2p2d924128dab9d449c2c6794d16aac617c@epcas2p2.samsung.com> <20220727021357.152421-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 27 Jul 2022 11:13:54 +0900, Chanho Park wrote:
> There are some fixes for exynosautov9 such as clock id numbering,
> missing clocks and register offsets.
> 
> RESEND PATCH v2 with:
> - Add Krzysztof's R-B tags for #2
> - Add Chanwoo's A-B tags for all patches
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: clock: exynosautov9: correct clock numbering of peric0/c1
      https://git.kernel.org/krzk/linux/c/b6740089b740b842d5e6ff55b4b2c3bf5961c69a
[2/3] clk: samsung: exynosautov9: add missing gate clks for peric0/c1
      https://git.kernel.org/krzk/linux/c/6ac24a3a24a9e88f5e1ee8e96fd9d39fcab28b3f
[3/3] clk: samsung: exynosautov9: correct register offsets of peric0/c1
      https://git.kernel.org/krzk/linux/c/67d98943408bce835185688cb75ebbb45b91e572

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
