From: =?ISO-8859-15?Q?Andreas_F=E4rber?= <afaerber@suse.de>
Subject: Re: [RESEND][PATCHv2 0/3] Fix for buggy u-boot memory banks
Date: Sat, 26 Jul 2014 21:03:56 +0200
Message-ID: <53D3FB9C.9080908@suse.de>
References: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:56857 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753171AbaGZTEA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 26 Jul 2014 15:04:00 -0400
In-Reply-To: <1405443816-29917-1-git-send-email-lauraa@codeaurora.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Laura Abbott <lauraa@codeaurora.org>
Cc: Tushar Behera <trblinux@gmail.com>, Russell King <linux@arm.linux.org.uk>, Kevin Hilman <khilman@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robherring2@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, devicetree@vger.kernel.org

Hi Laura,

Am 15.07.2014 19:03, schrieb Laura Abbott:
> This is a resend of the series to fix the uboot bug exposed by the re=
moval
> of meminfo. I haven't gotten any acks though.
>=20
> Please help with review/acks. Grant/Rob, I'd still like this to go th=
rough
> the devicetree tree if possible.

Sorry for the delay in testing.

With this v2 applied on top of kgene's for-next branch (plus
https://patchwork.kernel.org/patch/4297431/ as build fix) I get:

[    9.699985] Unhandled fault: asynchronous external abort (0x211) at
0x00000000

Same for v1 that had worked okay before, so it's not your series, but i=
t
may explain why you haven't heard on v2 from the others yet.

Regards,
Andreas

--=20
SUSE LINUX Products GmbH, Maxfeldstr. 5, 90409 N=FCrnberg, Germany
GF: Jeff Hawn, Jennifer Guild, Felix Imend=F6rffer; HRB 16746 AG N=FCrn=
berg
