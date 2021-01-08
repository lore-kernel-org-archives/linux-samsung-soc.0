Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D7BDC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Jan 2021 17:12:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDA7F22E02
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Jan 2021 17:12:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbhAHRL4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Jan 2021 12:11:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:49802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727118AbhAHRL4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Jan 2021 12:11:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2220222E02;
        Fri,  8 Jan 2021 17:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610125876;
        bh=O8Jj0E2Gix3QcpU/BCY9Uf8hcbZbG5qRLMVt2212s9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=HjZZF7Er4MBIRTyWuEiSQe0w2Cf+MxYfrsdJGkqhTVvwEeLyM7PTZ1tBTgFTKdEJE
         7XSCGjdZdVAWmIuU99kfbFtmLN9x6N9QZwlRnoQNNAZkm6uVRC/iDPW7G89wRssjDJ
         nEta94jq1u4TKjA/qtglcGcWk/jo8k74R3DBXfOuykk+KJiHKcCyaH0klrZ4G999pp
         1iUPqO7/8uqsZWS/l+lz730bM17bRFaLdS4fW03UJK9bduV37ZQN1WByjinHtQFSWz
         ucemqHlw/VtK8+27sO5RqJyowWBbvcOwajReZofgyK1CAoTsp+NIwgyq9ifO3MzMWb
         xD5uHFJt8V4dg==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH] soc: samsung: exynos-chipid: correct helpers __init annotation
Date:   Fri,  8 Jan 2021 18:11:10 +0100
Message-Id: <161012586381.12469.7110956465883090487.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105174440.120041-1-krzk@kernel.org>
References: <20210105174440.120041-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 5 Jan 2021 18:44:40 +0100, Krzysztof Kozlowski wrote:
> After converting to builtin driver, the probe function should not call
> __init functions anymore:
> 
>   >> WARNING: modpost: vmlinux.o(.text+0x8884d4):
>     Section mismatch in reference from the function exynos_chipid_probe() to the function .init.text:product_id_to_soc_id()

Applied, thanks!

[1/1] soc: samsung: exynos-chipid: correct helpers __init annotation
      commit: 6166174afc2bc74ca550af388508384b57d5163d

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
