From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] ARM: plat-samsung: using vsnprintf instead of vsprintf
 for the limit buffer length 256
Date: Tue, 22 Jan 2013 09:00:03 +0800
Message-ID: <50FDE493.1020204@asianux.com>
References: <50FD178E.9090105@asianux.com> <20130121135626.GP1095@trinity.fluff.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:49518 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab3AVA7S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 19:59:18 -0500
In-Reply-To: <20130121135626.GP1095@trinity.fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben@fluff.org>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8821=E6=97=A5 21:56, Ben Dooks =E5=86=99=
=E9=81=93:
> How about: vsnprintf(buff, sizeof(buff), fmt, va);
>=20
> It means we do not end up assuming the size of 'buff' and will be cor=
rect
> if the code is changed to declare 'buff' to be a different size.

  thank you, I will send patch v2.

  :-)

--=20
Chen Gang

Asianux Corporation
