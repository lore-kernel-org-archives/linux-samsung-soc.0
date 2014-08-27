From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH 1/1] regulator: max77802: set opmode to normal if off
 is read from hw
Date: Wed, 27 Aug 2014 20:32:38 +0200
Message-ID: <53FE2446.3040402@gmail.com>
References: <1409053061-22568-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:40200 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753558AbaH0Sco (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 14:32:44 -0400
In-Reply-To: <1409053061-22568-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Mark Brown <broonie@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Yuvaraj Kumar C D <yuvaraj.cd@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

On 26.08.2014 13:37, Javier Martinez Canillas wrote:
> +		/*
> +		 * If the regulator is disabled and the system warm rebooted,
> +		 * the hardware reports OFF as the regulator operating mode.
> +		 * Default to operating mode NORMAL in that case.
> +		 */
> +		if (val == MAX77802_OPMODE_OFF)
> +			max77802->opmode[id] = MAX77802_OPMODE_NORMAL;
> +		else
> +			max77802->opmode[id] = val;

I might be missing something, but I believe I see a flaw here. If after
a cold boot opmode is something else than OFF or NORMAL, the kernel
starts, turns the regulator off and does warm reboot, the setting is
lost and the regulator is switched to NORMAL mode.

Best regards,
Tomasz
