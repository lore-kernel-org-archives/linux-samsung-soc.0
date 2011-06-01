From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/3] Fixes for breakage resulting from syscore_ops patch
 =?iso-8859-1?q?on=09s3c24xx?=
Date: Wed, 1 Jun 2011 14:45:55 +0200
Message-ID: <201106011445.59798.heiko@sntech.de>
References: <201106011348.47145.heiko@sntech.de> <4DE62CEF.80507@embtoolkit.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:35843 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754525Ab1FAMqQ convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jun 2011 08:46:16 -0400
In-Reply-To: <4DE62CEF.80507@embtoolkit.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Abdoulaye Walsimou GAYE <awg@embtoolkit.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, rjw@sisk.pl, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>

Am Mittwoch 01 Juni 2011 schrieb Abdoulaye Walsimou GAYE:
> Heiko St=FCbner wrote:
> > The syscore_ops patch from Rafael J. Wysocki introduced some small
> > glitches for the S3C24XX cpus resulting in compile errors.
>=20
> I submitted same patches days ago [1],
> [1]
> http://thread.gmane.org/gmane.linux.ports.arm.kernel/117812/focus=3D1=
17814

irq-pm.c also was my initial target for s3c24xx_irq_syscore_ops, but it=
's only=20
compiled when CONFIG_PM is set, where s3c24xx_irq_syscore_ops is always=
 needed=20
and its member-functions are set to null in pm.h when CONFIG_PM is not =
set

Heiko
