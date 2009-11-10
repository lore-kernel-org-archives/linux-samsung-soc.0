From: Harald Welte <laforge@gnumonks.org>
Subject: Re: plat-samsung and other code changes for next merge window
Date: Tue, 10 Nov 2009 10:34:32 +0900
Message-ID: <20091110013432.GA4040@prithivi.gnumonks.org>
References: <20091110002222.GJ4808@trinity.fluff.org> <000801ca61a2$a8f4eb60$fadec220$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:49425 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752940AbZKJBgL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Nov 2009 20:36:11 -0500
Content-Disposition: inline
In-Reply-To: <000801ca61a2$a8f4eb60$fadec220$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: 'Ben Dooks' <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>

Hi all,

On Tue, Nov 10, 2009 at 10:10:57AM +0900, Kukjin Kim wrote:

> Samsung SYS.LSI are creating plat-s5p, and soon will be submitted.

just for the general public: This means that System LSI is currently
porting the s5p6440 code from their 2.6.28 kernel into current mainline,
and will then submit that as patches in the new directory structure.

This is ongoing work but we should see some code soon.

Of course, once the platform device or clock changes are visible in
Ben's tree, the 6440 code will be adopted to follow those changes and be
rebased on that tree.

Regards from Korea,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
