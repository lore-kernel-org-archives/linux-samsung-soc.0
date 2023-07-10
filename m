Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98E12EB64D9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 10 Jul 2023 08:00:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229805AbjGJIAg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 10 Jul 2023 04:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231991AbjGJIAe (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 10 Jul 2023 04:00:34 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43AD4EB
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 01:00:27 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-51e5e4c6026so134998a12.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Jul 2023 01:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688976026; x=1691568026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAeFrhACdp94XF1ndhJ9bb02rOnx4NRHqy8PSIYqL0w=;
        b=iYm6GWl72rhldQ2eA4H4LRwz0borU8OQxILMgVT47VnVlqR2KW1aOAHS4Y2iGWm63I
         XfSYkjqmLC7ipXOLtEBl1v6Xe0OjSUT+3rE5eCt0uitBCAR/i+xB+wLVEXo5XN6xVrzr
         wtVjidYt7dvYVU7P1ub669OnfrHb+yQ8Thg+rtlDKP68z7yYWe3ZRhQlo5l+TLZH0akC
         NTFR9isRZosJ+McKI4RlZsKZc/bX0hHuTdlpzWWQ9O/BI/GoEu7A57+LlgTc+r1uFTYZ
         dIwQUf45J/ztD5PuyZ06E44RMQgQZWt5tvX2HSkY/qUbV9CT847n3F1khYfOiv6sIpDl
         xgeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688976026; x=1691568026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SAeFrhACdp94XF1ndhJ9bb02rOnx4NRHqy8PSIYqL0w=;
        b=iRDZ6wZ8Jvbr3978f7SqvONzL5XWBTzfKQRJ4Dp9NnSSNOj4bB7GIT4Ip+s79FqzlF
         VcmFdUgt3ET9rZ9yKfeH2xuztLZ92by2uPI7Qm0GhKg1wypsr535YQwfUYktXUhU9VxM
         +6aGcjW5pBmkF41talH8boad1le+3IN/vyl8L4ekO7qasmOGW9JJBXPahR/SmzV9UehT
         rbWzEUZgyHwNO+brk28wRaNmbjzcT/bleCFsuyI5/nYXv8xKODgXP2LHNXjJDMR8hpMC
         VoyHestKnY9BBOOcufKEQODpIh8qFD/Jf5ZZ+lErLbGqSUCqItTwEWrSWL9w9lBvak/E
         JHjw==
X-Gm-Message-State: ABy/qLZGyPbl1dHFdUB7V3lbyVz/tyyUalGWFuVo72XuXyZHEHYgRz3F
        OcENSt4N0Jj8d8WYTMXKxiKUOg==
X-Google-Smtp-Source: APBJJlHlSjojvo4WY0Ux9AFb4qe0jBfXaNqbowxtGcF5eo38DOV47g8KLzeFSFY9hywJX/jUpJ+/zA==
X-Received: by 2002:a17:906:72c7:b0:993:ea6b:edf1 with SMTP id m7-20020a17090672c700b00993ea6bedf1mr7430361ejl.0.1688976025721;
        Mon, 10 Jul 2023 01:00:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id br17-20020a170906d15100b009930c61dc0esm5819123ejb.92.2023.07.10.01.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 01:00:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] arm64: dts: exynos: add missing space before {
Date:   Mon, 10 Jul 2023 10:00:19 +0200
Message-Id: <168897600949.19079.4403147383403836109.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705145942.293527-1-krzysztof.kozlowski@linaro.org>
References: <20230705145942.293527-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Wed, 05 Jul 2023 16:59:42 +0200, Krzysztof Kozlowski wrote:
> Add missing whitespace between node name/label and opening {.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynos: add missing space before {
      https://git.kernel.org/krzk/linux/c/476ec6416f0df058c8a20b2f3b8bc9ebc3746c9e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
