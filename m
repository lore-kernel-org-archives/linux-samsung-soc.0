Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1372FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 23 Jan 2022 17:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239150AbiAWRKq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 23 Jan 2022 12:10:46 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59226
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239139AbiAWRKp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 23 Jan 2022 12:10:45 -0500
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 113633F1C9
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642957844;
        bh=9aUVeDHijgpk/gPdmhnxkt4h8TZ5fsPsv2xLl017ipQ=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=kxsbD59MKnKE0BKHluSbvnA6KjA9B/c7mQurn6ws7fLiG2F5YhKg9i8eEBn3zzH1U
         KP038bCJYkQNYji/vrrfKejBXiL+B2pYN6lZbF5BE5Fiv159OTWqiMRySLfgelIPDv
         qoasYt1J3E9JUS7b/wpJyfMmB/XXV8PsKsCPXMHsTa74Q0oA5MAnF7vEozC387DOaB
         ewy9AhWVpuPkMzmemuZnR4VXavIzXRbSA7U/6n/L0VrcfjUvVnZI2PjpbVKYooZB2r
         H0FZeXg2hFb39FF9T8oyDOC9joGhHPt7x0UOZ3o6LKX8AcXWDZveqLQftsynU29BPB
         Zy0/bk5ugTTTQ==
Received: by mail-ej1-f69.google.com with SMTP id v2-20020a1709062f0200b006a5f725efc1so1528048eji.23
        for <linux-samsung-soc@vger.kernel.org>; Sun, 23 Jan 2022 09:10:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9aUVeDHijgpk/gPdmhnxkt4h8TZ5fsPsv2xLl017ipQ=;
        b=44QskVzmMbybU/QPnnWJZJUddRIh2fML5pp8LmSA/vGcJF+BsYgsq3/h/2I0waTYz2
         fwOQi0rTyHKzKFBMeEHILfwOOiXgdEEAwCmCHEVVa9sCZEFumjFMbwHROu2klxyNP040
         sURT/4vY49eDd+bOARBXI5gcBsI3Ox7BNBTl85AmUtflpzmTU8I3jUEDd5qKL9If+g3h
         DGv16qDnwOGc8TOZQSI41lvSbzO0jtwHXm6fOu1tzuMhXljLvGAGwZpmmS3tDO5ho5N/
         SOjul1kSl0FgGLWrLe1POpLAKHb1PwEXB6BZPOgvMOtaBqKRSrU7tfW0CeDyeGMwSACd
         mQxA==
X-Gm-Message-State: AOAM532JTChJyRgU1BQ/7XcszcN06WjdgX2cMtH+k1oDg5Avwoz7R3Ln
        FRnTb3LJF4xTk4BUuxeuve2pHurdwtbaO4wDaBA/1giL7RuKdM/+7uIrU4Or40BHl+GtJbdmBkh
        SCITBCVXNTlfi7WHnvLgd3sQei8uffaOSFqBNKeMrJmf3DlVX
X-Received: by 2002:a17:906:4ccb:: with SMTP id q11mr10028605ejt.398.1642957843644;
        Sun, 23 Jan 2022 09:10:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMefem0jCf3PJq8lnGfLau04Ms1Hd+SIUWXl64m0Pg5L2zvBjINugQgs92nw/gH+x7IuW1rQ==
X-Received: by 2002:a17:906:4ccb:: with SMTP id q11mr10028597ejt.398.1642957843504;
        Sun, 23 Jan 2022 09:10:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id l2sm5208665eds.28.2022.01.23.09.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jan 2022 09:10:43 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>, linux-pm@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Liam Girdwood <lgirdwood@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mark Brown <broonie@kernel.org>,
        Lee Jones <lee.jones@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 1/4] ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and Rinato
Date:   Sun, 23 Jan 2022 18:10:36 +0100
Message-Id: <164295777264.25838.2090071538223607341.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220111174337.223320-2-krzysztof.kozlowski@canonical.com>
References: <20220111174337.223320-1-krzysztof.kozlowski@canonical.com> <20220111174337.223320-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 11 Jan 2022 18:43:34 +0100, Krzysztof Kozlowski wrote:
> The newly introduced dtschema for MAX77836 MUIC requires proper naming
> of extcon child node.
> 
> This should not have actual impact on MFD children driver binding,
> because the max77836 MFD driver uses compatibles.
> 
> 
> [...]

Applied, thanks!

[1/4] ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and Rinato
      commit: 8d6f5af71e2ada6214df028441d479e1925e105b

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
