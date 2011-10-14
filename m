From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 0/8] S3C2416: Enable armdiv and armclk
Date: Fri, 14 Oct 2011 09:27:17 +0200
Message-ID: <201110140927.18860.heiko@sntech.de>
References: <201109281217.33813.heiko@sntech.de> <085f01cc8a40$df7af8a0$9e70e9e0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from h1778886.stratoserver.net ([85.214.133.74]:41325 "EHLO
	h1778886.stratoserver.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751326Ab1JNH1b convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 Oct 2011 03:27:31 -0400
In-Reply-To: <085f01cc8a40$df7af8a0$9e70e9e0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: 'Ben Dooks' <ben-linux@fluff.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Kgene,

Am Freitag, 14. Oktober 2011, 09:14:11 schrieb Kukjin Kim:
> Heiko St=FCbner wrote:
[...]
> > Heiko Stuebner (8):
> >   S3C2416: Add armdiv_mask constant.
[...]
> As a note, if required, 1st patch which is fixing will be sent to sta=
ble.

I don't think this is really necessary.

The original code was essentially correct but hard to read.
The constant makes sense in the rework, as the armdiv_mask is is used i=
n more=20
places now and not contained in a single static function.

Heiko
