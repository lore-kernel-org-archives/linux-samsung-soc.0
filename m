Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B33FCCA483
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  6 Jun 2022 09:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232792AbiFFJWx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 6 Jun 2022 05:22:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232725AbiFFJWu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 6 Jun 2022 05:22:50 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B0F69FD3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  6 Jun 2022 02:22:42 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id q1so27712566ejz.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 06 Jun 2022 02:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JqtWeEQKAyLIP2/98Ttwv6T30datGU+YAR3EojHJrjc=;
        b=gh8SP0B56tK55fkDwDtsEqUOs816PiM4pE2NZBLc1MKJ5706cAJkmSNvA/NKT30Qym
         BfWUUrnR1EFaA2yfvMvR6XmwUJDbWeArbvBfyCt8evYDeVHC92IQ6YGFpKTprMWW3JhH
         lTrE8N2yrMZqZQfJq2My6nwyyXBdTwWQgJ7WOmmqKXoIX9Qe+UTbm3XFychgCtQgjy9C
         Wk2m2wTY6rH0t51krgjmS4nPT9f2KKKC1/XE2Wx4fwiXCojF0YJGN7VhKHOyX13h3uvw
         1w7e7d2MSwZlyy0CA38d1zFLkKv650TXte/SSBHaPfciXkCobeUJdd5sODd2jSI6cbDO
         u4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JqtWeEQKAyLIP2/98Ttwv6T30datGU+YAR3EojHJrjc=;
        b=7SkJPA2rU8NSxIXomD31UA6B8TmLRFR4ykfcT/PINFQqnvW6CfAzZbtKKXDiH0eI39
         5tfWiswa4A1BxFdDbKrdBSH0g9K0q77lEcgdHyBx/eFz7JJw4ADk0/d7+cA3Y1QwBszd
         MinDn6DNYVRZI2ETH4Sf/jRgB2LyxZVg2sZTV5qhPpGFw4CVyc7Afk4gkHt3c2opwWy+
         k8IONrQCodwJ/SpFZTyji4J4JwUsYGkxxpLxDHYfjayryxfC/sRNwHLD57QI/eTjBANv
         EavT5sQLVHEtT/yGHL0RVZPK+pgQZe8rBFlEsouZDqmdrhVnv00GB+lfIpowvDHxq/N7
         AqXg==
X-Gm-Message-State: AOAM530AEDGqk6q/76Wy9Qojgum1qI8HyW/biHKpC3MV8pub0YhoVJIb
        RDkwB1M+o1RkyNBs7qU0v+5iYg==
X-Google-Smtp-Source: ABdhPJwU/8nLUVXuCHLhj9hAeCYNSkHcpMEim0pJONc0svKFdc3XRAfGTfMb2ThpAOZCq/UjQXuvtg==
X-Received: by 2002:a17:907:80ca:b0:70f:77fd:cfbd with SMTP id io10-20020a17090780ca00b0070f77fdcfbdmr12773270ejc.82.1654507361290;
        Mon, 06 Jun 2022 02:22:41 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id u21-20020a1709064ad500b006f3ef214e14sm5956397ejt.122.2022.06.06.02.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 02:22:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: (subset) [PATCH v2 3/3] arm64: dts: exynosautov9: add watchdog DT nodes
Date:   Mon,  6 Jun 2022 11:22:32 +0200
Message-Id: <165450734050.62970.13414382645959767225.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523113919.59571-4-chanho61.park@samsung.com>
References: <20220523113919.59571-1-chanho61.park@samsung.com> <CGME20220523113901epcas2p2ff6ea3954cbd5c3450798a359ab363fe@epcas2p2.samsung.com> <20220523113919.59571-4-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 23 May 2022 20:39:19 +0900, Chanho Park wrote:
> Adds two cpu watchdog devices for ExynosAutov9 SoC.
> 
> 

Applied, thanks!

[3/3] arm64: dts: exynosautov9: add watchdog DT nodes
      https://git.kernel.org/krzk/linux/c/d742e8e2912131ee2df1fe217a6c9e6ee8337b4a

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
