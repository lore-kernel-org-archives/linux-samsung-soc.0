From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 2/4 v2] hwmon: ntc_thermistor: Use the manufacturer name
 properly
Date: Wed, 25 Jun 2014 07:10:51 -0700
Message-ID: <53AAD86B.6080905@roeck-us.net>
References: <1403677773-21141-1-git-send-email-ch.naveen@samsung.com> <1403677773-21141-3-git-send-email-ch.naveen@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail.active-venture.com ([67.228.131.205]:54667 "EHLO
	mail.active-venture.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754202AbaFYOLD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 10:11:03 -0400
In-Reply-To: <1403677773-21141-3-git-send-email-ch.naveen@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Naveen Krishna Chatradhi <ch.naveen@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-iio@vger.kernel.org
Cc: naveenkrishna.ch@gmail.com, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, cpgs@samsung.com, devicetree@vger.kernel.org, lars@metafoo.de

On 06/24/2014 11:29 PM, Naveen Krishna Chatradhi wrote:
> Murata Manufacturing Co., Ltd is the vendor for
> NTC (Negative Temperature coefficient) based Thermistors.
> But, the driver extensively uses "NTC" as the vendor name.
>
> This patch corrects the vendor name also updates the
> compatibility strings according to the vendor-prefix.txt
>
> Note: Drivers continue to support the previous compatible strings
> but further addition of these compatible strings in device tree
> is deprecated.
>
> Signed-off-by: Naveen Krishna Chatradhi <ch.naveen@samsung.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

Applied.

Guenter
