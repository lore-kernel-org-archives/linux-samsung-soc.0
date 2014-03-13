From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH V2 RE-SEND 0/7] add new Samsung SXGbE driver
Date: Thu, 13 Mar 2014 16:09:47 -0400 (EDT)
Message-ID: <20140313.160947.1309757358549172711.davem@davemloft.net>
References: <007901cf3e89$37d632e0$a78298a0$%an@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:56054 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753085AbaCMUJt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 16:09:49 -0400
In-Reply-To: <007901cf3e89$37d632e0$a78298a0$%an@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ilho215.lee@samsung.com

From: Byungho An <bh74.an@samsung.com>
Date: Thu, 13 Mar 2014 15:55:28 +0900

> This is 2nd posting for Samsung SXGbE driver and just re-sending because of
> line wrapping in previous posting.
> 
> Changes since v1:
> - changed name of driver to SXGbE as per Ben's comment
> - squashed Joe's neatening for many stuff in original patches

I'm mostly happy with this driver, but all of those module parameters
have to be removed except for 'debug'.

They duplicate functionality provided by ethtool.

Module parameters are strongly, if not completely, discouraged.  A
suitable generic configuration mechanism, such as ethtool, should
always be used instead.
