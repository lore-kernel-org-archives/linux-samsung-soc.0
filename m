From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v4 6/6] hwmon: pwm-fan: Update the duty cycle inorder
 to control the pwm-fan
Date: Sun, 12 Apr 2015 16:00:23 -0700
Message-ID: <552AF907.5000600@roeck-us.net>
References: <1428864251-31780-1-git-send-email-linux.amoon@gmail.com> <1428864251-31780-7-git-send-email-linux.amoon@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:56359 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751832AbbDLXA1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 12 Apr 2015 19:00:27 -0400
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YhQra-000dYk-3m
	for linux-samsung-soc@vger.kernel.org; Sun, 12 Apr 2015 23:00:27 +0000
In-Reply-To: <1428864251-31780-7-git-send-email-linux.amoon@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>, Eduardo Valentin <edubezval@gmail.com>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, Markus Reichl <m.reichl@fivetechno.de>, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On 04/12/2015 11:44 AM, Anand Moon wrote:
> pwm_config() must be called with a duty cycle of 0 prior to calling
> pwm_disable() to ensure that the pwm signal is set to low.
>
> Changes since v1 : None.
> Changes since v2 : None
> Changes since v3 : Simplify the comment.
>
> Reported-by: Markus Reichl <m.reichl@fivetechno.de>
> Tested-by: Markus Reichl <m.reichl@fivetechno.de>
> Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>
> Reviewed-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>

Applied to hwmon-next (after removing the changelog from
the commit message).

Thanks,
Guenter
