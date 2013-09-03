From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [RFC Patch v2 0/3] add temporary parent migration support
Date: Wed, 04 Sep 2013 00:36:50 +0200
Message-ID: <3927125.3UOplv4uU5@localhost>
References: <1378208072-10173-1-git-send-email-chander.kashyap@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f44.google.com ([74.125.83.44]:50955 "EHLO
	mail-ee0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754287Ab3ICWgz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Sep 2013 18:36:55 -0400
Received: by mail-ee0-f44.google.com with SMTP id b47so3323788eek.31
        for <linux-samsung-soc@vger.kernel.org>; Tue, 03 Sep 2013 15:36:54 -0700 (PDT)
In-Reply-To: <1378208072-10173-1-git-send-email-chander.kashyap@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Chander Kashyap <chander.kashyap@linaro.org>, thomas.abraham@linaro.org, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Chander,

On Tuesday 03 of September 2013 17:04:28 Chander Kashyap wrote:
> Some platform has provision to change cpu parent clock during
> cpu frequency scaling. This patch series provides a mechanism to
> implement the same using CCF.
> 
> Patch1 provides mechanism to migrate to new parent temporarily.
> 
> Patch2 updates the user of clk_register_mux and DEFINE_CLK_MUX which are
> modified to add support for clk migration.
> 
> Patch3 adds support to Exynos5250 to use the clock parent migration
> feature implemented in CCF.

I don't really like this approach. A need to change mux setting 
temporarily is heavily platform-specific and I don't think it should be 
handled by generic code. First of all there are many factor that you would 
have to account for to make this solution generic, such as:
 - board specific alternative parents,
 - exact moment of parent change,
 - some other platform specific conditions, like CPU voltage that must be 
changed when mux is changed, because it changes CPU frequency,
 - and probably a lot of more factors that only people working with all 
the platforms supported (and unsupported yet) by Linux.

I can see at least two solutions for this problem that don't require 
changing core code of common clock framework:

1) Implementing a special clock type using normal mux ops, but also 
registering a notifier for its PRE_RATE_CHANGE and POST_RATE_CHANGE events 
to perform parent switching.

2) Using normal mux clock, but registering such notifiers in clock 
controller or cpufreq driver.

Best regards,
Tomasz
