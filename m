Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 861A8C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 31 Jul 2023 16:23:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233076AbjGaQXZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 31 Jul 2023 12:23:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232880AbjGaQXW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 31 Jul 2023 12:23:22 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29D9410D0;
        Mon, 31 Jul 2023 09:23:18 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AA2B02C5;
        Mon, 31 Jul 2023 16:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AA2B02C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1690820597; bh=yFSfFyUQXT4DT++sxUWwAVT0WoQ6QyQTZaoT9AgNIvo=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=Ru3FR0Ekg1gFV8rnHsCa289Fm+t2lemULUPWgU0OBPUqHBb0cX5+t91PdIKIxqQXi
         UnD3psVJrhfeNBShkC6Rr9BGZCV0fYyST7yWz7fEO34BCv/a4ECniDKDIMfGJlt8Y4
         c/IpuvyFTykpBy9+3Hv71ns/wX328fRUGSQP5x+/YzepM9sqnYBTqtojGHBclwn1v5
         HDzQxgTqbehGT9Ri4skj8w5fzfCXaUfGf721/SF1TfVFt+xSj0cavFfdWa3Dz7TccC
         Ko0oCeZAJodwZSGFoMmHBYwnEzqTpYxc45CGHlDs08S0XlgfnCoCb2b9zlb8fUGkXk
         83MhZs3vc+j5w==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        workflows@vger.kernel.org, linux-doc@vger.kernel.org,
        arm@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 1/3] MAINTAINERS: soc: reference maintainer profile
In-Reply-To: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
References: <20230723131924.78190-1-krzysztof.kozlowski@linaro.org>
Date:   Mon, 31 Jul 2023 10:23:17 -0600
Message-ID: <87y1iwcaoa.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Mention the SoC maintainer profile in P: entry.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Randy Dunlap <rdunlap@infradead.org>

I've applied this series, thanks.

jon
