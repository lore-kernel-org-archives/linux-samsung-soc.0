From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S5PV210: Set 1000ns as PWM backlight period on
 SMDKV210
Date: Fri, 9 Dec 2011 03:54:01 +0000
Message-ID: <20111209035401.GA25601@sirena.org.uk>
References: <1320804636-19950-1-git-send-email-jg1.han@samsung.com>
 <03e701ccb4b0$d1279de0$7376d9a0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:59464 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752379Ab1LIDyD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Dec 2011 22:54:03 -0500
Content-Disposition: inline
In-Reply-To: <03e701ccb4b0$d1279de0$7376d9a0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Jingoo Han' <jg1.han@samsung.com>, linux-samsung-soc@vger.kernel.org

On Wed, Dec 07, 2011 at 04:21:20PM +0900, Kukjin Kim wrote:

> If switch frequency is 1kHz, the value of pwm_period_ns should be 1000000 at
> mach-crag6410.c not 100000?

I guess so, please go ahead and make the change - we can always revert
if it doesn't work.
