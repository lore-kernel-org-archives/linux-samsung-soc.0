Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF626C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 16:01:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E2E220825
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Dec 2020 16:01:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbgL2QA6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 29 Dec 2020 11:00:58 -0500
Received: from mail.kernel.org ([198.145.29.99]:51384 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726400AbgL2QA6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 29 Dec 2020 11:00:58 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AD9820825;
        Tue, 29 Dec 2020 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609257617;
        bh=UY0F8C8PXD2aQqC7MeA07K0MtYI+wxDDyEtyC7Wf4uc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=XH0AD38XRStsu59+r8+Sk6e6ZpIPWEcDRIdLEmL5igS48EcX3aTEMxd47dJUTwZmV
         0yWpr1+bVKsVXne54tSVUPZqvAa0T04Nbw3XuOdfnlCD575Q7u50GYmGGSn8G5j0/0
         gbAhlxf8JAQu5xcEO9FEqvYRtGtXrVW7EV+xHxSWjkc9ffCGjKQ+O+jX/KTOyJyvK9
         jmzwMoO2FCXdTwqqd+nd7BwCEjFrpLBbMHHPBNxihNJ6yP/1OVfXzauDixzEuh4Lwu
         Wj3ZMlM9ZZK5fS1XqVepxrKWmU9CuvjaVQ6TxVQIi+nEsTyiRA++wXS82uFZzjT426
         KO2cm0C302nTg==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Bongsu Jeon <bongsu.jeon@samsung.com>
Subject: Re: (subset) [PATCH] arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2
Date:   Tue, 29 Dec 2020 17:00:05 +0100
Message-Id: <160925760099.16829.11304554114761168205.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201210211859.215047-1-krzk@kernel.org>
References: <20201210211859.215047-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Thu, 10 Dec 2020 22:18:58 +0100, Krzysztof Kozlowski wrote:
> The S3FWRN5 datasheet describe the interrupt line as rising edge.  The
> current configuration as level high, could cause spurious interrupts.

Applied, thanks!

[1/1] arm64: dts: exynos: correct S3FWRN5 NFC interrupt trigger level on TM2
      commit: d497d07b74f05f01b9c8c85b6679c2df57ecbdb4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
