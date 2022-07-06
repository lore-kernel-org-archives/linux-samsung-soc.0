Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 574F6C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 16:06:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbiGFQG1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 12:06:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232679AbiGFQG0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 12:06:26 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AAE425C7B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 09:06:25 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id bf9so3481244lfb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 09:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=WjAXw5QzSpYw1w5FAPUrzObdHHdAgUzvP9IucosXiOs=;
        b=fEozLruwmilAR5E0KmxFbpQpRJCAMD1GO3GGabPkkPtHbnsSu2JVi3Zk/j6f7FIbFa
         Yyv1hv9QCFYKKEH5zUzs8GoVCjTIOh3Ck2SQzO/mU8Z9IJXZxM9kO/d84fz4kG0l5J9N
         +BN57c8h9MCvPT04iUHVDw1kCkuY6RpsjiORqrbcW3XxMJcDnW5vNA4rSUoYvTXXdQ75
         fVwMQpi+Fpye45BG+Fm+TWP6ZFjv5fSM00Hlh9Mp0zAbSwZde8cxWe/bvSVbol0DzR2t
         7O+6KcYfwnm7YVBEsTBmZY4vasMDK+DvN8fnZ9FTypBxMiBQ1g++d+Jaiko+7/vUybDV
         fLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WjAXw5QzSpYw1w5FAPUrzObdHHdAgUzvP9IucosXiOs=;
        b=MNlxd2+SfFxkadV58Q/XHHHjQkASo/7Z48lFr0yq3+qEOSvA8o/5LsBmry33oSyT8a
         Y38eINhj9Feanmg4HhAWTSRk02X7Z31JEbb6HQMgWd73yB7wyAXf3MjQE/1DAsB8kx8c
         QLDM1Q28WQrXhdY3YLFHTesNBwrwvhy9nHi60rL2n1HDI93uwnZ1zNfAEUA+VPfywkkF
         C0/9/YSqa14/x6s5ygxwJWyZpoN+TSZfx8EBX90pNodheJwdyDd4JmZ5UxyqDOfc5PTt
         zxmMS+LIaYQwFnIBDzhxb/sz/UoIrsgqC7Fi90v6djpJg8mPGQtaaAzydcC4hw+eY2pG
         B3Qg==
X-Gm-Message-State: AJIora9cM9gS1zzl898eScmdYMJ0atfwAZyj0Y5NUQY5jCW3JMOQg0O0
        F3dH16EzyToLrGwmZjqgOz5w3g==
X-Google-Smtp-Source: AGRyM1usW44CZYRSRD2ytCRxy+qUWmgNeaHnLzhd/O2UfjriItVc+v1D6IMcZJEjTcZMb8numWPMkg==
X-Received: by 2002:a05:6512:3a8f:b0:486:6ccb:b36a with SMTP id q15-20020a0565123a8f00b004866ccbb36amr2224185lfu.327.1657123583543;
        Wed, 06 Jul 2022 09:06:23 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id j16-20020a056512345000b0047255d21181sm6334630lfr.176.2022.07.06.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 09:06:23 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     devicetree@vger.kernel.org, alim.akhtar@samsung.com,
        krzysztof.kozlowski@linaro.org, linux-samsung-soc@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: samsung: document preferred compatible naming
Date:   Wed,  6 Jul 2022 18:06:20 +0200
Message-Id: <165712357714.28180.6368854125955952977.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705161340.493474-1-krzysztof.kozlowski@linaro.org>
References: <20220705161340.493474-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 5 Jul 2022 18:13:40 +0200, Krzysztof Kozlowski wrote:
> Compatibles can come in two formats.  Either "vendor,ip-soc" or
> "vendor,soc-ip".  Add a DT schema documenting preferred policy and
> enforcing it for all new compatibles, except few existing patterns.  The
> schema also disallows wild-cards used in SoC compatibles.
> 
> 

Applied, thanks!

[1/1] dt-bindings: samsung: document preferred compatible naming
      https://git.kernel.org/krzk/linux/c/30e1f7bb96a918b6551ff5f97dd9f144aa04386d

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
