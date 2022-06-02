Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0609FCCA47C
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 11:55:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234556AbiFBLzT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 07:55:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234633AbiFBLzH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 07:55:07 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E4C966CB9
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 04:55:05 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id s12so2267812ejx.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 04:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GnEcVvfjc0afaecD6p4iJbtQNdfaHZzq5qCa8RK3128=;
        b=S2KS9ndGDFQ8VE+mEnfO8aOw1H3EWNLvBDSilL/bsoVvSd0Aq1kKjkdvcSNJDPaAIG
         k/qC4j/d5B0ljCv1YPcqsDS8ECt6YfRKpaIsh/+6DpPKSyyZvcH8nCNvdD+ABnsx96fX
         7QhZWvqpZWIeQXQLDXhcrvzqieGEwvgo3zejM/8VEVmPz9q4EXnMkcb9V7cCOpCyoeAj
         DLU2uk/bhPld6x+Of4gNplWa8qO5kXqh6yUFX5olvd64478+/MtUlxGibNZL7nl4pe8i
         MEA6IjA1EXEUTwjnY+MnAkZFy/TDXx1+Hbwyb5WQ+zMHqpBIiEmecmLTlmsrzfYdMOd4
         N8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GnEcVvfjc0afaecD6p4iJbtQNdfaHZzq5qCa8RK3128=;
        b=myWWVEy1sa/6sDTaRlUza2Uiql+FBdDUtneHM+pIOCeiH2gsNHgpHHYjjTvuXg04UG
         jIQB3Syb6sDBPzG64c45P/hXw1jNjpPNkqAIS+qgPOm1NA36uPRl0SXJ8v8YzjyCxEm2
         jHkw/6e4uEgBPcES8MCaAzrsGILYc81ALYZIwqHY/P62+EeEWCLO2v96Gl6PybgmUHlQ
         9m7OGtkrpaftV9DNhGYEqirYNdI+q4jNUoApxmb143ZHDXZb1Rf0MqiPijaUWXPcnu+V
         lA66z6oYg0h8GgmiyTmNNFGknV0rTOmSnh3Z4IEEr4pKsgz80Hx/8gdKkziqoad1r2VB
         iYRg==
X-Gm-Message-State: AOAM530tESEO5RqYqnKyi73u3Q0P2aYX34QpvpfdUI0S8oCiy6mQbfa1
        BAZb1+1fXWga5zv7MGop8CxU8w==
X-Google-Smtp-Source: ABdhPJxBSdxlMHh81mVbkn7ocV1JCNCVrLUYKh2+2dY6cdFay4NrJefErbjDxgvrCpcSaKDnIEmDMQ==
X-Received: by 2002:a17:907:9709:b0:6fd:c0e1:c86b with SMTP id jg9-20020a170907970900b006fdc0e1c86bmr3843634ejc.600.1654170904554;
        Thu, 02 Jun 2022 04:55:04 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o9-20020a170906600900b006fec8e5b8a9sm1666825ejj.152.2022.06.02.04.55.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 04:55:03 -0700 (PDT)
Message-ID: <9c747a07-c6bb-da02-67d7-7decbdcb0090@linaro.org>
Date:   Thu, 2 Jun 2022 13:55:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/5] dt-bindings: clock: Add indices for Exynos7885 TREX
 clocks
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>
Cc:     phone-devel@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20220601233743.56317-1-virag.david003@gmail.com>
 <20220601233743.56317-3-virag.david003@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220601233743.56317-3-virag.david003@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 01:37, David Virag wrote:
> TREX D Core and P core clocks seem to be related to the BTS (Bus Traffic
> Shaper) inside the Exynos7885 SoC, and are needed for the SoC to
> function correctly.
> 
> Add indices for these clocks.
> 

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
