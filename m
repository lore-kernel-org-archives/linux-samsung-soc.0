From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2 05/17] ARM: exynos: cpuidle: Move some code inside the
 idle_finisher
Date: Fri, 04 Apr 2014 17:29:08 +0200
Message-ID: <5398599.7JJndGtXvQ@amdc1032>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
 <1396618989-2897-6-git-send-email-daniel.lezcano@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20582 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752998AbaDDP3b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 11:29:31 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3I00ASCJ17XU20@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 05 Apr 2014 00:29:31 +0900 (KST)
In-reply-to: <1396618989-2897-6-git-send-email-daniel.lezcano@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, t.figa@samsung.com, linaro-kernel@lists.linaro.org, rjw@rjwysocki.net

On Friday, April 04, 2014 03:42:57 PM Daniel Lezcano wrote:
> Move the code around to differentiate different section of code and prepare it
> to be factored out in the next patches.
> 
> The call order changed but hat doesn't have a side effect because they are
> independent. The important call is cpu_do_idle() which must be done the last.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>

Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
