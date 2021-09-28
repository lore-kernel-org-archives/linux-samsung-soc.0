Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C1BAC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 10:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D7BE610FC
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 10:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240205AbhI1Kkr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 06:40:47 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58094
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240189AbhI1Kkr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 06:40:47 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A78473F31E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 10:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632825546;
        bh=ivKPINsxHhuMLTbuAYFI96pQ5Hl0fcGGP5tJTIK5G/Y=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=myIeBKIYPOc3dGf5XhaEq5DtdPauBAJQI9vxBPXFwz1wGHIl+/hK/dRnOuEdWiZDb
         3VzVk918APPwLx71yd/fqWzfl7SPQYq6gVBh9NnmiLS7nqT+WXBojrvDNmBEZLcY8I
         76oJTDm2PQAPvcANb83TxbR7qFXlA9BM9e8252x1m6QxoUKXv6UZ7zelyZV0vARYiQ
         gUzbPCiwWADO2HqsJ4Wm9OSuABSikD7qDZ+lPfxNU+ufLqmdnK6A21DQVM6MDdd8et
         drvTHUJNcpdRoG1kzwhOQv/O0wf+A18hcJwF+6mJeV6lQLV7HVzBUdf+TFbd3tKOXD
         CUfs7zokt+2dQ==
Received: by mail-lf1-f69.google.com with SMTP id m2-20020ac24ac2000000b003f524eae63eso18963465lfp.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 03:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ivKPINsxHhuMLTbuAYFI96pQ5Hl0fcGGP5tJTIK5G/Y=;
        b=HbrIK4uemWeYfkheyaw0qXKhEX2oQ1mp7sorjqUstPDTBoezMP5327JuS3waPUomns
         Ef6fq86wmW6c2Fo/dgs8T4hgfB7Vp2VwPGmbVsyQlvF9L+xpXbvf8TwL5L5eSZt1djmJ
         fjmPqrytc/JRLEwIJj1rne5DnbQeEa2IB5SHNRqM9gHD5oFfMi9lbs6TAyABQDrkdBC8
         QBsSoP6qwh21GqCnJB4XY5adpVRR5bJEtLw7jrBknrvLwO+ZwcGIMLNydt9lN9aN7YP4
         4E1W65WGer5Mf+1cjqeMomI5BCPOukDhOa/kr5hB9t+yjOGSgPkwXSEfmwlr6UvYOF9c
         PYSw==
X-Gm-Message-State: AOAM533lyx2smKH4wb++uXbBF6gwU/OiuNN2kuD03qDkuSNRSI7tdZ/B
        3mmUHViGfsp3l0Wj2SJOzTOgo9C45EHCEDgKGyleL0Xjs1vr8WHrTsLKERvrwJgUyQJa9aw8dVZ
        3TJE89Oc9JBssOUaqVH/JNI6ML5Fwt5E88h4kBef/o6IMGHfp
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr5013808ljk.278.1632825545986;
        Tue, 28 Sep 2021 03:39:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzxuAYZshvl7TpiVeCuaqx5L7VwDkdBKHM/wshS+YVoCc09h2vlkjMDabUci7TaG9DFdHzx8Q==
X-Received: by 2002:a2e:9e03:: with SMTP id e3mr5013796ljk.278.1632825545816;
        Tue, 28 Sep 2021 03:39:05 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q5sm1887551lfn.277.2021.09.28.03.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 03:39:05 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] memory: samsung: describe drivers in KConfig
Date:   Tue, 28 Sep 2021 12:39:03 +0200
Message-Id: <163282553904.34918.6284506509137865249.b4-ty@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210924133406.112174-1-krzysztof.kozlowski@canonical.com>
References: <20210924133406.112174-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 24 Sep 2021 15:34:06 +0200, Krzysztof Kozlowski wrote:
> Rephrase the Kconfig option and make it clear it applies only to Samsung
> SoC.
> 
> 

Applied, thanks!

[1/1] memory: samsung: describe drivers in KConfig
      commit: 6b20a5d173cd5647f0bb1ac8796264b70c377d79

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
