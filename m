Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F97C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 17:10:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239185AbiAWRKz (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 12:10:55 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43178
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239188AbiAWRKu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 12:10:50 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 0A9923F4B6
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 17:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957849;
        bh=/2OIXme4ALl4DAjdA85FQwEEgnqTTVJ2eyUW6QlD2T8=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=mqcxs7z2nNWaPEVMkFVpHCkuxBnL9FXDmOM3ssSKHoQsdqqfFq7d4Wjo7pXYwf+D4
         tbjEL1R9JrGmew5c76DBv28PlPOWu/p/YWR5OmIq+BZFdPeoFQjVHyI8PYfBytSoSd
         PkPV83CktdbESTBajrSSt76/S8HuTdF8LrR4HHUrpqQiuemLVYuuHcGzsXqrI/KP+v
         rcydBSikuxPRn5j8JYxPGEJnS79rzaubLucFU6U+XIdWxSrN6wqXAaVZHz9MlTbfUu
         lFvsSo6AApDGfQ+ALjBKvAjdaGEW9uDwAP8fU8L3o4mznHbx9bgqfnKtg1Bk0dOYwZ
         kMQWOQb3jhXZA==
Received: by mail-ed1-f69.google.com with SMTP id i22-20020a50fd16000000b00405039f2c59so7535681eds.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 09:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/2OIXme4ALl4DAjdA85FQwEEgnqTTVJ2eyUW6QlD2T8=;
        b=UCUi102EYCyMmeYssvNgByV0B1TFb0UIJn2xffdNVW7Qdh/+r02Lje4ojUnmhkVdcq
         XXZxWjYlkqmpZ9ATLnvfSCHUoMLvUNM0vC/hlbHivxoS5506bp7+S12DpBr8ESPUbxmI
         uRZSD0OkQdbdt/MmYFe7x6MZw7v/fRugP6xZkWXyxvEdM/IKs5ysxmx23f97lwrhi901
         GmQb61hWPPpTVF6AmRIH4S8phE6OTfBqXFbaHYNczmEzqcGmhrS/bAtc0nvBdZIQjcua
         kF9cZ/M5hq58ESpXJTf4ugCO3D5gWizRUloQt57i8+ZJvcOVQFSWHCzzijWTIly729+L
         uNQQ==
X-Gm-Message-State: AOAM532XUkOqMpdY/PJTEQktrUk449rKES6q5Mc06sMHPEE7AYKvPInc
        z5mLc6g+Gl/Mf4LXXkv8bYRZrf+NRTKei0ee5qlvIC+hDMLi8ZI5zkaBA7535Xqjb6Tmob69rU7
        JpoZ1MtP8PVGHTEHJ//boh+qJgjOXXqgZJ/+bkh+Wg3LaAmp4
X-Received: by 2002:a17:907:c01:: with SMTP id ga1mr9855509ejc.719.1642957848625;
        Sun, 23 Jan 2022 09:10:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy9xL/Mcl66pAOPBWGwufPt3D01t+dIls2WZgVjeMInLwmxcYSEx9LO5kA2ZiiRVdxKHoHp1Q==
X-Received: by 2002:a17:907:c01:: with SMTP id ga1mr9855501ejc.719.1642957848428;
        Sun, 23 Jan 2022 09:10:48 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l2sm5208665eds.28.2022.01.23.09.10.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:10:47 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v2] soc: samsung: Fix typo in CONFIG_EXYNOS_USI description
Date:   Sun, 23 Jan 2022 18:10:40 +0100
Message-Id: <164295777264.25838.905366806236166301.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220114144606.24358-1-semen.protsenko@linaro.org>
References: <20220114144606.24358-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 14 Jan 2022 16:46:06 +0200, Sam Protsenko wrote:
> The proper name is Exynos Auto V9, not V0. It was the typo slipped in
> unnoticed, fix it.
> 
> 

Applied, thanks!

[1/1] soc: samsung: Fix typo in CONFIG_EXYNOS_USI description
      commit: 442b0c08db7e35980bed6af091877f4dda72ffca

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
