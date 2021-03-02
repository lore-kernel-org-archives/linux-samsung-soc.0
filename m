Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DBBC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 01:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EB82264FAB
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  3 Mar 2021 01:19:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233784AbhCCBGm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Mar 2021 20:06:42 -0500
Received: from mail.kernel.org ([198.145.29.99]:59214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237822AbhCBIve (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Mar 2021 03:51:34 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 706FA64D74;
        Tue,  2 Mar 2021 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614675000;
        bh=6PoieO/F7Ojbr986NziQvCx9nZ2RQqG2B6Pv7rnWSYo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FcppgVb7+T8LZSLKxYQdiRHnwCU7u+YKQ3DLgxamn/ln27zAQuNyuuZ2eUlwV93ra
         0b8c13ZFVhkXSgv3Mynbd76PcUMlDDWqb3U2rpVKVvQO00vd3QZLSmF6fWSj15yH8e
         8so+pbU8mG1rNXKCRD2e0MBi+gAmhXaxzOo4pOMy5+1Z5NzLMK8WUrBj+z87KWfQEQ
         4xqN7zthF3J9SlbiCmQT1+wo/h7Kr5A9KO2++BGU52uDEdb74d+q5zqssIfU6SRR+c
         48yppTfYDk7S48RTySonvuNRt6IZsNLm4I53pTSRpwPHUI11FhQJvEGEHnVFDkoCR/
         DAKbpbo6s/JTA==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>
Subject: Re: (subset) [PATCH] arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
Date:   Tue,  2 Mar 2021 09:49:55 +0100
Message-Id: <161467498711.12416.4141430353786896586.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210212163729.69882-1-krzk@kernel.org>
References: <20210212163729.69882-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 12 Feb 2021 17:37:29 +0100, Krzysztof Kozlowski wrote:
> The dtschema expects pclk (APB clock) followed by aclk (AXI/AHB clock):
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml:
>     slim-sss@11140000: clock-names:0: 'pclk' was expected
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml:
>     slim-sss@11140000: clock-names:1: 'aclk' was expected

Applied, thanks!

[1/1] arm64: dts: exynos: re-order Slim SSS clocks to match dtschema
      commit: 38f80dec08fe2b8101ae7401d2b44e4247aed8bf

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
