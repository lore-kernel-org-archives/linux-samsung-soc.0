Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A1E0C197A0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Nov 2023 19:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345391AbjKPTru (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Nov 2023 14:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229841AbjKPTrt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Nov 2023 14:47:49 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63F87196
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Nov 2023 11:47:46 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7789a4c01ddso72042485a.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Nov 2023 11:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700164065; x=1700768865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqcesqxyA1kvv/2F1OC3bKoVHXvqMNvAFBsyB+TI29o=;
        b=mhFZafV8jFXeupGptU28yorqMjSpiVhm8neJ2md6bbmPtoOBD4YocjycJET4AxsB3j
         v8QfsF+yFnKtfIwGr6LPHXiXgd8gbA3eGQq2gpKepysDkjjTEaaqf0cyfrWo8cynMRxK
         07Ocb5xqThhiPnpZa6CZUam90Ws/p9HgSEgNwQSXT7yKFpNV8LL8eSG/QcMAxnIOqUbZ
         ThdgLffeuPkySVULd0fE8WyVJqc2kLQ1SG8IvIhNw6uNbodkhnZJ5k0XboXg82RLaaDt
         1llYptTrViQiq9vhuzZDoHTl6TmY2xS/28bz/WyZ6rK67DTIdL9DUnW0klfvBNasXRf4
         83fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700164065; x=1700768865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqcesqxyA1kvv/2F1OC3bKoVHXvqMNvAFBsyB+TI29o=;
        b=PkqJvzeg1M3WkYpyxTNIqfg6xUZV0oymahS3iqJ5m6ni6TKje1mtiNHyGZZbPThssV
         gwuXHSa+yOeDIQ+dCoSgd0jAzDgVGMWNlLVcfMarcsEidhPHlA+qwH0zq9jYjEK1Am6J
         Uz7hukGsdpXeAjwwxK4WZk1cNIZgqntGgdZn4/XBq5W0/aMGW2d+ZSaIRyG50c6l4LNx
         tW9UAtFumWtrW3YaRIOE58I1ElwsBaWyqU8GpViQU4N5UqelEOKkJcQBEsMZPkNkvai/
         TpTFoJYtN/l8Tq7DgwkF8LcGVQ1eDO8qEXliq8HneKXonDAqGCFikTIq+SbnMAdOsWhv
         Mqew==
X-Gm-Message-State: AOJu0Yyp3KtZNsiVinElFiWHEC1PWmOMBBh0G3NwktScD7EUuLW60k+W
        UdBLIVwNF38yAqRbGJ/spUHh6A==
X-Google-Smtp-Source: AGHT+IFGH/x/U3OVzPeKPDeRzZhWFEyT6GgnBwC+lO7YN4EHBBv6PZlzNnKZQsrVteq/CgcE7ugjuA==
X-Received: by 2002:a0c:e607:0:b0:658:49bb:f78f with SMTP id z7-20020a0ce607000000b0065849bbf78fmr10696124qvm.39.1700164065517;
        Thu, 16 Nov 2023 11:47:45 -0800 (PST)
Received: from krzk-bin.. ([12.161.6.169])
        by smtp.gmail.com with ESMTPSA id j2-20020ad453a2000000b0066d32666a20sm26982qvv.71.2023.11.16.11.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Nov 2023 11:47:45 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: samsung: Fix kernel-doc comments
Date:   Thu, 16 Nov 2023 20:47:41 +0100
Message-Id: <170016405832.24538.746351880812245666.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109190925.2066-1-semen.protsenko@linaro.org>
References: <20231109190925.2066-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 09 Nov 2023 13:09:24 -0600, Sam Protsenko wrote:
> Fix some issues found in kernel-doc comments in Samsung CCF framework.
> It makes scripts/kernel-doc happy, which can be checked with:
> 
>     $ find drivers/clk/samsung/ -name '*.[ch]' -exec \
>       scripts/kernel-doc -v -none {} \;
> 
> 
> [...]

Applied, thanks!

[1/2] clk: samsung: Fix kernel-doc comments
      https://git.kernel.org/krzk/linux/c/d1d53909bb5fbc9bf618ab78515fdbd5d6b691c6
[2/2] clk: samsung: Improve kernel-doc comments
      https://git.kernel.org/krzk/linux/c/5583e92be5c45448e6ea461e1780d46c17d14963

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
