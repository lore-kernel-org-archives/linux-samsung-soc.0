Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 586E1C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 08:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346311AbiEDIee (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 04:34:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346308AbiEDIe3 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:29 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D0672251B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id i19so1449205eja.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=u5DCd3gkGII5U0pKaCSu8S8zCepHUHc6pq9yX+4Mlao=;
        b=GMZUoxeuZjoJ/K6NQvljVb3HZYp4gFeB5Ykxz1ZY2nf9vzgANKEp/BX25OELqES/jC
         EprO5sEnB27Tgi+r4n/Ro3OmGEeJK4Ly6aLgmIJxXt3IkAL/+pbZtzvx58KQnkKz/kcw
         PSLFGTMsqoRTxhYIb61yHdvtIBUJx/U4a1uqdr1OWlIQ0CaGBI0yQ+xjrIve2e2x86vP
         9XB/KVf9D35/H11gFsGuOVnNi8gnScDX+QYdROFYjaNdBmNgTuMBEcoVII5ZcFRlg73U
         IZwbOR2Yr3zucaeXkAxp4PonSSOLm0IA3Gk4epfy1OiZCpwBBa5+Aw2rittnemiop/qY
         zJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=u5DCd3gkGII5U0pKaCSu8S8zCepHUHc6pq9yX+4Mlao=;
        b=0yyybunK2ssrKdq2pmh6dEsWJAKTR/C6OASQKx+edtPkCtQyHYf8i7xDgfA/xx2kWx
         my/C2CEpsYERFWHi7bTuZ/dSYvbGOm8QeD/J6Oru6n/UP1ttaQrz4d3mEf9YDloyyJIl
         blZJaosWEuZtEqwlc/ddyic5VjqNGVk3sM/aWtgkqD+D82XcsiBcCrzHauInf8i1h+6U
         YNv9yEMsqG3MARW8fLc5bBlp9i6uS7LWt0cfXhsFOewHZ1u22X96pBQVxPorK/ca377j
         i0Y5lbVA7wtx2HkOItortIlXSDCP1OtoJbFepKS40MdLQK3G42jvV07TVQhYsv7JLQb7
         Pubw==
X-Gm-Message-State: AOAM533hZ06T2bnmvLTqPaA2jXWZsu2UFop6ZGLiJZAoaLxUSSaozitK
        Si054VDV/GBNMTPODCb0hauYuA==
X-Google-Smtp-Source: ABdhPJwwVKMcnsNd37Yy51jMHgfAXH7aYaCB3dEzXCD+dy/waRy/yEoHFbyD6ySsK3O90BBX5ARSzw==
X-Received: by 2002:a17:906:52c7:b0:6ce:a880:50a3 with SMTP id w7-20020a17090652c700b006cea88050a3mr19088588ejn.437.1651653051197;
        Wed, 04 May 2022 01:30:51 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ray Jui <rjui@broadcom.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-samsung-soc@vger.kernel.org,
        Scott Branden <sbranden@broadcom.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Liviu Dudau <liviu.dudau@arm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Michal Simek <michal.simek@xilinx.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Rob Herring <robh@kernel.org>
Subject: Re: (subset) [PATCH v2 9/9] arm64: dts: fsd: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:37 +0200
Message-Id: <165165303186.30033.9938250875625514069.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-10-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-10-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:19:02 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[9/9] arm64: dts: fsd: drop useless 'dma-channels/requests' properties
      commit: 6745dbc73112819529d776275b4e76dae5c12680

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
