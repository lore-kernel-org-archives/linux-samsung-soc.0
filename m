Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF676C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Dec 2021 07:36:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240631AbhLOHgT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Dec 2021 02:36:19 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54698
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240653AbhLOHgO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Dec 2021 02:36:14 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1C0203F177
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Dec 2021 07:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639553771;
        bh=lH1LVhxxdi1joAcG9QMeOEZioVS7QsVUiTN3+0B9yPI=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=snF0R5BUMjyMIE5BS40kakeVNlPU0yB1IldIY41RIkYHZGkjkjSjAJjyJiGG1Qd2V
         8mUHJpLga/kInhFZMgS5pU7cKQeM/r7/Iwb8TNr1KvK5rc/UYbHDlz4d1wkoD+T4hP
         ks13iIbM/2iLflruno70km/ftRQLqymE3zh5BLZ7E8dwc3aysH+Cbmpm0kIDy41ErN
         Aaf3f3d7f9N3JXNuiBRSrd7juYIHlw5OnJSCk86S/CMzg+J/O4Fv1cwh/vhxSdp7uU
         etTAUo880N9RRO5EWMP8rmMt62AAPTaVmSd6KRc23ewvIGmuxmCwQuH+TiSwmh1b7r
         WCe2XlOsJQVKQ==
Received: by mail-lj1-f198.google.com with SMTP id a7-20020a05651c210700b00219132ab503so6665948ljq.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Dec 2021 23:36:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lH1LVhxxdi1joAcG9QMeOEZioVS7QsVUiTN3+0B9yPI=;
        b=M4EdBOOdeXx5aapm7Hgh1UiPmNtcvNmdLpISlJxuYOaVSbsBWl3XhEllNpWrnHaE5T
         aLpQg2ntRgNl8ytJ9wK7v0IqxCSW2T4An0b7SNmmWGitSzUtpcoJHQc568U0Dy4+FEiI
         3ap+A51+PPxgg3s2iS4Da+UeesGP3/sXI28E741idGQx4FnhjcI5geO7D5/k0l06TVN+
         146M32OVCt86Y5d51pI4TaYoGyFy/MAL6IqkC6jVuBzI/hyU+09+P1I5M/t2TSC/xydL
         5AyRY42DGaZNfZ17lG2wYwLwmx7+4fKigpBpj3t1MqLGOud5Bqp8+UcCVuXAeE3CPLRS
         I52w==
X-Gm-Message-State: AOAM531S9D6hf0JMx0Y/gGdayf9l7FIekaYP7JVhE4mwgri1tVFwpDWE
        ysxyO0akT9njtKoVgyNUBcVy/vqqDVyk2QFtvhyHnM+XmwLvKtFHgozfgaKu60L7aW1F3Mg+mLy
        tE8WqNWTxqBdtkE4rhAM0iZ3H6Oe7XQbC5WQ5KRR3UZlrmG2p
X-Received: by 2002:a05:6512:3a5:: with SMTP id v5mr8692444lfp.250.1639553770541;
        Tue, 14 Dec 2021 23:36:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwOwaghIPjqudOHsOrTqyn0+O2yP9jGP5v1G1NM3rIvGm2dppX7KnT+sQYSYzVH6Kn1f8081Q==
X-Received: by 2002:a05:6512:3a5:: with SMTP id v5mr8692421lfp.250.1639553770272;
        Tue, 14 Dec 2021 23:36:10 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id v14sm189836lfe.59.2021.12.14.23.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 23:36:09 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: samsung: Fix I2C clocks order in USI binding example
Date:   Wed, 15 Dec 2021 08:36:07 +0100
Message-Id: <163955376463.24562.1462295970065480353.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211214170924.27998-1-semen.protsenko@linaro.org>
References: <20211214170924.27998-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 14 Dec 2021 19:09:24 +0200, Sam Protsenko wrote:
> Now that HSI2C binding [1] is converted to dt-schema format, it reveals
> incorrect HSI2C clocks order in USI binding example:
> 
>     .../exynos-usi.example.dt.yaml:
>     i2c@13820000: clock-names:0: 'hsi2c' was expected
>     From schema: .../i2c-exynos5.yaml
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: soc: samsung: Fix I2C clocks order in USI binding example
      commit: d56a8e9c7af835a4f3f88b2ae34f4ba6f7085b7c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
