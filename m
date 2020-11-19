Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 270F9C56201
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 21:19:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D33B422256
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 19 Nov 2020 21:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726154AbgKSVTV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 19 Nov 2020 16:19:21 -0500
Received: from mslow2.mail.gandi.net ([217.70.178.242]:55020 "EHLO
        mslow2.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgKSVTU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 19 Nov 2020 16:19:20 -0500
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
        by mslow2.mail.gandi.net (Postfix) with ESMTP id 586783A19A7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2020 21:08:28 +0000 (UTC)
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
        (Authenticated sender: miquel.raynal@bootlin.com)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id EFA8DC0004;
        Thu, 19 Nov 2020 21:08:03 +0000 (UTC)
From:   Miquel Raynal <miquel.raynal@bootlin.com>
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-samsung-soc@vger.kernel.org,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Richard Weinberger <richard@nod.at>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Ben Dooks <ben@simtec.co.uk>, Kukjin Kim <kgene@kernel.org>,
        linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 17/23] mtd: rawnand: s3c2410: Add documentation for 2 missing struct members
Date:   Thu, 19 Nov 2020 22:08:02 +0100
Message-Id: <20201119210802.25564-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201109182206.3037326-18-lee.jones@linaro.org>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 281e05f636ff307c6e4e36b669a1578aa1c7fbb9
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Mon, 2020-11-09 at 18:22:00 UTC, Lee Jones wrote:
> Correct 'controller' typo while we're at it.
> 
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'controller' not described in 's3c2410_nand_info'
>  drivers/mtd/nand/raw/s3c2410.c:172: warning: Function parameter or member 'freq_transition' not described in 's3c2410_nand_info'
> 
> Cc: Miquel Raynal <miquel.raynal@bootlin.com>
> Cc: Richard Weinberger <richard@nod.at>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Ben Dooks <ben@simtec.co.uk>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel
