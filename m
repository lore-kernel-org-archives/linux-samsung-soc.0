From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] ARM: S3C24XX: Fix NAND ECC mode for mini2440 board
Date: Mon, 21 Aug 2017 19:52:16 +0200
Message-ID: <20170821175216.gzrpwzdu6qrpm6rk@kozik-lap>
References: <1502915461-8625-1-git-send-email-snawrocki@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:33500 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753926AbdHURwU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Aug 2017 13:52:20 -0400
Received: by mail-wr0-f196.google.com with SMTP id 30so6642191wrk.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 21 Aug 2017 10:52:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1502915461-8625-1-git-send-email-snawrocki@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: snawrocki@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sergio Prado <sergio.prado@e-labworks.com>

On Wed, Aug 16, 2017 at 10:31:01PM +0200, snawrocki@kernel.org wrote:
> From: Sylwester Nawrocki <snawrocki@kernel.org>
> 
> After commit e9f66ae23c "mtd: s3c2410: make ecc mode configurable
> via platform data" booting of the mini2440 board is broken, since
> for this board we have CONFIG_MTD_NAND_S3C2410_HWECC set. The console
> gets flooded with errors reported by the mtd subsystem.
> This patch changes ecc_mode to NAND_ECC_HW which restores proper
> operation of the NAND flash memory.
> 
> Cc: Sergio Prado <sergio.prado@e-labworks.com>
> Fixes: e9f66ae23c "mtd: s3c2410: make ecc mode configurable via platform data"

Thanks, applied for next cycle. Please do not forget about checkpatch -
he would point about wrong format of commit SHA and fixes tag (too short
SHA and missing ()).

Best regards,
Krzysztof
