From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 1/3] clk: s2mps11: Add support for S2MPS14 clocks
Date: Thu, 20 Mar 2014 09:33:35 -0700
Message-ID: <20140320163335.21989.2611@quantum>
References: <1395047958-17953-1-git-send-email-k.kozlowski@samsung.com>
 <1395047958-17953-2-git-send-email-k.kozlowski@samsung.com>
 <20140319001643.30995.46947@quantum> <1395215408.18730.2.camel@AMDC1943>
 <20140319191117.30995.13715@quantum> <1395319557.22979.1.camel@AMDC1943>
 <20140320134219.GB6816@lee--X1>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:43888 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756041AbaCTQdm convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 20 Mar 2014 12:33:42 -0400
Received: by mail-pa0-f46.google.com with SMTP id kp14so1174509pab.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Mar 2014 09:33:42 -0700 (PDT)
In-Reply-To: <20140320134219.GB6816@lee--X1>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>

Quoting Lee Jones (2014-03-20 06:42:19)
> > > > > > This patch adds support for S2MPS14 PMIC clocks (BT and AP)=
 to the
> > > > > > s2mps11 clock driver.
> > > > > >=20
> > > > > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com=
>
> > > > > > Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > > > > > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > > > >=20
> > > > > This does not apply cleanly to to clk tree trip, nor does it =
compile
> > > > > after manually merging due to changes introducing
> > > > > linux/mfd/samsung/s2mps14.h.
> > > > >=20
> > > > > The changes look OK to me so maybe Lee can take it with my Ac=
k?
> > > > >=20
> > > > > Acked-by: Mike Turquette <mturquette@linaro.org>
> > > > >=20
> > > >=20
> > > > Hi,
> > > >=20
> > > > Thanks for the Ack. The patch depends on Tushar Behera's patche=
s:
> > > >  - [PATCH V2 0/2] Add support for clocks in S5M8767
> > > >    http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27264
> > > > which are waiting for some time. Both patchsets should be pulle=
d
> > > > together.
> > >=20
> > > I took those patches in yesterday. So we have three options:
> >=20
> > Great! Thanks.
> >=20
> > >=20
> > > 1) MFD tree can pull a stable commit from the clk tree. I'm happy=
 to
> > > make a topic branch for this. Then these patches can be applied.
> > >=20
> > > 2) clk tree can pull a stable commit from the mfd tree if the mfd=
 folks
> > > can provide one.
> > >=20
> > > 3) Wait until after the merge window to apply this one to the clk=
 tree.
> > > I don't currently plan to send 2 PRs during the merge window, so =
this
> > > could either go in 3.16 or maybe into 3.15 if a split PR is sent.
> >=20
> > Dear Lee,
> >=20
> > How do you wish to proceed? The patchset depends on changes in sec-=
core
> > MFD driver.
>=20
> The MFD tree is betting pretty complicated with sec-core stuff at the
> minuite. Can I vote for option 3?

Sure. clock tree feels the same way. ;-)

Regards,
Mike

>=20
> --=20
> Lee Jones
> Linaro STMicroelectronics Landing Team Lead
> Linaro.org =E2=94=82 Open source software for ARM SoCs
> Follow Linaro: Facebook | Twitter | Blog
