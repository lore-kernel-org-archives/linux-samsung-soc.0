From: Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH 13/17] ata: pata_samsung_cf: removes s5pc100 related ata
 codes
Date: Mon, 30 Jun 2014 10:49:12 -0400
Message-ID: <20140630144912.GE14807@htj.dyndns.org>
References: <1404163947-3105-1-git-send-email-kgene.kim@samsung.com>
 <1404163947-3105-14-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qg0-f53.google.com ([209.85.192.53]:42013 "EHLO
	mail-qg0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751264AbaF3OtP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Jun 2014 10:49:15 -0400
Received: by mail-qg0-f53.google.com with SMTP id i50so2041522qgf.26
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 Jun 2014 07:49:14 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1404163947-3105-14-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Tue, Jul 01, 2014 at 06:32:23AM +0900, Kukjin Kim wrote:
> This patch removes support for s5pc100 ata because of no more support
> S5PC100 SoC in mainline.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Tejun Heo <tj@kernel.org>

Applied to libata/for-3.17.

Thanks.

-- 
tejun
