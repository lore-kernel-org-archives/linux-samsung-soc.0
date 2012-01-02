From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 12/12] ARM: restart: S3C24XX: use new restart hook
Date: Mon, 2 Jan 2012 13:26:31 +0000
Message-ID: <20120102132631.GC18443@sirena.org.uk>
References: <1324385316-6052-1-git-send-email-kgene.kim@samsung.com>
 <201112201418.07935.heiko@sntech.de>
 <4EF08F02.9010604@samsung.com>
 <201201021414.17551.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:48571 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752606Ab2ABN0h (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 08:26:37 -0500
Content-Disposition: inline
In-Reply-To: <201201021414.17551.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko St?bner <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Mon, Jan 02, 2012 at 02:14:16PM +0100, Heiko St?bner wrote:

> Therefore I'm introducing a new s3c2443-pm-common.c. Question now is, should 
> this move directly to plat-samsung?

If it's s3c2443 specific I'd expect it'd end up in the relevant mach
directory?
