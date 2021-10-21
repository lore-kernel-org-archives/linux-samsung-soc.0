Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97329C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:47:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74AF36108E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 09:47:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231651AbhJUJtt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 05:49:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231587AbhJUJtp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 05:49:45 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 13F6BC061753
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:47:30 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id d198-20020a1c1dcf000000b00322f53b9b89so206458wmd.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 02:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6vVJRSnblUbQ2imtnLEeh9ljQMRmUi3sR1VGF1u+LtI=;
        b=K4xdbgjr7ue/GdFsbMYMA1VKnd5a9tUbyPR29vrKp/vGg31zkH9j1VG4YybEMjIWVf
         77UB38gO4iFC8/Nm2jX8QryhiBtp4+V1HoO6Gi+Bql5Kq5P5U5cTj2yncXY/OXpPRJoY
         xSynuB4UoSB5/NZ+A61JrdLB33Fg4N3obeCphqKfM9YYMy6ebPgV+I2Fm/uhUpa4FkT2
         p/tVgRhOhnsrDpdLUPbdBx3vt8drkW3CEaNv7frQRTPCT5yBEO73zM50vqf6CM7isqNn
         2OTCbS7Mf6OxA0xLQQScFzjVNANUOjy6pKNwUO+CFTZXXvygpwjFYmG/iy8DdYWsryWr
         WGUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6vVJRSnblUbQ2imtnLEeh9ljQMRmUi3sR1VGF1u+LtI=;
        b=XGWBSIfO9eDgheUszS2bS0NbgXHMIRcmUD59vjIeMBKmWY1mLGPNKErqbTxTlVhFBx
         Ug8+L07D05zwCupt4UsoK36MZpSP6GSuZgRvqFyRKa90ER7mbFPa4A3hglhVtGbnSa34
         ZnpMGz2/TGhzGoCxnY7hQLWOkcgpKemaYGJVyyfhIveLNC1Mr2BZhuLQkwu6tlugtljT
         V/+x+DPIuW9bUt9XXgbMh5YToOUQ9euFNCgJ2TDJ4nsUcPs+gy8AKgNmmSsLa956D22i
         tuYQUrKc5QxVeFBHTPgh1Jf6bgvBEQ0V4q2tj98Db7vXznyJTAA2gzi6NDINr1tk9hpD
         h8xg==
X-Gm-Message-State: AOAM530h4Gunmwf48bTGakUHYxZn7wynWODMraqkbcvIILjj0ew3Hc9B
        xX8/szr8tPJ+0uRcAXn7H60ynA==
X-Google-Smtp-Source: ABdhPJyds3mHcQ/inxySrJcprz27XOv+rBknkfwGDU233VKcd9uYCYgRXyvDTnGjfyCiqlxzY/QdAw==
X-Received: by 2002:a7b:c249:: with SMTP id b9mr5343544wmj.194.1634809648648;
        Thu, 21 Oct 2021 02:47:28 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id c17sm4521103wrq.4.2021.10.21.02.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 02:47:28 -0700 (PDT)
Date:   Thu, 21 Oct 2021 10:47:26 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v4 08/10] dt-bindings: mfd: samsung,s2mpa01: convert to
 dtschema
Message-ID: <YXE3Ls5Cgk3vC+19@google.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
 <20211008113931.134847-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211008113931.134847-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 08 Oct 2021, Krzysztof Kozlowski wrote:

> Convert the MFD part of Samsung S2MPA01 PMIC to DT schema format.
> Previously the bindings were mostly in mfd/samsung,sec-core.txt.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../bindings/mfd/samsung,s2mpa01.yaml         | 91 +++++++++++++++++++
>  1 file changed, 91 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
