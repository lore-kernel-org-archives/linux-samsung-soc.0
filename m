Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEA40C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:31:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A978561364
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 May 2021 12:31:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231576AbhEKMcy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 May 2021 08:32:54 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:51016 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231432AbhEKMcv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 May 2021 08:32:51 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lgRY7-0002Je-MH
        for linux-samsung-soc@vger.kernel.org; Tue, 11 May 2021 12:31:43 +0000
Received: by mail-ua1-f71.google.com with SMTP id x11-20020a9f2f0b0000b029020331a0ba74so2049661uaj.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 May 2021 05:31:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1bRU1o0XDKDOSL5Zk+c6E3Lv3V2GRqSbTlCU06mzmM=;
        b=q3rDympEWRMSHtpdbs5uYUjoddFeU4adwUE2wRivm703+dhW2xQNXdp3+uA4+p+JVY
         z11Koj0c+MnSb7vpp88udeRCelETSef/oBFgz+MB2khDw2TzagerNjGhqigQ+Mte5/Hn
         0V1IczzRBSJHs3OGmFmlJk5gLrX1D3D2OcwFdw5FDT9OQSB9XY+tSOmOz+I7zx37PZ/t
         NWRI0U+3XGkgyGSQz4HfE7cUxM77b6epEQrGwt7D2LMdalBXYyQse5dNqfkzbqER++9x
         nFrnDYFWnc+C89Phklp4lKPJvmrcKmhbmcI76tSvrCfHE+hIf1a1MfkYH6Y8G3tx2cXZ
         NDLw==
X-Gm-Message-State: AOAM5314yuqmf0WW6aD9RaL5VR3qXpIUf6p/jFwEFGqhBLPyHr0AVCUA
        MpDQu0+uFWKVEu7E4mPWB1FdmtjXA96iDEPQIkf/wh4D+JV0k1nQiCelNTDElCgF6OJ/LQdycPC
        OokRn/sETB//woHbZTnWlMmC7VWkwjMi18RfxSBN6CNm0ALBD
X-Received: by 2002:a67:bb19:: with SMTP id m25mr24697721vsn.20.1620736302566;
        Tue, 11 May 2021 05:31:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzheT2iWzozwWSQif58RwPbtpuK69eVOhz1J56oNWfzG1tL43SxUWwiNyfpGIsjEGLNBRuFHQ==
X-Received: by 2002:a67:bb19:: with SMTP id m25mr24697700vsn.20.1620736302391;
        Tue, 11 May 2021 05:31:42 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.2])
        by smtp.gmail.com with ESMTPSA id q22sm20199uao.13.2021.05.11.05.31.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 May 2021 05:31:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-samsung-soc@vger.kernel.org,
        Wan Jiabing <wanjiabing@vivo.com>,
        linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        kael_w@yeah.net
Subject: Re: [PATCH] arm: mach-s3c: Remove unnecessary break
Date:   Tue, 11 May 2021 08:31:33 -0400
Message-Id: <162073626992.10946.11784853350682538315.b4-ty@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210409064920.1096367-1-wanjiabing@vivo.com>
References: <20210409064920.1096367-1-wanjiabing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 9 Apr 2021 14:49:20 +0800, Wan Jiabing wrote:
> There is a return above the break.
> The break here is unnecessary. Remove it.

Applied, thanks!

[1/1] arm: mach-s3c: Remove unnecessary break
      commit: 0de0b04c83430ee913c9683369b7059e04e106cb

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
