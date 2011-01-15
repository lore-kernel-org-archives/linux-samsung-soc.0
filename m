From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [GIT PULL] Samsung S5P for 2.6.38 merge window
Date: Sat, 15 Jan 2011 13:29:55 +0000
Message-ID: <20110115132955.GA15996@n2100.arm.linux.org.uk>
References: <021901cbb2e2$ef4a0630$cdde1290$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:52638 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752278Ab1AONaL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Jan 2011 08:30:11 -0500
Content-Disposition: inline
In-Reply-To: <021901cbb2e2$ef4a0630$cdde1290$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 13, 2011 at 02:30:01PM +0900, Kukjin Kim wrote:
> Hi Russell,
> 
> Please pull Samsung S5P updates from:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/kgene/linux-samsung.git
> for-rmk
> 
> These things are for 2.6.38.

This looks very large.  I really considered not merging this due to:

1. possibly conflicts with Lennert's irq_data conversion patches.

2. It's not right to push large quantities of code into mainline towards
   the end of the merge window.  You should have everything prepared
   that you want to send before the merge window opens.

In future, please have your tree ready for merging *before* the merge
window opens and aim to get the bulk in preferably before, at the latest
during the first week.
