From: Will Deacon <will.deacon@arm.com>
Subject: Re: ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined
Date: Tue, 23 Oct 2012 15:57:37 +0100
Message-ID: <20121023145737.GB2823@mudshark.cambridge.arm.com>
References: <022101cdb12d$724e9650$56ebc2f0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:61507 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932821Ab2JWO5r (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Oct 2012 10:57:47 -0400
Content-Disposition: inline
In-Reply-To: <022101cdb12d$724e9650$56ebc2f0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On Tue, Oct 23, 2012 at 03:48:21PM +0100, Kukjin Kim wrote:
> Hi all,
> 
> Now, v3.7-rc2 happens following build error with s3c2410_defconfig...
> 
> ERROR: "read_current_timer" [fs/ext4/ext4.ko] undefined!
> make[2]: *** [__modpost] Error 1
> make[1]: *** [modules] Error 2
> make[1]: *** Waiting for unfinished jobs....
> 
> Any idea on this?

A fix for this is queued in rmk's fixes branch.

Will
