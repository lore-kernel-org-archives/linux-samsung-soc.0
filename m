From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5 RESEND] cpufreq: exynos: Remove unused variable & IS_ERR
Date: Tue, 18 Dec 2012 20:04:45 -0800
Message-ID: <002201cddd9d$fcb42200$f61c6600$@samsung.com>
References: <002701cdd6a7$25fd9270$71f8b750$%choi@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43314 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751367Ab2LSEEu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Dec 2012 23:04:50 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MF900AONFC0GQB0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 13:04:48 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MF900FSAFBYBM50@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Dec 2012 13:04:48 +0900 (KST)
In-reply-to: <002701cdd6a7$25fd9270$71f8b750$%choi@samsung.com>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jaecheol Lee' <jc.lee@samsung.com>, "'Rafael J. Wysocki'" <rjw@sisk.pl>, 'Russell King' <linux@arm.linux.org.uk>

Jonghwan Choi wrote:
> 
> The variable 'max_support_idx, min_support_idx, pm_lock_idx"
> are never used, so remove the unused variable.
> 
> Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> ---

Basically, looks OK to me...

Rafael, are you taking this series in your tree?
Or let me pick into Samsung tree?

- Kukjin
