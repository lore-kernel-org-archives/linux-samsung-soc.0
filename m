From: Harald Welte <laforge@gnumonks.org>
Subject: Re: [PATCH 01/17] ARM: MM: use 64bytes of L1 cache on plat S5PC1xx
Date: Fri, 6 Nov 2009 11:32:23 +0900
Message-ID: <20091106023222.GF3913@prithivi.gnumonks.org>
References: <1255421482-26455-1-git-send-email-m.szyprowski@samsung.com> <1255421482-26455-2-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60357 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755102AbZKFDdE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2009 22:33:04 -0500
Content-Disposition: inline
In-Reply-To: <1255421482-26455-2-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Hi Marek,

> Samsung S5PC1xx SoCs are Coretex8 based, so use 64 bytes of L1 cache
> line instead of the default 32 bytes.

this is an obvious fix, and I'd recommend Ben should merge it asap (if he
didn't already)
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
