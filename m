From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [GIT PULL] Samsung Clock changes for v3.14
Date: Thu, 09 Jan 2014 20:08:32 +0100
Message-ID: <5724394.ipj3s2zcuB@flatron>
References: <3518820.nAXoIq2LQG@amdc1227> <20140108225943.6098.47795@quantum> <20140109004956.7168.34121@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f170.google.com ([209.85.215.170]:33434 "EHLO
	mail-ea0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752543AbaAITIj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Jan 2014 14:08:39 -0500
Received: by mail-ea0-f170.google.com with SMTP id k10so1672216eaj.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jan 2014 11:08:36 -0800 (PST)
In-Reply-To: <20140109004956.7168.34121@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mike Turquette <mturquette@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>

On Wednesday 08 of January 2014 16:49:56 Mike Turquette wrote:
> Quoting Mike Turquette (2014-01-08 14:59:43)
> > Quoting Tomasz Figa (2014-01-08 14:43:24)
> > > On Wednesday 08 of January 2014 14:07:49 Mike Turquette wrote:
> > > > Quoting Tomasz Figa (2014-01-08 11:13:38)
> > > > > Hi Mike,
> > > > > 
> > > > > Please consider pulling following Samsung Clock changes for v3.14.
> > > > > 
> > > > > The following changes since commit 2bb00c68e094271b79deac993893461cc051b721:
> > > > 
> > > > Hi Tomasz,
> > > > 
> > > > Commit 2bb00c68 is the tip of the Samsung clk fixes that I'm about to
> > > > send out. Can you rebase this request onto the tip of clk-next?
> > > 
> > > I guess I can do it, but wouldn't this introduce merge conflicts, since
> > > some of the fixes are changing the same parts of the code?
> > 
> > Yes it will cause conflicts, but that is sometimes OK.
> > 
> > > 
> > > I based my samsung-next branch on top of your clk-next with my fixes
> > > branch merged, since that's what will end up in Linus' tree anyway. Was it
> > > not the right thing to do?
> > 
> > Well maybe I am missing something, but I think it is not the best thing.
> > The problem is that those patches will sort of be merged twice. Again
> > maybe I am missing something. The same commit IDs will be used so
> > perhaps it is OK...
> > 
> > Part of this trouble is caused by the simple way that I fork clk-next
> > from v3.xx-rc1. Since I never rebase that branch to a more recent -rc
> > then there is a delta between the fixes that go in the queue of patches
> > for the next merge window.
> > 
> > I guess one way that other subsystems handle this is by having something
> > like clk-next-late which is a new branch based on a later -rc.
> > 
> > How awful is the merge conflict resolution?
> 
> Thanks for working this out on IRC. I've taken this pull request into
> clk-next for 3.14.

Great, thanks.

One more thing. Could you update your public tree to let patches get some
wider testing in linux-next before the merge window?

Best regards,
Tomasz
