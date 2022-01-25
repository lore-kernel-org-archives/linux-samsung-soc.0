Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA8E1C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 Jan 2022 17:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238237AbiAYRI5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 Jan 2022 12:08:57 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54574
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242434AbiAYRFg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 Jan 2022 12:05:36 -0500
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2E1C73F1D1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 17:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643130334;
        bh=nMdW5v69q6Wohx/luhbyzlU9+wYmArcJIac8Q+rwqeU=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=qGDycotR9fy9D9pUTazcK1pdos+/bsTEs/cc6dTz3ntJ7jzGn3w7Z84CmF2QziLjc
         3VloLuh0XkSWMHrQK3Xvk+SC6EmzX00hbrp1XH41UZt7PEmRkl6Ysgo/TrcTHQRzLj
         3um5Ok3gdLi3fMKCcTkemmMnwBCESMVF2pjK7whAIhSTE6tWI//EhiEepJnXAtFeos
         8gW8NXw8aZAjWHfcob+ekPhKtCLUfGjbpCaxXc4y2lfnQxIvEsTfOchVimvnbUhmbc
         +e3OC7bxiXWqnh9Exyikloqaa6ZEB0pSud7TW3b5z/wAz2pOLxC02c0hHBoBc/PyW9
         evZUG8yNloFLQ==
Received: by mail-wm1-f69.google.com with SMTP id s1-20020a1ca901000000b0034ece94dd8cso1435679wme.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 Jan 2022 09:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nMdW5v69q6Wohx/luhbyzlU9+wYmArcJIac8Q+rwqeU=;
        b=RRxL01YXLCmg4v/NpDuP3xzUR3T0NJVaGct3jZV+PfFgG6y5Uy/xX4E9A426B0YL1u
         WHX8K3vOV5Kf6glR0UxBVBKmdVN6pT1b9T+PxJBRwcH1YAoxmOpLm6R09DLylRbIJZUP
         SkvuPi1byV6rkbMPyeSZkIxapsmTcobsMC6yrc/5Xkf4f4WxzMzyhHvtS40+lZPbOUF1
         KQ1nyWsqWRbFrKIXl3miCZ5pu2Mlt9lhr8ZBBJwgwOg3Z5H8fPwNxzHEgLqcSatWxLO7
         TFzvCN8CGunyj+Ppm7fiqAZtbj+3InoYmdv5FlWtqwJGhKiywju9o7BNW+Gaci98oZN0
         laTQ==
X-Gm-Message-State: AOAM5327YCqyp66lqrwtAkuY8WLd3NOxNxBYdkMg6WRuLjVUh0bn1qzC
        h+MeEgVmFsqpZcn0MT25OzVoEajdAhBRHsdKHtN5fyKEbHp1PviOfphpi2gQsbC4uYkE/pDv2yp
        ngyr4LijJmD5bpwg+zoC6gpYwPBF69bW9rAY9+l9PpAAdZB2q
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr14685557wrm.5.1643130333914;
        Tue, 25 Jan 2022 09:05:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyDMNurXGEYwtfMsLt1TRMNkY4zf895J7er0VWSTdW1WADBBTbrJZhBCjzjcyuRZBB6Z7JRYg==
X-Received: by 2002:adf:e3cf:: with SMTP id k15mr14685547wrm.5.1643130333723;
        Tue, 25 Jan 2022 09:05:33 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id o15sm1082377wms.9.2022.01.25.09.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jan 2022 09:05:32 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: exynos: use define for TMU clock on Exynos4412
Date:   Tue, 25 Jan 2022 18:04:55 +0100
Message-Id: <164313029072.79782.9597131661612342819.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220122131457.63304-1-krzysztof.kozlowski@canonical.com>
References: <20220122131457.63304-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 22 Jan 2022 14:14:57 +0100, Krzysztof Kozlowski wrote:
> Replace clock hard-coded number with a define from bindings.  No
> functional change.
> 
> 

Applied, thanks!

[1/1] ARM: dts: exynos: use define for TMU clock on Exynos4412
      commit: 86955cb6ba16cd35323f498acbf0f07f8671c1b4

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
