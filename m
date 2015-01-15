From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (ina2xx) Add ina231 compatible string
Date: Wed, 14 Jan 2015 16:56:42 -0800
Message-ID: <20150115005642.GA31033@roeck-us.net>
References: <1421279852-27965-1-git-send-email-khilman@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:38227 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751079AbbAOA5f (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Jan 2015 19:57:35 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YBYkh-0012MX-8r
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Jan 2015 00:57:35 +0000
Content-Disposition: inline
In-Reply-To: <1421279852-27965-1-git-send-email-khilman@kernel.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kevin Hilman <khilman@kernel.org>
Cc: lm-sensors@lm-sensors.org, linux-samsung-soc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>, open list <linux-kernel@vger.kernel.org>

On Wed, Jan 14, 2015 at 03:57:32PM -0800, Kevin Hilman wrote:
> From: Kevin Hilman <khilman@linaro.org>
> 
> Add support for "ina231" as compatible string.
> 
> Tested with the Exynos5422-based odroid-xu3 board which has on-board
> INA231 sensors.
> 
> Signed-off-by: Kevin Hilman <khilman@linaro.org>

Hi Kevin,

can you also update Documentation/hwmon/ina2xx and Documentation/hwmon/Kconfig ?

Thanks,
Guenter
