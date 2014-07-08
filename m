From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFC PATCH 2/3] clk: samsung: register restart notifiers for
 s3c2412 and s3c2443
Date: Tue, 8 Jul 2014 09:23:18 -0700
Message-ID: <20140708162318.GB9157@roeck-us.net>
References: <1531376.ijR0PPyvmJ@diego>
 <1436436.XH2jFxzQOf@diego>
 <53BBFF22.10904@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:54812 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753774AbaGHQXW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Jul 2014 12:23:22 -0400
Content-Disposition: inline
In-Reply-To: <53BBFF22.10904@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, linux-watchdog@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Wim Van Sebroeck <wim@iguana.be>, linux-samsung-soc@vger.kernel.org, Mike Turquette <mturquette@linaro.org>

On Tue, Jul 08, 2014 at 04:24:34PM +0200, Tomasz Figa wrote:
> Hi Heiko,
>=20
> On 06.07.2014 20:43, Heiko St=FCbner wrote:
> > S3C2412, S3C2443 and their derivatives contain a special software-r=
eset
> > register in their system-controller.
> >=20
> > Therefore register a restart-notifier for those.
>=20
> I wonder if we really need to differentiate between these SoCs instea=
d
> of just using the watchdog reset for all of them. If there is no reas=
on
> to prefer software reset, then some code could be removed and things
> would be more unified.
>=20
Depends if the other method is always available. If not, it might make =
sense
to register this handler with lower priority to have a fallback.

Guenter
