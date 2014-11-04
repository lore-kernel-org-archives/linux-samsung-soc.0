From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL 2/3 v2] 1st Round of Samsung PM updates for v3.19
Date: Tue, 4 Nov 2014 12:35:02 -0800
Message-ID: <20141104203502.GA3851@quad.lixom.net>
References: <021801cff253$0374fe40$0a5efac0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:64027 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751118AbaKDUfD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Nov 2014 15:35:03 -0500
Received: by mail-pa0-f46.google.com with SMTP id lf10so15008810pab.5
        for <linux-samsung-soc@vger.kernel.org>; Tue, 04 Nov 2014 12:35:02 -0800 (PST)
Content-Disposition: inline
In-Reply-To: <021801cff253$0374fe40$0a5efac0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Kukjin Kim' <kgene@kernel.org>, 'Bartlomiej Zolnierkiewicz' <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, arm@kernel.org, 'Arnd Bergmann' <arnd@arndb.de>, 'Kevin Hilman' <khilman@linaro.org>, linux-arm-kernel@lists.infradead.org

On Tue, Oct 28, 2014 at 11:00:57AM +0900, Kukjin Kim wrote:
> Hi,
> 
> I'm sending new pull-request for tags/samsung-pm-v2 instead of tags/samsung-pm.
> Note that just added "fix build with ARM_CPU_SUSPEND=n" from Arnd, please pull.
> 
> Thanks,
> Kukjin

Kukjin,

The history here is somewhat odd. You've merged in cleanup and dt,
and two merges of pm (one with just the extra fix from Arnd). Are the
merges needed just to avoid merge conflicts? If so, we can resolve that
when we merge here, that's not a problem.

If it's needed because pm doesn't work without the dt branch also being
merged in, then this is not sufficient since when bisecting, you might get
only the pm branch contents and not the dt contents in some circumstances.

So, please confirm which of the cases it is, and resubmit just the bare
pm branch if there are no dependencies.


-Olof
