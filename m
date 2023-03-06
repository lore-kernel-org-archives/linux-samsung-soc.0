Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5FDAC6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Mar 2023 14:49:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjCFOtj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:49:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbjCFOti (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Mar 2023 09:49:38 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF3B72ED69
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Mar 2023 06:49:15 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id da10so39699044edb.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Mar 2023 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678114154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nh6XKFz+T6WxhqqPVlLeQRxcOS/87/Io/Bax+zCSLTs=;
        b=vDgjHqLuhZeBrv2nf3j5BRaFdwPn1c1/hZ38yzI8sspL8Et9YWL8M1KFYyvfu1VX1z
         /X+pteStVbdgmLP1GrUqV2Jn+jYrT1+MWyTC4MQ4Rqf/c+BSpuTDr3WzdgXGMEx3oCq8
         n+P8RIlOpgak/BnhSV9IKmqPdUqUH0J8C6vDAulHvNKxoN9N/u4tBUBLwjLtaYXG+DNe
         XpJS/IFA4xqf/5/NTXe6xBX5ergZtu/72vPNMCOTceqRuseaMoWODfdSgm2VRi7Cz55Q
         1EOMi82eWfY9qjMhPXZ/k4mb3Uy5dkdaTgCGdHcwbfNIFbJB8Mh4Xuyc53O3hzpTmOkv
         uOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678114154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nh6XKFz+T6WxhqqPVlLeQRxcOS/87/Io/Bax+zCSLTs=;
        b=ky+AOsFuMziukuO97j+iUlk2BzqfZak9y+j0XBMQaIs6I6LkTrtEEyUGbM1Y3AMj7v
         J800FaJx6yuR9D4FP9QO5JWPGrJELbumMwSWVHRBzuglylxoye9bhR1/1rOXUP3LcMS/
         N8HehWmdQiHh/9TgMOPdk8/UJQ9AtQPH6UIOO3X/haOZmKYBPruOl+x3o/+oWBZqGrvh
         NabH4YQpkVf2MeUVk9LSYQ+rfdlzV+AdjhIes+XScZ1X8lpze2H8qlf6+m770t+dmV0h
         bKawN3AB21qUW+aPiwAAxp9/858CnLcVL8BwRvDypJTXQgHnMoy1p3BipP9nEY8EGYeM
         /+3A==
X-Gm-Message-State: AO0yUKXQp+brAG8TLzyUDanRIKJo0a1bRYnIACgIdYBgK6F/AWc6JPI2
        85uNNDcq7DG8H0hSB2b7Eism2A==
X-Google-Smtp-Source: AK7set89acS5FAn/13g3IEOQgIv3zAF1UVIKPzKnLTl+AGGpNn17Ns7cLvofX2V+yDagk4jalWY6cw==
X-Received: by 2002:a17:907:2ce1:b0:8b1:32dd:3af with SMTP id hz1-20020a1709072ce100b008b132dd03afmr16097875ejc.28.1678114154047;
        Mon, 06 Mar 2023 06:49:14 -0800 (PST)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id j22-20020a1709066dd600b008e6bd130b14sm4706760ejt.64.2023.03.06.06.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 06:49:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        linux-clk@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 2/6] clk: samsung: Remove np argument from samsung_clk_init()
Date:   Mon,  6 Mar 2023 15:49:08 +0100
Message-Id: <167811414390.14916.3902557610865008921.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230223041938.22732-3-semen.protsenko@linaro.org>
References: <20230223041938.22732-1-semen.protsenko@linaro.org> <20230223041938.22732-3-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 22 Feb 2023 22:19:34 -0600, Sam Protsenko wrote:
> The code using `np' argument was removed from samsung_clk_init(). Remove
> that leftover parameter as well.
> 
> No functional change.
> 
> 

Applied, thanks!

[2/6] clk: samsung: Remove np argument from samsung_clk_init()
      https://git.kernel.org/krzk/linux/c/9753e4c7b552f009c10be5a22c65509cb61de893

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
