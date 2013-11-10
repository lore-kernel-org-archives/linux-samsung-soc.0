From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 2/3] clk: exynos5250: fix sysmmu_mfc{l,r} gate clocks
Date: Sun, 10 Nov 2013 18:08:01 +0100
Message-ID: <2996623.YXg5JqReYS@flatron>
References: <1383905648-23733-1-git-send-email-sachin.kamat@linaro.org> <1383905648-23733-2-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f53.google.com ([74.125.83.53]:65490 "EHLO
	mail-ee0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751416Ab3KJRIC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 10 Nov 2013 12:08:02 -0500
Received: by mail-ee0-f53.google.com with SMTP id e51so1971876eek.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 10 Nov 2013 09:08:01 -0800 (PST)
In-Reply-To: <1383905648-23733-2-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Sachin Kamat <sachin.kamat@linaro.org>, Andrew Bresticker <abrestic@chromium.org>, t.figa@samsung.com, linux-samsung-soc@vger.kernel.org, mturquette@linaro.org

Hi Sachin, Andrew,

On Friday 08 of November 2013 15:44:07 Sachin Kamat wrote:
> From: Andrew Bresticker <abrestic@chromium.org>
> 
> The gate clocks for the MFC sysmmus appear to be flipped, i.e.
> GATE_IP_MFC[2] gates sysmmu_mfcl and GATE_IP_MFC[1] gates sysmmu_mfcr.
> Fix this so that the MFC will start up.

Wow, this means that there is a mistake in the documentation. Not that
I'm surprised, though.

I guess you are sure about this, so:

Reviewed-by: Tomasz Figa <t.figa@samsung.com>

Best regards,
Tomasz
