From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [GIT PULL 2/5] Samsung cleanup-s3c24xx for v3.9
Date: Tue, 05 Feb 2013 16:54:28 -0800
Message-ID: <14ef01ce0404$87e51280$97af3780$@samsung.com>
References: <120c01ce0331$389e43a0$a9dacae0$@samsung.com>
 <20130206001532.GA28722@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31022 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753729Ab3BFAyq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Feb 2013 19:54:46 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHR00KPHX6X0270@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 09:54:45 +0900 (KST)
Received: from visitor4lab ([105.128.18.157])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MHR0043AX752S70@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 09:54:45 +0900 (KST)
In-reply-to: <20130206001532.GA28722@quad.lixom.net>
Content-language: en-us
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Olof Johansson' <olof@lixom.net>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Olof Johansson wrote:
> 
> On Mon, Feb 04, 2013 at 03:41:55PM -0800, Kukjin Kim wrote:
> > Hi Arnd and Olof,
> >
> > Here is 2nd cleanup for Samsung S3C24XX stuff and based on previous
> > pull-request branch, 'next/cleanup-header'.
> > Basically, this patch merges mach-s3c2410, mach-s3c2412 and mach-s3c2440
> > into mach-s3c24xx.
> >
> > Note, this is 2nd pull request and first is 'next/cleanup-header'
branch.
> > If any problems, please let me know.
> 
> Hi,
> 
Hi,

> So, your first pull request didn't contain a "1/5", so it's hard to match
them
> up.
> 
Could be, sorry for that.

> Also, see how the word wrapping looks below? I wonder if you run your "git
> request-pull" in a terminal window that is wider than 80 characters, and
then
> copy-and-paste it over? That doesn't work well. (I suspect you do since
your
> git URL is always wrapped too :( )
> 
Yeah, I know...sigh, it's hard to me how to avoid wrapped git URL...anyway
let me check it more closely from now on.

> Finally, would you mind starting to use signed tags with branch
descriptions,

Hmm, I see...but unfortunately, I can't use signed tag in my office, because
I can't use my own laptop in my office due to company security. Let me find
the way but probably need more time to use it.

> or at least give a short overview of the branches in the pull requests?
> 
OK, let me add it next time.

So you want to re-send this pull request? Even though I'm not sure how I can
cover your ask except a short overview...

Thanks.

- Kukjin
