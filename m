From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 0/2] rtc: Fix module autoload for max77xx RTC drivers
Date: Thu, 14 May 2015 08:47:13 +0900
Message-ID: <5553E281.2090803@samsung.com>
References: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:22790 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754748AbbEMXrR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 May 2015 19:47:17 -0400
In-reply-to: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Alexandre Belloni <alexandre.belloni@free-electrons.com>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Chanwoo Choi <cw00.choi@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 14.05.2015 00:18, Javier Martinez Canillas wrote:
> Hello Alexandre and Alessandro,
> 
> This is a trivial series that fixes module autoloading for the Maxim
> MAX77686 and MAX77802 RTC drivers that didn't export their platform
> device ID table with MODULE_DEVICE_TABLE() so modalias information
> was not available.
> 
> The series is composed of the following patches:
> 
> Javier Martinez Canillas (2):
>   rtc: max77686: Report platform modalias to fix module autoload
>   rtc: max77802: Report platform modalias to fix module autoload
> 
>  drivers/rtc/rtc-max77686.c | 1 +
>  drivers/rtc/rtc-max77802.c | 1 +
>  2 files changed, 2 insertions(+)

For the patchset:
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
