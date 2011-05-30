From: Santosh Shilimkar <santosh.shilimkar@ti.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Fix secondary CPU boot after wake-up
Date: Mon, 30 May 2011 15:08:17 +0530
Message-ID: <4DE36589.4080709@ti.com>
References: <1306746781-21511-1-git-send-email-inderpal.s@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from na3sys009aog115.obsmtp.com ([74.125.149.238]:45297 "EHLO
	na3sys009aog115.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754783Ab1E3JiZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 May 2011 05:38:25 -0400
Received: by ywp31 with SMTP id 31so1506200ywp.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 30 May 2011 02:38:23 -0700 (PDT)
In-Reply-To: <1306746781-21511-1-git-send-email-inderpal.s@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inderpal Singh <inderpal.singh@linaro.org>, Russell King <linux@arm.linux.org.uk>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Inderpal Singh <inderpal.s@samsung.com>, kgene.kim@samsung.com, samsung@lists.linaro.org, patches@linaro.org

On 5/30/2011 2:43 PM, Inderpal Singh wrote:
[...]

> 2. Fix to remove the "Unknown IPI message 0x1" message when
>     secondary CPU boots.
>
For this one you are avoiding a wakeup IPI and rather
relying on schedule IPI. That just avoiding the issue.

This doesn't seems to be right. Refer below thread.

http://www.spinics.net/lists/arm-kernel/msg110886.html

Russell,
When do you plan to fix the SGI usage as discussed
in above thread. I thought SGI1 usage was ok for OMAP,
realview/versatile and MSM.

Regards
Santosh
