Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8AA7C433E0
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:12:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5617264E42
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Feb 2021 17:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbhBHRMY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Feb 2021 12:12:24 -0500
Received: from mail.kernel.org ([198.145.29.99]:60942 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231767AbhBHRLV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Feb 2021 12:11:21 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7C93764DF0;
        Mon,  8 Feb 2021 17:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612804240;
        bh=EFHJFjVlW7evNX3AmpfrjZnumtm01qN8iH1oLl7Cyts=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=cs76pZATQeltceNZvhiytkk3S5AklTO+dEuTUwsQTr/8lzGv5NIqra33YPmJXYWx8
         UsvUKsvjEsPnGQHQ1lKyuNkHPw57fyHRFOKQi4xiLKNZFaX0Ooa/UgFiC2TF5AjhwU
         3BjSUQvv+uhDJKbxsx+tRht+cicgdH5PwNYYk57fvycOH2VHvCoDTH7/eXo/utBSbE
         /wtrc/xb0ZJ9h5Em99VVEgNAXCLzJbO8wPspEmyVA0wirwajJJWWw2ySA8lZufNxc+
         Af9IfoCAjyh9RVo3Qoxhl9d05RrRRreyDFwBBhCZoJWoO05WT2ePLuvXB8ztKCWEka
         ZiyWCy64gx06w==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        linux-kernel@vger.kernel.org
Cc:     kernel test robot <lkp@intel.com>, Arnd Bergmann <arnd@arndb.de>
Subject: Re: (subset) [PATCH 1/2] ARM: s3c: irq-s3c24xx: include headers for missing declarations
Date:   Mon,  8 Feb 2021 18:10:35 +0100
Message-Id: <161280423197.2959.139633168233746502.b4-ty@kernel.org>
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

[2/2] ARM: s3c: irq-s3c24xx: staticize local functions
      commit: f503878564f5e68c1aeb1ea01e437060bf905c50

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
