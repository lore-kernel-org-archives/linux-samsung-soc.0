From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/4] rtc: s3c: add missing clk control
Date: Wed, 12 Aug 2015 09:06:29 +0900
Message-ID: <55CA8E05.1000704@samsung.com>
References: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:15616 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932265AbbHLAGe (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Aug 2015 20:06:34 -0400
In-reply-to: <1439292502-22912-1-git-send-email-jy0922.shim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Joonyoung Shim <jy0922.shim@samsung.com>, rtc-linux@googlegroups.com
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, alexandre.belloni@free-electrons.com, cw00.choi@samsung.com

On 11.08.2015 20:28, Joonyoung Shim wrote:
> It's missed to call clk_unprepare() about info->rtc_src_clk in
> s3c_rtc_remove and to call clk_disable_unprepare about info->rtc_clk in
> error routine of s3c_rtc_probe.
> 
> Signed-off-by: Joonyoung Shim <jy0922.shim@samsung.com>
> ---
>  drivers/rtc/rtc-s3c.c | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
