From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 1/4] rtc: s3c: add missing clk control
Date: Fri, 21 Aug 2015 01:06:50 +0200
Message-ID: <20150820230650.GC3769@piout.net>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:48966 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751699AbbHTXGv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Aug 2015 19:06:51 -0400
Content-Disposition: inline
In-Reply-To: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, cw00.choi@samsung.com, k.kozlowski@samsung.com

On 11/08/2015 at 20:28:19 +0900, Joonyoung Shim wrote :
> It's missed to call clk_unprepare() about info->rtc_src_clk in
> s3c_rtc_remove and to call clk_disable_unprepare about info->rtc_clk in
> error routine of s3c_rtc_probe.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
