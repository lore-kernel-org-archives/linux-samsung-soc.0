From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH] rtc: s5m: De-inline large functions to save space
Date: Wed, 24 Feb 2016 00:15:43 +0100
Message-ID: <20160223231543.GE10681@piout.net>
References: <1455588282-7251-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:53999 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751555AbcBWXPq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 23 Feb 2016 18:15:46 -0500
Content-Disposition: inline
In-Reply-To: <1455588282-7251-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, Denys Vlasenko <vda.linux@googlemail.com>

On 16/02/2016 at 11:04:42 +0900, Krzysztof Kozlowski wrote :
> Few functions were marked inline even though they were relatively large
> and sometimes used in multiple places. De-inline them to let the
> compiler decide whether optimization makes sense. This fixes inline_hunt
> report:
> drivers/rtc/rtc-s5m.c: Deinline s5m8767_rtc_set_alarm_reg, save 704 bytes
> drivers/rtc/rtc-s5m.c: Deinline s5m8767_wait_for_udr_update, save 192 bytes
> 
> Reported-by: Denys Vlasenko <vda.linux@googlemail.com>
> Cc: Denys Vlasenko <vda.linux@googlemail.com>
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> ---
>  drivers/rtc/rtc-s5m.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
Applied, thanks.

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
