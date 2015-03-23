From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/2] mfd: sec-core: Modify RTC compatible name of
 S2MPS13
Date: Mon, 23 Mar 2015 12:34:00 +0000
Message-ID: <20150323123400.GD24804@x1>
References: <1426586058-15987-1-git-send-email-k.kozlowski@samsung.com>
 <1426586058-15987-2-git-send-email-k.kozlowski@samsung.com>
 <1426586254.16027.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:35504 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752277AbbCWMeF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Mar 2015 08:34:05 -0400
Received: by webck51 with SMTP id ck51so9751441web.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Mar 2015 05:34:04 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1426586254.16027.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, Alessandro Zummo <a.zummo@towertech.it>, linux-kernel@vger.kernel.org, rtc-linux@googlegroups.com, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>

On Tue, 17 Mar 2015, Krzysztof Kozlowski wrote:

> On wto, 2015-03-17 at 10:54 +0100, Krzysztof Kozlowski wrote:
> > From: Chanwoo Choi <cw00.choi@samsung.com>
> >=20
> > This patch modify the RTC compatible name of S2MPS13 because S2MPS1=
3's RTC is
> > equal to S2MPS14's RTC.
> >=20
> > Cc: Lee Jones <lee.jones@linaro.org>
> > Suggested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
> > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
>=20
> Tested on Exynos5433 board with S2MPS13 PMIC.
> Tested-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
>=20
> I feel like talking to myself with this self-reply... but at least th=
is
> leaves a public track :).

If you are submitting a patch, it is assumed that you tested it
_before_ sending.=20

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
