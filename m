From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: Revised patches for PCM Controller driver
Date: Wed, 4 Nov 2009 14:03:11 +0000
Message-ID: <20091104140310.GB27652@rakim.wolfsonmicro.main>
References: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com>
 <20091104110512.GB25044@sirena.org.uk>
 <1b68c6790911040414jced4bf1i8852a9ce84c3ddf5@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:48360 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1756070AbZKDODH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Nov 2009 09:03:07 -0500
Content-Disposition: inline
In-Reply-To: <1b68c6790911040414jced4bf1i8852a9ce84c3ddf5@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jassi brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Wed, Nov 04, 2009 at 09:14:45PM +0900, jassi brar wrote:

> One of the purposes of this list was to catch trivial mistakes in the
> patches before they are sent upstream for maintainer review. That should help
> save maintainers time and keep them 'receptive' to samsung's patches.

Speaking as one of these upstreams it's not surprising to see issues in
submissions, especially where the drivers are from people who are not
regular contributors to the subsystem.  Like I say, there are some
things where a lot of cleanup is required where not posting does make
sense but much of the code that is being posted is of a perfectly
reasonable standard.  For example, even with posting initially to this
list the first response wasn't raising fundamental issues so there
should be no reason not to have moved upstream with the second round.

Some of the other SoCs have followed an approach similar to this one -
it tends to cause bad experiences with code never getting merged and
with developers becoming reluctant to work with the general kernel
community since they become used to the platform-specific environment
which gives limited subsystem-specific feedback.

> Second purpose being peer review withing samsung.

Sure, and it does make sense to also send the patches to this list when
submitting upstream - it's also useful for people outside Samsung to
keep up to speed on all the latest kernel support for their boards.  I
think it's a really good idea to have the list and keep it in the loop
like that.
