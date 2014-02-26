From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH V2 0/2] Add support for clocks in S5M8767
Date: Wed, 26 Feb 2014 13:11:50 -0800
Message-ID: <20140226211150.12081.99155@quantum>
References: <1392791076-28301-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f48.google.com ([209.85.220.48]:44025 "EHLO
	mail-pa0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752192AbaBZVLy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Feb 2014 16:11:54 -0500
Received: by mail-pa0-f48.google.com with SMTP id kx10so1499270pab.21
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Feb 2014 13:11:54 -0800 (PST)
In-Reply-To: <1392791076-28301-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

Quoting Tushar Behera (2014-02-18 22:24:34)
> S5M8767 chip has 3 crystal oscillators which are operated in the same
> as the crystal oscillators in S2MPS11. Extend s2mps11-clk driver to
> support clocks in S5M8767.
> 
> The patches are rebased on top of next-20130218.

These changes look good to me. Will these get picked up as part of a
Samsung clk pull request or would you prefer that I pick them
individually?

Regards,
Mike

> 
> Tushar Behera (2):
>   clk: clk-s2mps11: Refactor for including support for other MFD clocks
>   clk: clk-s2mps11: Add support for clocks in S5M8767 MFD
> 
>  drivers/clk/Kconfig       |    6 ++++--
>  drivers/clk/clk-s2mps11.c |   25 +++++++++++++++++++++----
>  2 files changed, 25 insertions(+), 6 deletions(-)
> 
> -- 
> 1.7.9.5
> 
