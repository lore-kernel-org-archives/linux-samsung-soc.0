From: Sergey Lapin <slapin@ossfans.org>
Subject: Re: [PATCH] S3C24XX DMA resume regression fix
Date: Fri, 20 Jan 2012 06:49:02 -0500
Message-ID: <20120120114902.GB22732@build.ihdev.net>
References: <1326462444-10567-1-git-send-email-dron0gus@gmail.com>
 <4F11F911.7030609@ru.mvista.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from slapinbuild.ihdev.net ([46.4.202.25]:43023 "EHLO
	build.ossfans.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751733Ab2ATLzp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Jan 2012 06:55:45 -0500
Content-Disposition: inline
In-Reply-To: <4F11F911.7030609@ru.mvista.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sergei Shtylyov <sshtylyov@ru.mvista.com>
Cc: Gusakov Andrey <dron0gus@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, Ben Dooks <ben-linux@fluff.org>

On Sun, Jan 15, 2012 at 01:52:17AM +0400, Sergei Shtylyov wrote:
> Hello.
> 
> On 13-01-2012 17:47, Gusakov Andrey wrote:
> 
> >In commit bb072c3cf21d1c9a5a2eeb5a00679ee7bf39675b suspend/resume
> 
>    Please also specify that commit's summary in parens.

Could you please point me in direction of patch submission
guide where that is explained.

The commit message summary is
ARM / Samsung: Use struct syscore_ops for "core" power management

But that is not revert of that commit, so I don't really
see a point. This is bug fix which fixes resume code path.

Thanks a lot,
S.
