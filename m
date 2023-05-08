Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF0DC77B7F
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 May 2023 17:04:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234372AbjEHRE1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 May 2023 13:04:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234227AbjEHREZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 May 2023 13:04:25 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C296A6A
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 May 2023 10:04:23 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso9333914a12.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 May 2023 10:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683565461; x=1686157461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KMFdLRNKQ89jJWRkxs/WTlt3m6Pbvn2x9h9FIbEb5x0=;
        b=AxnghwstEQhO39B6QSm2G8PlgQCU/YSWbI6KEW0CUllAThoQL1D8ZF6rDIxZVaXieM
         ZkecNE0Jb9tUnJz7UFK2pHacZu1wBqY+tkndEA6n9zIqaEr8ccGdF7n3p6Y+anLuZyip
         12EHqkEa+iN2sRE7tZT+loysW9l7elKiXj69EqoQcFwJasVDepuh+W/Yop9ndEVThlaG
         8FlLKYBfiofA5AjSJeqbV0/Xper1I8iOZUIn/w7l6OMj1b6WrrvBCahDKX9nxNXPR2qd
         x/i11oI2LuvrrNBsMRf3SC3E5yX2Kb9Fw00p6OrTeuh25OHWkew0YllVcRPjrvnGbTXf
         6dOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683565461; x=1686157461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KMFdLRNKQ89jJWRkxs/WTlt3m6Pbvn2x9h9FIbEb5x0=;
        b=S/bqAtM23UGRXXpZ3ZF5JHccGnFeYsj3IgMNwOaEcQ8O3AaRP9Uy+ZTyJtLp5zFFG+
         mzfF+HKSeM8KL+pIlQjW2sZ93y8elUTl9lV0dunsRvw7pzewCFy9T3lZC+fy01OYwUdN
         +QoHurnZ3EzbVWii9LpMydk5s2q3CV5ulPw0yVBXj06QA0a4WNP80ugWLJ4Pa6ptd1QP
         DRea30GaExINSwsAdXn8cqH5APmehRpFfSi3WavLsvNeI5vz4lQORvQ7jRcQkBSC5wS4
         AnospAdF1mZN4w3vOnVB4j+Ml7tFnDtB7KhziB9JIQGVqPyOUsaRq0JfH7R35KbcZQDp
         fZHw==
X-Gm-Message-State: AC+VfDx75T/oaPyu+C0VihLdBdQ8LE6fsU6ptNtG0qkRtlYhQE7zinM0
        oespfD7w31BUUJod3cq0U1hoZ6pxvFT3bwIhMtY=
X-Google-Smtp-Source: ACHHUZ7heYG/3KrnBEYF/XVGw7VXdqdVwiYVnNEeRZ+GWNpSFSE08M6AJptKknVSO+zhUto4UiMDYQ==
X-Received: by 2002:a17:907:1687:b0:94e:1764:b0b5 with SMTP id hc7-20020a170907168700b0094e1764b0b5mr11381209ejc.69.1683565461155;
        Mon, 08 May 2023 10:04:21 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:50e0:ebdf:b755:b300])
        by smtp.gmail.com with ESMTPSA id lh2-20020a170906f8c200b00965b7bf6aa5sm206862ejb.52.2023.05.08.10.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 10:04:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Jonathan Bakker <xc-racer2@live.ca>,
        Pawel Chmiel <pawel.mikolaj.chmiel@gmail.com>
Subject: Re: [PATCH 1/4] ARM: dts: s5pv210: align pin configuration nodes with bindings
Date:   Mon,  8 May 2023 19:04:13 +0200
Message-Id: <168356544397.281925.18235527816257782599.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
References: <20230421095721.31857-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Fri, 21 Apr 2023 11:57:18 +0200, Krzysztof Kozlowski wrote:
> Bindings expect that pins in initial and sleep states nodes end with
> '-pin':
> 
>   s5pv210-fascinate4g.dtb: pinctrl@e0200000: sleep-state: 'gpa0-0', ...
>     'mp07-7' do not match any of the regexes: '^(pin-[a-z0-9-]+|[a-z0-9-]+-pin)$', 'pinctrl-[0-9]+'
> 
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: s5pv210: align pin configuration nodes with bindings
      https://git.kernel.org/krzk/linux/c/7e98d368887c08a6cb79e79684f851e9bd9a3550
[2/4] ARM: dts: s5pv210: align USB node name with bindings
      https://git.kernel.org/krzk/linux/c/64f92c24aa57f8bfc389fe6638f0ffb7e4605928
[3/4] ARM: dts: s5pv210: re-order MFC clock names to match Exynos and bindings
      https://git.kernel.org/krzk/linux/c/6175f658ae07804f7c347903b8c6781e0914d3e6
[4/4] ARM: dts: s5pv210: add dummy 5V regulator for backlight on SMDKv210
      https://git.kernel.org/krzk/linux/c/b77904ba177a9c67b6dbc3637fdf1faa22df6e5c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
