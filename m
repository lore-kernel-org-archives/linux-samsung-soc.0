From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH][RESEND] ARM: SAMSUNG: make SAMSUNG_PM_DEBUG select DEBUG_LL
Date: Thu, 12 Apr 2012 14:11:54 +0200
Message-ID: <201204121411.55054.heiko@sntech.de>
References: <201203202120.45806.heiko@sntech.de> <4F6B398A.8040703@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from s15407518.onlinehome-server.info ([82.165.136.167]:39410 "EHLO
	s15407518.onlinehome-server.info" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1757492Ab2DLMMI convert rfc822-to-8bit
	(ORCPT <rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Apr 2012 08:12:08 -0400
In-Reply-To: <4F6B398A.8040703@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Maurus Cuelenaere <mcuelenaere@gmail.com>

Am Donnerstag, 22. M=E4rz 2012, 15:39:06 schrieb Kukjin Kim:
> On 03/20/12 13:20, Heiko St=FCbner wrote:
> > From: Maurus Cuelenaere<mcuelenaere@gmail.com>
> >=20
> > When selecting SAMSUNG_PM_DEBUG, it complains about a missing
> > printascii() function if you do not select DEBUG_LL, so make the fo=
rmer
> > select the latter.
> >=20
> > Signed-off-by: Maurus Cuelenaere<mcuelenaere@gmail.com>
> > Acked-by: Heiko Stuebner<heiko@sntech.de>
> > ---
> > This was originally sent in september 2010, but seems to have been
> > forgotten. As this problem has bitten me today, here it is again.
>=20
> Yeah, missed. Looks good to me and will apply.

thanks, but it seems I can't find it in the linux-samsung git currently=
=2E

Any news on this?

Thanks
Heiko
