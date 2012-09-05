From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH] ARM: Samsung: Remove unused code for the clocks debug-fs
 interface
Date: Wed, 05 Sep 2012 21:42:23 +0200
Message-ID: <5047AB1F.8020308@gmail.com>
References: <1346603823-14422-1-git-send-email-sylvester.nawrocki@gmail.com> <227c01cd8aee$638ee0d0$2aaca270$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f46.google.com ([209.85.214.46]:62026 "EHLO
	mail-bk0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754756Ab2IETm2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 5 Sep 2012 15:42:28 -0400
Received: by bkwj10 with SMTP id j10so450853bkw.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Sep 2012 12:42:26 -0700 (PDT)
In-Reply-To: <227c01cd8aee$638ee0d0$2aaca270$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: thomas.abraham@linaro.org, amit.daniel@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, jhbird.choi@samsung.com, arve@android.com

On 09/05/2012 12:41 AM, Kukjin Kim wrote:
> Yeah, could be. BTW, following will fix it on Samsung platforms?

Yes, that might be better. I tried something similar but thought
it might not be worth to invest in a dead horse.. Anyway, since
converting all Samsung platforms is expected to take some time
(also all this out of tree code) probably better to apply this
fix now, before we have an alternative solution.

I noticed the most of clocks hove now reported wrong "rate" value
in this debugs-fs tree, due to not calling get_rate when needed.
It's not really important though (looks like it's by design).

--

Regards,
Sylwester
