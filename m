From: Kevin Hilman <khilman@kernel.org>
Subject: Re: [PATCH] hwmon: (ina2xx) Add ina231 compatible string
Date: Wed, 14 Jan 2015 17:30:15 -0800
Message-ID: <7hppagq194.fsf@deeprootsystems.com>
References: <1421279852-27965-1-git-send-email-khilman@kernel.org>
	<20150115005642.GA31033@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f45.google.com ([209.85.220.45]:37870 "EHLO
	mail-pa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751354AbbAOBaS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 20:30:18 -0500
Received: by mail-pa0-f45.google.com with SMTP id lf10so14131985pab.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Jan 2015 17:30:18 -0800 (PST)
In-Reply-To: <20150115005642.GA31033@roeck-us.net> (Guenter Roeck's message of
	"Wed, 14 Jan 2015 16:56:42 -0800")
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: lm-sensors@lm-sensors.org, linux-samsung-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, open list <linux-kernel@vger.kernel.org>

Guenter Roeck <linux@roeck-us.net> writes:

> On Wed, Jan 14, 2015 at 03:57:32PM -0800, Kevin Hilman wrote:
>> From: Kevin Hilman <khilman@linaro.org>
>> 
>> Add support for "ina231" as compatible string.
>> 
>> Tested with the Exynos5422-based odroid-xu3 board which has on-board
>> INA231 sensors.
>> 
>> Signed-off-by: Kevin Hilman <khilman@linaro.org>
>
> Hi Kevin,
>
> can you also update Documentation/hwmon/ina2xx and Documentation/hwmon/Kconfig ?
>

Sure... coming right up.

Kevin
