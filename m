Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E307C47089
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 May 2021 15:59:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5EF1E613C3
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 27 May 2021 15:59:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbhE0QBK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 27 May 2021 12:01:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41790 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234961AbhE0QBK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 27 May 2021 12:01:10 -0400
Received: from mail-ua1-f70.google.com ([209.85.222.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lmIQ4-0002mi-A4
        for linux-samsung-soc@vger.kernel.org; Thu, 27 May 2021 15:59:36 +0000
Received: by mail-ua1-f70.google.com with SMTP id m11-20020a9f3fcb0000b029021dec910e95so360075uaj.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 May 2021 08:59:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uhQuusZtBteBcFlBh9DB+rkgQkk6uTxPH7D0Fh683LY=;
        b=t2vDzmWgbNtM/A/4C0cDo0hMQseob+TpuclSJ/T+yLaw1nWDtwEp/eVZmrQliwke57
         AlTo6lPFFdU4Jgc/JSCvjaw+XO0Wmp6HCy8PAfCGNuOGXZVaC3rcYH9BK4aFHCBdBaJ+
         JfeDt4p8GMcEqdT1bR4nyDNNSQPyp9nu59DmQhqbI45oINkvm1XObq7lr/boxC5KsrAa
         Quon2ge6SDKVNKtdtzShV+T45w2S97lZAtCr+/6GI3AZusDIecwI3BoSXJq/uZUfzuJ9
         Z1oNiROMUFE/TfC19jYtZ8a5cYKAsZkch8c2DbDNm2moe0216DVmthM/T3e1plGk4USS
         1vnw==
X-Gm-Message-State: AOAM532jlJPd5mIFVigdYmdPLIMyNgGcahBpDUrlxrYoAlXV0/sxfLZF
        4UtDNr7+++TKtlCnFlJSSar+s3mW5xvTmTI9Jj4zQFPV78QZ3D84rL36K6ClHKsfvf5OBGuUFaT
        N+5aDcerC2PdVukLn8zCR8QD4kwLU4GdN0oRdDs8KYaHmbryq
X-Received: by 2002:a67:fc06:: with SMTP id o6mr3089905vsq.47.1622131174958;
        Thu, 27 May 2021 08:59:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKX+mkz8i8MFuwbAvw2AHS1wNst25pE9fjXglYMYxSas4giQzrnMVT65LODg0+9SH/UXiNFA==
X-Received: by 2002:a67:fc06:: with SMTP id o6mr3089878vsq.47.1622131174798;
        Thu, 27 May 2021 08:59:34 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id d12sm350441vsc.8.2021.05.27.08.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 08:59:34 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH v2] soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
Date:   Thu, 27 May 2021 11:58:46 -0400
Message-Id: <162213112181.85040.1561034513535715407.b4-ty@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210525184716.119663-1-krzysztof.kozlowski@canonical.com>
References: <20210525184716.119663-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 25 May 2021 14:47:16 -0400, Krzysztof Kozlowski wrote:
> The defines for Exynos5 CENTRAL_SEQ_OPTION (e.g.
> EXYNOS5_USE_STANDBYWFI_ARM_CORE1) are not used.

Applied, thanks!

[1/1] soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
      commit: 16b79a1e083371a38f72872345866e81abb7ca18

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
