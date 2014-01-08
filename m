From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH v2 0/8] clk: max77686: Clock provider implementation fixes
Date: Wed, 08 Jan 2014 23:03:41 +0100
Message-ID: <37553582.HRugZGVjUL@flatron>
References: <1386864441-19561-1-git-send-email-t.figa@samsung.com> <4160932.uvjJSNcuKL@amdc1227> <20140108215432.27803.3120@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f179.google.com ([209.85.215.179]:54795 "EHLO
	mail-ea0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753532AbaAHWDq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 8 Jan 2014 17:03:46 -0500
In-Reply-To: <20140108215432.27803.3120@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Mike Turquette <mturquette@linaro.org>, Tomasz Figa <t.figa@samsung.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Samuel Ortiz <sameo@linux.intel.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Lee Jones <lee.jones@linaro.org>

On Wednesday 08 of January 2014 13:54:32 Mike Turquette wrote:
> Quoting Tomasz Figa (2014-01-08 10:04:57)
> > On Wednesday 08 of January 2014 09:59:39 Mike Turquette wrote:
> > > Quoting Lee Jones (2014-01-08 09:15:44)
> > > > > I believe Lee has already applied this one, but in future, to avoid such
> > > > > confusion, if it's more convenient for you, I can send you any clock
> > > > > series as pull requests.
> > > > 
> > > > Me? I haven't applied any clk patches.
> > > 
> > > I have taken patches 1-7 into clk-next just now.
> > 
> > Thanks.
> > 
> > > I can take patch #8 as
> > > well but it would probably be better to send it through arm-soc?
> > 
> > Hmm, patch 8 is trivial enough to not cause any merge conflicts, but since
> > it's unlikely that any users depending on introduced changes will show up
> > for 3.14 it shouldn't really matter which tree it goes through...
> 
> In the absence of any strong opinion on the topic I have taken patch #8
> into clk-next for 3.14.

Great, thanks.

Best regards,
Tomasz
