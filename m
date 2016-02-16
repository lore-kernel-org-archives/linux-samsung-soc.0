From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH] rtc: s5m: De-inline large functions to save space
Date: Tue, 16 Feb 2016 11:34:00 -0300
Message-ID: <56C33358.7040807@osg.samsung.com>
References: <1455588282-7251-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:48512 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932530AbcBPOeL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Feb 2016 09:34:11 -0500
In-Reply-To: <1455588282-7251-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com
Cc: Denys Vlasenko <vda.linux@googlemail.com>

Hello Krzysztof,

On 02/15/2016 11:04 PM, Krzysztof Kozlowski wrote:
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

Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
