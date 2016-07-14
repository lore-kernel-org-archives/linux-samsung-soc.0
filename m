From: Nicolas Dufresne <nicolas.dufresne@gmail.com>
Subject: Re: Odroid U2 Kernel 4.7rc7+ Hang on reboot
Date: Thu, 14 Jul 2016 16:22:30 -0400
Message-ID: <1468527750.4843.7.camel@gmail.com>
References: <1468525055.4843.4.camel@ndufresne.ca>
	 <1468525558.4843.6.camel@ndufresne.ca>
Reply-To: nicolas@ndufresne.ca
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:33920 "EHLO
	mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751976AbcGNUWd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 16:22:33 -0400
Received: by mail-qt0-f179.google.com with SMTP id u25so48856256qtb.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Jul 2016 13:22:33 -0700 (PDT)
In-Reply-To: <1468525558.4843.6.camel@ndufresne.ca>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

Le jeudi 14 juillet 2016 =C3=A0 15:45 -0400, Nicolas Dufresne a =C3=A9c=
rit=C2=A0:
> Le jeudi 14 juillet 2016 =C3=A0 15:37 -0400, Nicolas Dufresne a =C3=A9=
crit=C2=A0:
> > Hi,
> >=20
> > I'm using the Odroid U2 to test some features implemented in
> > GStreamer.
> > The parts I need mostly works in mainline kernel, my main annoyance
> > ist
> > that reboot hangs.
> >=20
> > Is this issue known ? I'm booting from SD card is that matters. Any
> > advise would be appreciated. I'm not list member, so please keep me
> > in
> > CC. I'm sharing my .config, in case that is my fault.

As suggested by Javier on IRC, here's the boot log:

http://paste.fedoraproject.org/391219/14685276/
