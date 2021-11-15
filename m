Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9166DC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:12:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 72D046320D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Nov 2021 13:12:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231573AbhKONPK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Nov 2021 08:15:10 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:59626
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231695AbhKONOd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Nov 2021 08:14:33 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1283C3F1A6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 13:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636981897;
        bh=OJCA5ZvzNWjkD2Sxk8qxrrXGgiPPEZw138MIcH0bp9Q=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version:Content-Type;
        b=PC2LXtaem23MhHl1lwRpm2jNVFAieuZ5u4VRr7mVIgem6fRQDa5NKBjlJ6CFw1wNG
         m6MnTJ1IjBrRL4WFz0zVFeBpS0lArtTox4YT6ZZOK1Q7z56xnX4QXDf/HXli73NiVD
         /f/g+2QxCv7BtDZM4H03W31PuhtXA4ghzF2dKX7KFKe0x8hGoeKJbzOaDpH1N5NxjM
         p06J6bZIBYcI+yVttmOex2+RhG4Wu7RA0OT1VEfjbWTA15GbYKnOE+lBrbI0ZeyP1V
         XpugBozpap82MESz3EZtbum/yYcheTxLlRu++gwXlySFwopYIuLivnhf88n0NIJuPG
         SBY6AljRVY3jA==
Received: by mail-lj1-f199.google.com with SMTP id u28-20020a2ea17c000000b0021126b5cca2so3218727ljl.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Nov 2021 05:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OJCA5ZvzNWjkD2Sxk8qxrrXGgiPPEZw138MIcH0bp9Q=;
        b=mvOBmHQ+oJOd6LMi770PR8K33al6prVkMuJ7lHlTuFEG3PZSSHkKR/KvT0JgFIDZIs
         vNgyn5GbFECkLQf4DHN4sI2/G/KTQ96s0+loBY1IccAuEM3Kv/He6Nno5RI5zS8NduLv
         S6CkWiLoMjzy5/zVwFno8pjnEB1MsGr4iUdX03P6Q/K5YoxCOr9LQCxcBNjy1ndnLH7v
         9VtdujR0PccXDhS1543oaF0l2lKcORM6Rkd6QCWy3CrDwmiXiQ8Bzy8r6OuwZUTJkS0R
         HFIdIMO8fv4D+YGhVMC+BUmnnybjbY0DeEL/HLVIymj7CppTaXyQlFF91G7zaFTSCgP0
         nuZA==
X-Gm-Message-State: AOAM531wpYehza+u7cQePOyKgfpmmDUP7daDYW7CVvrjHW3c4l7Y0fmC
        1cYaKRuwV3vqbex4hOc+lAX4PaIKwojG+4exOJTqrF9uo2o+IvlwVBa2UryiERVzsGkJZFC9Ipf
        vBARR/EoyxEKovoxtMHs1he//0TRM8aQnWd2jyMxg3Djq7uhq
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr37547742ljm.318.1636981896498;
        Mon, 15 Nov 2021 05:11:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdEUnILP/yVPCQGk9Fv6GL+8+eRne9/6CM/DR8GFRq0H4eSeKiYlpJViXXIWwou1uZpuumjA==
X-Received: by 2002:a2e:a4d1:: with SMTP id p17mr37547722ljm.318.1636981896362;
        Mon, 15 Nov 2021 05:11:36 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id p21sm1411254lfa.289.2021.11.15.05.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 05:11:35 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: exynosautov9: drop samsung,ufs-shareability-reg-offset
Date:   Mon, 15 Nov 2021 14:11:31 +0100
Message-Id: <163698188786.128367.112304195355876732.b4-ty@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211102064826.15796-1-chanho61.park@samsung.com>
References: <CGME20211102065208epcas2p2213e346b2c37f315e73a04f511a1037c@epcas2p2.samsung.com> <20211102064826.15796-1-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 2 Nov 2021 15:48:26 +0900, Chanho Park wrote:
> samsung,ufs-shareability-reg-offset is not necessary anymore since it
> was integrated into the second argument of samsung,sysreg.
> 
> 

Applied, thanks!

[1/1] arm64: dts: exynosautov9: drop samsung,ufs-shareability-reg-offset
      commit: 4f5d06d381badc6e16f6d54eac7ab0125e9a7168

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
