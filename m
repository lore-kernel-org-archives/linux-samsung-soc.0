From: Harald Welte <laforge@gnumonks.org>
Subject: When to post patches to this list or upstream
Date: Fri, 6 Nov 2009 11:29:27 +0900
Message-ID: <20091106022927.GE3913@prithivi.gnumonks.org>
References: <1257323264-18363-1-git-send-email-jassisinghbrar@gmail.com> <20091104110512.GB25044@sirena.org.uk> <1b68c6790911040414jced4bf1i8852a9ce84c3ddf5@mail.gmail.com> <20091104140310.GB27652@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:60329 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751536AbZKFDdD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Nov 2009 22:33:03 -0500
Content-Disposition: inline
In-Reply-To: <20091104140310.GB27652@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, jassi brar <jassisinghbrar@gmail.com>, Jassi Brar <jassi.brar@samsung.com>

Dear all,

On Wed, Nov 04, 2009 at 02:03:11PM +0000, Mark Brown wrote:
 
> > One of the purposes of this list was to catch trivial mistakes in the
> > patches before they are sent upstream for maintainer review. That should help
> > save maintainers time and keep them 'receptive' to samsung's patches.
> 
> Speaking as one of these upstreams it's not surprising to see issues in
> submissions, especially where the drivers are from people who are not
> regular contributors to the subsystem.  Like I say, there are some
> things where a lot of cleanup is required where not posting does make
> sense but much of the code that is being posted is of a perfectly
> reasonable standard.  For example, even with posting initially to this
> list the first response wasn't raising fundamental issues so there
> should be no reason not to have moved upstream with the second round.

I agree.  So we should define the following rule:

* trivial fixes such as a single-line bugfix should always go upstram
  directly

* entirely new patchsets / drivers should first be sent to this list,
  receive some comment/feedback.  Second and further submission should be
  upstream

After some more time / experience, the quality of the patches should be higher
and thus we can eliminate the need to first post to this list altogether.

Regards,
	Harald.
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
