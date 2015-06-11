From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [GIT PULL] clk/samsung updates for 4.2
Date: Thu, 11 Jun 2015 10:04:08 +0200
Message-ID: <557940F8.2070204@samsung.com>
References: <556F26C3.9080302@samsung.com> <20150603230559.6017.43918@quantum>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13546 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751034AbbFKIEN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jun 2015 04:04:13 -0400
In-reply-to: <20150603230559.6017.43918@quantum>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Michael Turquette <mturquette@linaro.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On 04/06/15 01:05, Michael Turquette wrote:
> One small thing: clk-next isn't considered stable.  I had some stuff in
> there (Stephen's amba assigned-clock-rates patch) which I had to pull
> out (no ACK from maintainer) and it crept back in because this PR was
> based on top of it. No big deal because I caught it when it happened
> (this time).
> 
> In the future I am always happy to take PRs based on -rc1 (or any -rc
> that is already present in clk-next). Of course if you have a dependency
> on stuff already merged in clk-next then just let me know.

All right, sorry for the trouble. I'll keep that in mind and will use
stable tags for future pull request.

-- 
Thanks,
Sylwester
