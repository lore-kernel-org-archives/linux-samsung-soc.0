From: Chen Gang <gang.chen@asianux.com>
Subject: Re: [PATCH] ARM: plat-samsung: using vsnprintf instead of vsprintf
 for the limit buffer length 256
Date: Tue, 22 Jan 2013 09:00:50 +0800
Message-ID: <50FDE4C2.1010208@asianux.com>
References: <50FD178E.9090105@asianux.com> <20130121160008.GO23505@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from intranet.asianux.com ([58.214.24.6]:5920 "EHLO
	intranet.asianux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751569Ab3AVBAD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 21 Jan 2013 20:00:03 -0500
In-Reply-To: <20130121160008.GO23505@n2100.arm.linux.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

=E4=BA=8E 2013=E5=B9=B401=E6=9C=8822=E6=97=A5 00:00, Russell King - ARM=
 Linux =E5=86=99=E9=81=93:
> sizeof(buff) would be better here so that it depends on the actual bu=
ffer
> size.

  thank you, I will send patch v2.

  :-)

--=20
Chen Gang

Asianux Corporation
