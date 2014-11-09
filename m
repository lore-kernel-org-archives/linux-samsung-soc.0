From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3 v2] 1st Round of Samsung PM updates for v3.19
Date: Sat, 8 Nov 2014 16:05:00 -0800
Message-ID: <20141109000500.GA11947@quad.lixom.net>
References: <021801cff253$0374fe40$0a5efac0$@samsung.com>
 <20141104203502.GA3851@quad.lixom.net>
 <015101cff88f$e5790880$b06b1980$@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f180.google.com ([209.85.192.180]:40620 "EHLO
	mail-pd0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752682AbaKIAFD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Nov 2014 19:05:03 -0500
Received: by mail-pd0-f180.google.com with SMTP id ft15so5514511pdb.39
        for <linux-samsung-soc@vger.kernel.org>; Sat, 08 Nov 2014 16:05:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <015101cff88f$e5790880$b06b1980$@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org

On Wed, Nov 05, 2014 at 09:31:49AM +0900, Kukjin Kim wrote:
> Olof Johansson wrote:
> > On Tue, Oct 28, 2014 at 11:00:57AM +0900, Kukjin Kim wrote:
> > > Hi,
> > >
> Hi,
> 
> > > I'm sending new pull-request for tags/samsung-pm-v2 instead of tags/samsung-pm.
> > > Note that just added "fix build with ARM_CPU_SUSPEND=n" from Arnd, please pull.
> > >
> > > Thanks,
> > > Kukjin
> > 
> > Kukjin,
> > 
> > The history here is somewhat odd. You've merged in cleanup and dt,
> > and two merges of pm (one with just the extra fix from Arnd). Are the
> > merges needed just to avoid merge conflicts? If so, we can resolve that
> > when we merge here, that's not a problem.
> > 
> Oops, probably I did 'checkout for-next' in my tree when I tagged
> tags/samsung-pm-v2 :(
> 
> > If it's needed because pm doesn't work without the dt branch also being
> > merged in, then this is not sufficient since when bisecting, you might get
> > only the pm branch contents and not the dt contents in some circumstances.
> > 
> > So, please confirm which of the cases it is, and resubmit just the bare
> > pm branch if there are no dependencies.
> > 
> Can you please merge branch v3.19-next/pm-samsung-2 instead?
> If you don't want to merge just branch, I'll re-send with new tag.
> 
> Sorry for the inconvenience.

Hi,

I've merged the branch into next/soc now.


-Olof
