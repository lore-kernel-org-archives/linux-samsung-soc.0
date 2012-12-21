From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/5 RESEND] cpufreq: exynos: Remove unused variable & IS_ERR
Date: Fri, 21 Dec 2012 15:13:20 -0800
Message-ID: <009701cddfd0$c62900e0$527b02a0$@samsung.com>
References: <002701cdd6a7$25fd9270$71f8b750$%choi@samsung.com>
 <002201cddd9d$fcb42200$f61c6600$@samsung.com>
 <1484988.Q8kjeUgMrE@vostro.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17894 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751593Ab2LUXN0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 21 Dec 2012 18:13:26 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFE0042ILUC6J10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 08:13:24 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFE00DOOLUAV490@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 22 Dec 2012 08:13:24 +0900 (KST)
In-reply-to: <1484988.Q8kjeUgMrE@vostro.rjw.lan>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'Rafael J. Wysocki'" <rjw@sisk.pl>
Cc: 'Jonghwan Choi' <jhbird.choi@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Jaecheol Lee' <jc.lee@samsung.com>, 'Russell King' <linux@arm.linux.org.uk>

Rafael J. Wysocki wrote:
> 
> On Tuesday, December 18, 2012 08:04:45 PM Kukjin Kim wrote:
> > Jonghwan Choi wrote:
> > >
> > > The variable 'max_support_idx, min_support_idx, pm_lock_idx"
> > > are never used, so remove the unused variable.
> > >
> > > Signed-off-by: Jonghwan Choi <jhbird.choi@samsung.com>
> > > ---
> >
> > Basically, looks OK to me...
> >
> > Rafael, are you taking this series in your tree?
> > Or let me pick into Samsung tree?
> 
> Please take it to the Samsung tree, if that's not a problem.
> 
OK, let me pick this up.

> I generally prefer driver changes to go through platform trees where they
> can
> get more testing coverage.
> 
Yes, if any problems, let you know.

Thanks.

- Kukjin
