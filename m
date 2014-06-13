From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/1] ARM: EXYNOS: Fix compilation warning
Date: Fri, 13 Jun 2014 16:52:03 +0200
Message-ID: <201406131652.03461.arnd@arndb.de>
References: <1399282008-9738-1-git-send-email-sachin.kamat@linaro.org> <CAK9yfHyFEb3hchLLndfqW1xOHD59d_bsFMA4k5MLJ8Hgpx7Ekw@mail.gmail.com> <537D6F12.7000201@linaro.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.131]:52846 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751298AbaFMOwv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Jun 2014 10:52:51 -0400
In-Reply-To: <537D6F12.7000201@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: Tushar Behera <tushar.behera@linaro.org>, Sachin Kamat <sachin.kamat@linaro.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, "robh+dt@kernel.org" <robh+dt@kernel.org>, Rob Herring <robh@kernel.org>

On Thursday 22 May 2014, Tushar Behera wrote:
> On 05/21/2014 04:56 PM, Sachin Kamat wrote:
> > On 5 May 2014 14:56, Sachin Kamat <sachin.kamat@linaro.org> wrote:
> >> of_get_flat_dt_prop return type is now const.
> >> Fixes the following compilation warning introduced by commit 9d0c4=
dfedd96
> >> ("of/fdt: update of_get_flat_dt_prop in prep for libfdt")
> >>
> >> arch/arm/mach-exynos/exynos.c:259:6: warning:
> >> assignment discards =91const=92 qualifier from pointer target type=
 [enabled by default]
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> Cc: Rob Herring <robh@kernel.org>
> >> ---
>=20
> Change looks good.
>=20
> Reviewed-by: Tushar Behera <tushar.behera@linaro.org>

This hasn't shown up in linux-next yet, and hte bug is still there, so =
I'm applying
it directly to the fixes branch in arm-soc before we get more people se=
nding
the same patch. Thanks!

	Arnd
