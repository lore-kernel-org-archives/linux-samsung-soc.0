From: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] mtd: s3c2410: Move to
 clk_prepare_enable/clk_disable_unprepare
Date: Wed, 2 Jul 2014 17:26:41 -0700
Message-ID: <20140703002641.GP3599@ld-irv-0074>
References: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:48815 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751754AbaGCA0p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 2 Jul 2014 20:26:45 -0400
Received: by mail-pd0-f182.google.com with SMTP id y13so12745209pdi.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jul 2014 17:26:44 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1404155536-3032-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-mtd@lists.infradead.org

On Mon, Jun 30, 2014 at 10:12:16PM +0300, Vasily Khoruzhick wrote:
> Use clk_prepare_enable/clk_disable_unprepare to make the driver
> work properly with common clock framework.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>

Pushed to l2-mtd.git. Thanks!

Brian
