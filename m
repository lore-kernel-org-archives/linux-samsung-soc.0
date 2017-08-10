From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 2/3] clk: samsung: Add CLK_SET_RATE_PARENT to some AUDSS
 CLK CON clocks
Date: Thu, 10 Aug 2017 10:55:32 +0200
Message-ID: <05c5b174-054d-0f6d-84a4-2355cb07053c@samsung.com>
References: <1500655004-29816-1-git-send-email-s.nawrocki@samsung.com>
        <CGME20170721163751epcas1p2fd6ba68507923b767c043b38249535e8@epcas1p2.samsung.com>
        <1500655004-29816-2-git-send-email-s.nawrocki@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:48222 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751456AbdHJIzo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2017 04:55:44 -0400
In-reply-to: <1500655004-29816-2-git-send-email-s.nawrocki@samsung.com>
Content-language: en-GB
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, cw00.choi@samsung.com, krzk@kernel.org, linux-samsung-soc@vger.kernel.org, b.zolnierkie@samsung.com, linux-kernel@vger.kernel.org

On 07/21/2017 06:36 PM, Sylwester Nawrocki wrote:
> This allows clk rate propagation up to the clock tree so EPLL
> can be reprogrammed indirectly when setting rate of the Audio
> Subsystem clocks.
> The advantage is that sound machine driver can operate only
> on the leaf clocks rather than explicitly re-configuring
> the root clock (EPLL).
> 
> Signed-off-by: Sylwester Nawrocki<s.nawrocki@samsung.com>

I've applied patches 1..3 to my tree.
