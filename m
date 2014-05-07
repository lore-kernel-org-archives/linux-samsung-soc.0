From: David Miller <davem@davemloft.net>
Subject: Re: [PATCH] net: sxgbe: Added condition for non fix_burst mode
Date: Wed, 07 May 2014 13:06:34 -0400 (EDT)
Message-ID: <20140507.130634.485890706150790821.davem@davemloft.net>
References: <008c01cf69cc$4dcc8e50$e965aaf0$%an@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:50229 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750768AbaEGRGh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 May 2014 13:06:37 -0400
In-Reply-To: <008c01cf69cc$4dcc8e50$e965aaf0$%an@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: bh74.an@samsung.com
Cc: netdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, ks.giri@samsung.com, vipul.pandya@samsung.com


Please start numbering your patches and submit patch sets properly.

You need to provide:

1) A header posting with subject "[PATCH 0/${N}] blah blah blah"
   that describes at a high level what the patch series does.

2) The patches, in the correct order, numbered in the subject
   line in the format "[PATCH X/${N}] ..."

Otherwise I have no idea what order the patches are supposed
to be applied, whether the patches depend upon eachother, and
if so in what way.

I'm not applying these sxgbe patches until you start posting
them properly, thank you.
