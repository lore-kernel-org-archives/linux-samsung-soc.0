Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4BC3C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 08:30:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346335AbiEDIe0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 04:34:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346284AbiEDIeW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:22 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04E72251B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:46 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g20so869771edw.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/IQuJLPOCQi188hnGZN/JFweKm0Co9fpiQn8r5RZ13Y=;
        b=ZLVCd3wpTWOdv4ORi/nB2/g9QfyeP9vVgaHGBnfWW/n/K2MLCeh/fepZNQnBO6a+m8
         UVlAYkXvzCjhOAtIulhWc8w371vbLJztnipq9RwAt4ecAecp2CtTAn6hf9EzFFsYizjX
         PVjPt8pzO92mdV+BKPX744F0oN7i9bbxksbh5Jln/d6rlfiZw0beh2ysJaOkXm10V6ID
         4nQSgw1yUcSbi67KNxZZ2bYX9IGmRBVBYMKmF9P8PRmFEWgH9Z68zJIx00vNXII0m0Wn
         Ofx7Re823JqiEV+vanbMQOm/T9y8xVaHf5TARAkRQr6XPDsqBIPw6fIIvcnrkPzK7kFq
         7flg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/IQuJLPOCQi188hnGZN/JFweKm0Co9fpiQn8r5RZ13Y=;
        b=j/Vp+3KV12Z9C4beVoE7Axc8YcN2NoSbjfaj/vnApJf17m+E26HAlJxnEevXIRQmar
         0ZsQlmmLZCbPOvWYX/lFGMfFwofOy5UYwkIXDGGB6Xkq1usVdNKAp+thP8kwhadLTCLk
         6vlsiGpkbOZnsEDETR/kZCoXxdmHdNnVDCmrNPKGqgK/ya3xrXpRhYvusm0Pyp6kLmOY
         24wU82JXaByCbCHDt23fg9QAQ9aoBJ1bhIJ0/FapcmO87/QikEQmyd0e8SnqbtDWP/Ih
         1kK3GVBAc6d10paJAeXnLf9rY/BIfxbJwAdI0dhvkrCfdU1Lb1lkGS4gIDtopqrT3tSh
         UP0g==
X-Gm-Message-State: AOAM531xf/HlSsF6Ev1LWoZWPQ8QRBbetW8nQhwN3KRdl2BlKLXmTQIR
        uYhZHulGLapnl9UmfksJfDwv4Q==
X-Google-Smtp-Source: ABdhPJwphje+YzfcUodWjBx9z1j2dLg8etnWZRokSrHfxsCHYrLK0ByDEP/1V3v69Lwm7V//8rNVvQ==
X-Received: by 2002:a50:9e61:0:b0:419:d8e5:6236 with SMTP id z88-20020a509e61000000b00419d8e56236mr21846515ede.327.1651653046249;
        Wed, 04 May 2022 01:30:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 5/9] arm64: dts: broadcom: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:33 +0200
Message-Id: <165165303187.30033.13973116387246805218.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-6-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-6-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:18:58 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[5/9] arm64: dts: broadcom: drop useless 'dma-channels/requests' properties
      commit: 8dba791a7280542bc125b68b3547bfa2680bc1af

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
