From: Javi Merino <javi.merino@arm.com>
Subject: Re: [PATCH 1/2] ARM: dts: Disable MDMA1 node for Arndale-octa board
Date: Thu, 6 Mar 2014 10:25:50 +0000 (UTC)
Message-ID: <loom.20140306T102720-85@post.gmane.org>
References: <1394006947-26126-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:46417 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751673AbaCFKpI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 Mar 2014 05:45:08 -0500
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glks-linux-samsung-soc@m.gmane.org>)
	id 1WLVnS-0000QL-PS
	for linux-samsung-soc@vger.kernel.org; Thu, 06 Mar 2014 11:45:03 +0100
Received: from fw-tnat.cambridge.arm.com ([217.140.96.21])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2014 11:45:02 +0100
Received: from javi.merino by fw-tnat.cambridge.arm.com with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Mar 2014 11:45:02 +0100
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

Tushar Behera <tushar.behera <at> linaro.org> writes:

> 
> MDMA1 can support both secure and non-secure AXI transactions. When this
> is enabled in the kernel for boards that run in secure mode, we get
> imprecise external aborts causing the kernel to oops.
> 
> Unhandled fault: imprecise external abort (0x1406) at 0x00000000
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000007
> 
> Suggested-by: Javi Merino <javi.merino@arm.com>
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

I've tested this on top of kgene/for-next (I'm assuming that your patch is
based on that branch) but that tree currently doesn't boot.

If I backport it to v3.14-rc5, the kernel boots.  So:

Tested-by: Javi Merino <javi.merino@arm.com>
