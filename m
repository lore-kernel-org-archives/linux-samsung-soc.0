From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [RFC PATCH 2/3] clk: samsung: register restart notifiers for
 s3c2412 and s3c2443
Date: Tue, 08 Jul 2014 16:24:34 +0200
Message-ID: <53BBFF22.10904@samsung.com>
References: <1531376.ijR0PPyvmJ@diego> <1436436.XH2jFxzQOf@diego>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:27235 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752212AbaGHOZJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 10:25:09 -0400
In-reply-to: <1436436.XH2jFxzQOf@diego>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@iguana.be>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

Hi Heiko,

On 06.07.2014 20:43, Heiko St=FCbner wrote:
> S3C2412, S3C2443 and their derivatives contain a special software-res=
et
> register in their system-controller.
>=20
> Therefore register a restart-notifier for those.

I wonder if we really need to differentiate between these SoCs instead
of just using the watchdog reset for all of them. If there is no reason
to prefer software reset, then some code could be removed and things
would be more unified.

Best regards,
Tomasz
