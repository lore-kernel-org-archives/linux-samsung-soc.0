From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 00/13] ARM: S5P64X0: Add new S5P6450 Support
Date: Wed, 1 Sep 2010 12:45:18 +0100
Message-ID: <20100901114518.GA20737@trinity.fluff.org>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:44890 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751972Ab0IALpZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 07:45:25 -0400
Content-Disposition: inline
In-Reply-To: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Sep 01, 2010 at 04:09:07PM +0900, Kukjin Kim wrote:
> This patches add basic support for Samsung S5P6450 SoC.
> 
> Basically this patch moves mach-s5p6440 (ARCH_S5P6440) to mach-s5p64x0
> (ARCH_S5P64X0) to support Samsung's new S5P6450 SoC. The ARCH_S5P64X0
> can support S5P6440 and S5P6450 with one kernel image. It is tested on
> SMDK6440(S5P6440) and SMDK6450(S5P6450) with s5p64x0_defconfig. And
> this patch changes s5p6440_defconfig to s5p64x0_defconfig for S5P64X0.

What about the s5p6442?

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
