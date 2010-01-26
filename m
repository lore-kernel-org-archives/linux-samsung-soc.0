From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 1/4] ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
Date: Tue, 26 Jan 2010 14:52:49 +0000
Message-ID: <20100126145249.GD9153@trinity.fluff.org>
References: <b2e8f9f71001221447r7feb098fx2e5b06126c1556da@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40012 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751826Ab0AZOwu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 09:52:50 -0500
Content-Disposition: inline
In-Reply-To: <b2e8f9f71001221447r7feb098fx2e5b06126c1556da@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

On Fri, Jan 22, 2010 at 11:47:08PM +0100, Maurus Cuelenaere wrote:
> ARM: SAMSUNG: Move mach/ts.h to plat/ts.h
> 
> This moves mach-s3c2410/include/mach/ts.h to plat-samsung/include/plat/ts.h in
> order to prepare for s3c64xx support in the touchscreen driver.
> 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>

git rename detection please.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
