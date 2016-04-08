From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Fri, 8 Apr 2016 08:17:21 +0100
Message-ID: <20160408071721.GE3323@x1>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
 <20160407132947.GB3323@x1>
 <20160408035445.GA9532@kozik-lap>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:34371 "EHLO
	mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751957AbcDHHR0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Apr 2016 03:17:26 -0400
Received: by mail-wm0-f43.google.com with SMTP id l6so53006230wml.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2016 00:17:25 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160408035445.GA9532@kozik-lap>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Fri, 08 Apr 2016, Krzysztof Kozlowski wrote:

> On Thu, Apr 07, 2016 at 02:29:47PM +0100, Lee Jones wrote:
> > On Mon, 04 Apr 2016, Krzysztof Kozlowski wrote:
> >=20
> > > The consumer of max77693 regulators on Trats2 board (samsung-usb2=
-phy
> > > driver) supports deferred probing so the max77693 main MFD driver=
 can be
> > > built now as a module. This gives more flexibility and removes ma=
nual
> > > ordering of init calls.
> > >=20
> > > Suggested-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > ---
> > >  drivers/mfd/Kconfig    |  4 ++--
> > >  drivers/mfd/max77693.c | 14 ++------------
> > >  2 files changed, 4 insertions(+), 14 deletions(-)
> >=20
> > I assume this can be taken immediately and doesn't depend on anythi=
ng
> > external to the set?
> >=20
> > For my own reference:
> >   Acked-by: Lee Jones <lee.jones@linaro.org>
>=20
> Hi,
>=20
> Yes, this can be taken as is. Only second patch (changing defconfig)
> depends on this. I can take the second patch through samsung tree but
> that would require a tag/branch with this... which looks like an
> overkill. So maybe you would take both?

If I take the defconfig patch without a tag, there will almost
certainly be merge conflicts.  Other solutions include; delaying the
defconfig patch for one cycle or trying to get it in post -rc1.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
