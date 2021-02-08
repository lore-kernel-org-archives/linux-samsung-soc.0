Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A137C433DB
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 465C264E42
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232160AbhBHRMy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:12:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:60862 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233881AbhBHRKu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 12:10:50 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7D03364E42;
        Mon,  8 Feb 2021 17:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612804209;
        bh=7uUo3YXFXC5nIVh3LILzTBFaX9nJh+b3T5BtdbM4i2M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kuyutIsJgH8w6TgZ05o7oIfPDh+ARPFyLROTO01tzSYu05dfKIto9bXp7+vz+BrMd
         bumh+c2VM+w5Jmumq93nolSRvipGpBMUFpFNXoqiRxXHC+AhheC7rtPXkRXVHJ12/p
         FsaSgtkf/YzmRNZ/y1XGiZN20s1BPkH8VX6qf4kYFun0jTJuBSq+cPmdmmfaR4MZEp
         Qk1nX1dLyu775WF43T1iE12XN0mCfP7gid0/zKSAuGdA8bl1hXEic9y8tsuSi8gAjx
         WBtCZVuVoHpTcQJb7CNbleDo5wd+IKo0+vlp1HXSIWIixwwdAhN85VCJ/5Kpu8dLUI
         y8VojSyrv9AGQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH 1/2] ARM: s3c: irq-s3c24xx: include headers for missing declarations
Date:   Mon,  8 Feb 2021 18:10:04 +0100
Message-Id: <161280419391.2772.5165098009561753713.b4-ty@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210206133615.119804-1-krzk@kernel.org>
References: <20210206133615.119804-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sat, 6 Feb 2021 14:36:14 +0100, Krzysztof Kozlowski wrote:
> Include headers to fix W=1 build warnings:
> 
>   arch/arm/mach-s3c/irq-s3c24xx.c:389:5: warning:
>     no previous prototype for ‘s3c24xx_set_fiq’ [-Wmissing-prototypes]
>   arch/arm/mach-s3c/irq-s3c24xx.c:683:13: warning:
>     no previous prototype for ‘s3c2410_init_irq’ [-Wmissing-prototypes]

Applied, thanks!

[1/2] ARM: s3c: irq-s3c24xx: include headers for missing declarations
      commit: 49dc85ca3c78d938d9eb41e05efcd85c92626e84

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
