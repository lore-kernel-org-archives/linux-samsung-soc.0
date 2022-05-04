Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAF38C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 08:30:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346350AbiEDIe3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 04:34:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346329AbiEDIe0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 04:34:26 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C3F124956
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 01:30:50 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id i27so1457255ejd.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 01:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GXoJXDUDrgkUSMvyeYyAVqyRWBa+AE87coAVNtHrkMw=;
        b=NPczZLhU9GPldOjl9K3xHycnK7S7VeM5Wq/1pOrV69+fIfMPH0zY+nUanRgK+NK0ac
         pAfwuYM07mXYglV/p5nHQV47k8E99RayZx6MwTWjIjVDzRIUlaGIQj/g5kghmaXdds4x
         Hq+wolaOl21PVyj8kOM/wP7aH6WEz7R9rWrFpBeyJJauvavf6w4oH2UDzQudQiEC6dtO
         LXgGmkx/xzUF2IR0fG68+PIbQ/0n+IICqtfC7ki12LoIB/znMsqyxDQ7/ddPe1NUy/id
         goYmMpzIDKPTQ2HhADNvz63HKWxaSCiVpoJb9EscgiId3ShCPSvVvpL3BxqtRNmxOrG3
         6hJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GXoJXDUDrgkUSMvyeYyAVqyRWBa+AE87coAVNtHrkMw=;
        b=jXasIpl34JUOYErr+6k1sDPiKMmC4v+/OhurJS49wk1UI5FiMaJ3pRQG24d9XTuXIq
         RvRz+czKNl9ofAtu6XcdYTX1MX6w5o7M01qf5oG0gsLBB5Xw1aBiU6gQHAQQ0r6nk/mH
         OuXNAFIsHZQCcW3KSK9CmEAuPaNLUL1dA86oIR3TaCJMSDOF+1O+Cw5gNFjmlb9cuBco
         5LBZ6WSNfBnh+ZYKEoeZuxNVZWbPNkdnqU5ajNBCZ4UclF2mScuxMZQCmo7cm4BwHI+v
         NvB+FioaP3SdICNXSufduREpyayBbKn6a6FeMU8eUbl0SGdbs3gq3wQqYXp550XnCw58
         uXog==
X-Gm-Message-State: AOAM531Plw9PKKxiqf7thHwsjtYHilZCmBsNvCSTtUzkJEEm8evbNBG1
        9GKUFCmqsfR/iEyasA567Rb0bw==
X-Google-Smtp-Source: ABdhPJy+824ENK7sN1D0LnLIeQEVCt6H7JiS+QZCacTvO4AyCNUK5LBfOVQrlEqXAnAqqelnDzRW3Q==
X-Received: by 2002:a17:906:2881:b0:6f3:f24a:756 with SMTP id o1-20020a170906288100b006f3f24a0756mr18899164ejd.444.1651653049903;
        Wed, 04 May 2022 01:30:49 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id jz15-20020a17090775ef00b006f3ef214e4fsm5377029ejc.181.2022.05.04.01.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 01:30:49 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Liviu Dudau <liviu.dudau@arm.com>,
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
Subject: Re: (subset) [PATCH v2 8/9] arm64: dts: exynos: drop useless 'dma-channels/requests' properties
Date:   Wed,  4 May 2022 10:30:36 +0200
Message-Id: <165165303186.30033.9411024965777090941.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220430121902.59895-9-krzysztof.kozlowski@linaro.org>
References: <20220430121902.59895-1-krzysztof.kozlowski@linaro.org> <20220430121902.59895-9-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 30 Apr 2022 14:19:01 +0200, Krzysztof Kozlowski wrote:
> The pl330 DMA controller provides number of DMA channels and requests
> through its registers, so duplicating this information (with a chance of
> mistakes) in DTS is pointless.  Additionally the DTS used always wrong
> property names which causes DT schema check failures - the bindings
> documented 'dma-channels' and 'dma-requests' properties without leading
> hash sign.
> 
> [...]

Applied, thanks!

[8/9] arm64: dts: exynos: drop useless 'dma-channels/requests' properties
      commit: 03e1d34d27a5e8065c5ef691648ee8a519e3c1b0

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
