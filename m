From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 1/2] mfd: max77693: Allow building as a module
Date: Fri, 8 Apr 2016 05:54:45 +0200
Message-ID: <20160408035445.GA9532@kozik-lap>
References: <1459756459-22061-1-git-send-email-k.kozlowski@samsung.com>
 <20160407132947.GB3323@x1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34129 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752046AbcDHDyv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Apr 2016 23:54:51 -0400
Content-Disposition: inline
In-Reply-To: <20160407132947.GB3323@x1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@kernel.org>, Paul Gortmaker <paul.gortmaker@windriver.com>

On Thu, Apr 07, 2016 at 02:29:47PM +0100, Lee Jones wrote:
> On Mon, 04 Apr 2016, Krzysztof Kozlowski wrote:
> 
> > The consumer of max77693 regulators on Trats2 board (samsung-usb2-phy
> > driver) supports deferred probing so the max77693 main MFD driver can be
> > built now as a module. This gives more flexibility and removes manual
> > ordering of init calls.
> > 
> > Suggested-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Cc: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > ---
> >  drivers/mfd/Kconfig    |  4 ++--
> >  drivers/mfd/max77693.c | 14 ++------------
> >  2 files changed, 4 insertions(+), 14 deletions(-)
> 
> I assume this can be taken immediately and doesn't depend on anything
> external to the set?
> 
> For my own reference:
>   Acked-by: Lee Jones <lee.jones@linaro.org>

Hi,

Yes, this can be taken as is. Only second patch (changing defconfig)
depends on this. I can take the second patch through samsung tree but
that would require a tag/branch with this... which looks like an
overkill. So maybe you would take both?

Best regards,
Krzysztof
