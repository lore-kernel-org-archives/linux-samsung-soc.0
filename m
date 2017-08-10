From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: clk-samsung tree inlcusion in linux-next
Date: Fri, 11 Aug 2017 07:45:25 +1000
Message-ID: <20170811074525.7e138e70@canb.auug.org.au>
References: <CGME20170810100736epcas1p16ccddf710bcddf5d6ac219b7fe54a381@epcas1p1.samsung.com>
        <f3b6710c-f3e5-97c0-795d-09ceeee8de92@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:35633 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751487AbdHJVp2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2017 17:45:28 -0400
In-Reply-To: <f3b6710c-f3e5-97c0-795d-09ceeee8de92@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette <mturquette@baylibre.com>

Hi Sylwester,

On Thu, 10 Aug 2017 12:07:31 +0200 Sylwester Nawrocki <s.nawrocki@samsung.com> wrote:
>
> I'd like to ask for inclusion of this (clk-samsung) tree in linux-next:
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git for-next
> 
> It will contain Samsung SoC clock controller related patches.

Added from today.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window. 

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and 
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

-- 
Cheers,
Stephen Rothwell 
sfr@canb.auug.org.au
