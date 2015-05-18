From: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Subject: Re: [PATCH 0/2] rtc: Fix module autoload for max77xx RTC drivers
Date: Tue, 19 May 2015 00:45:34 +0200
Message-ID: <20150518224534.GZ3338@piout.net>
References: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:42455 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1754349AbbERWpg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 May 2015 18:45:36 -0400
Content-Disposition: inline
In-Reply-To: <1431530282-10672-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Cc: Alessandro Zummo <a.zummo@towertech.it>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 13/05/2015 at 17:18:00 +0200, Javier Martinez Canillas wrote :
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

Both applied, thanks.

>  drivers/rtc/rtc-max77686.c | 1 +
>  drivers/rtc/rtc-max77802.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> Best regards,
> Javier
> 

-- 
Alexandre Belloni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
