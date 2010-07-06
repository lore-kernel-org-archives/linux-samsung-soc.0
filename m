From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] ARM: S5PV210: Fix on SECTION_SIZE_BITS on
	S5PV210/S5PC110.
Date: Tue, 6 Jul 2010 08:12:45 +0100
Message-ID: <20100706071245.GA5058@n2100.arm.linux.org.uk>
References: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:56382 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753969Ab0GFHNB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 6 Jul 2010 03:13:01 -0400
Content-Disposition: inline
In-Reply-To: <1278391007-11144-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jul 06, 2010 at 01:36:47PM +0900, Kukjin Kim wrote:
> This patch fixes on SECTION_SIZE_BITS for Sparsemem on S5PV210/S5PC110.
> Because smallest size of a bank on S5PV210/S5PC110 is aligned by 16MB.
> So each section's maximum size should be 16MB.

What is the spacing of chunks of memory, and minimum alignment of those
chunks in physical address space?

Also, what is the maximum physical address which memory can be located?
