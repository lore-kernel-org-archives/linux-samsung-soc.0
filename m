From: Dave Jones <davej@redhat.com>
Subject: Re: [PATCH] [CPUFREQ] s5pv210-cpufreq.c: Add missing clk_put
Date: Mon, 6 Jun 2011 22:09:15 -0400
Message-ID: <20110607020915.GB25438@redhat.com>
References: <1307411942-20711-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:32366 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754406Ab1FGCJb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 6 Jun 2011 22:09:31 -0400
Content-Disposition: inline
In-Reply-To: <1307411942-20711-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Julia Lawall <julia@diku.dk>

On Mon, Jun 06, 2011 at 06:59:02PM -0700, Kukjin Kim wrote:

 > Hi Dave,
 > 
 > Could you please pick this up in your tree?
 > 
 >  drivers/cpufreq/s5pv210-cpufreq.c |   25 +++++++++++++++++--------
 >  1 files changed, 17 insertions(+), 8 deletions(-)

applied and pushed, thanks.

	Dave
