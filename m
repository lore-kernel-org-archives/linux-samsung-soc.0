Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A557C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  7 Mar 2022 09:12:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233567AbiCGJNA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236275AbiCGJM4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 7 Mar 2022 04:12:56 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 962EB38DBA
        for <linux-samsung-soc@vger.kernel.org>; Mon,  7 Mar 2022 01:12:02 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id u1so22065025wrg.11
        for <linux-samsung-soc@vger.kernel.org>; Mon, 07 Mar 2022 01:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6nVQFiWLxX1TFkzQGCpmdU7DCjFYMMMsRXcMCUihpJQ=;
        b=RwPN7E2qDXqU4CzUcuvLz1UcIrhv+iL260pmNykUHIYZsL+n72fpJkrZTbjpVRKMWS
         s+y7S8yDmxif2I7mH75hENaIbwGMDQDXVpSLPLePnXXvUmOli4toaoe0qCqRMCAt3KK6
         GRu9dcT2G2G7cogXFkAjM89p3QmAcjCM/HahuLmhYDLt//iS72E+vaYw/34jXmGkf4ED
         3iCW3Bc1N26LqPF6cbt33N+VHYVUfN/PAoNkH8T5+or4LAFsiC7TNU+BpMWmbpJIOs89
         ylc/ndr9lJpB1onhifhRzVYkHeMIAAEEGvAGJqaG8PJtsNXMcvnlr+RhW9mn5MivZTys
         JnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6nVQFiWLxX1TFkzQGCpmdU7DCjFYMMMsRXcMCUihpJQ=;
        b=5sQhGnUNvmv4ulcDIQIqxqWyKN9Ye4Y0soXWsPgwY/jBi5voUmQ0mwfmW1RJas6+6N
         5QnqjW2eOOblDO+jUL/rViKisPmODcyHYvQqFeGeBoh0kKOE7lvEGSmik84ZiorqM6bG
         Z8ppe77YZIwUrm+/0DyULFHLqVaSJZ0Ikiv9ct4GAa6P4s9qEnt0+jvZZr+sWHIJA4jN
         vCUkaACUt/CHTnYQnRCCGoP5ZAZ7iw6OweHQ1uA2kA5oZ1VlU87B35lqD1lowOlXZxEc
         Zby/m2noB1yi8vYsST0RY1SD6vku6m+bBeey3KBlzGsXG04kNiY214RtpQ2eeHlPRqel
         Ifsw==
X-Gm-Message-State: AOAM532/6vpc5UTeazY1WjL3eRgIv0sQ5TOLfm1sGPnda9brYizwarHt
        VpXT72BM/miTr28Tnn7duV4lSQ==
X-Google-Smtp-Source: ABdhPJxdHVdBVHWE807kbNZBe4/KG9JPWJM4iXynkHybCQVDdoYHAaXxjE8gw/FCXxFLllrW6eX6Wg==
X-Received: by 2002:adf:cd02:0:b0:1f0:767d:b39a with SMTP id w2-20020adfcd02000000b001f0767db39amr7352428wrm.529.1646644321172;
        Mon, 07 Mar 2022 01:12:01 -0800 (PST)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id y4-20020adff144000000b001f022290737sm10582510wro.6.2022.03.07.01.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 01:12:00 -0800 (PST)
Date:   Mon, 7 Mar 2022 09:11:58 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/5] regulator: dt-bindings: maxim,max77843: add
 MAX77843 bindings
Message-ID: <YiXMXtnqHsTCRRcQ@google.com>
References: <20220111174805.223732-1-krzysztof.kozlowski@canonical.com>
 <20220111174805.223732-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111174805.223732-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022, Krzysztof Kozlowski wrote:

> Document the bindings for MAX77843 regulator driver.  The bindings are
> almost identical to MAX77693 bindings, except the actual names of
> regulators.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/maxim,max77843.yaml    | 65 +++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77843.yaml

Applied, thanks.

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
