From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 1/3] clk: s2mps11: Add support for S2MPS14 clocks
Date: Thu, 20 Mar 2014 13:42:19 +0000
Message-ID: <20140320134219.GB6816@lee--X1>
References: <1395047958-17953-1-git-send-email-k.kozlowski@samsung.com>
 <1395047958-17953-2-git-send-email-k.kozlowski@samsung.com>
 <20140319001643.30995.46947@quantum>
 <1395215408.18730.2.camel@AMDC1943>
 <20140319191117.30995.13715@quantum>
 <1395319557.22979.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1395319557.22979.1.camel@AMDC1943>
Sender: linux-kernel-owner@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

> > > > > This patch adds support for S2MPS14 PMIC clocks (BT and AP) t=
o the
> > > > > s2mps11 clock driver.
> > > > >=20
> > > > > Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> > > > > Reviewed-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
> > > > > Reviewed-by: Tomasz Figa <t.figa@samsung.com>
> > > >=20
> > > > This does not apply cleanly to to clk tree trip, nor does it co=
mpile
> > > > after manually merging due to changes introducing
> > > > linux/mfd/samsung/s2mps14.h.
> > > >=20
> > > > The changes look OK to me so maybe Lee can take it with my Ack?
> > > >=20
> > > > Acked-by: Mike Turquette <mturquette@linaro.org>
> > > >=20
> > >=20
> > > Hi,
> > >=20
> > > Thanks for the Ack. The patch depends on Tushar Behera's patches:
> > >  - [PATCH V2 0/2] Add support for clocks in S5M8767
> > >    http://thread.gmane.org/gmane.linux.kernel.samsung-soc/27264
> > > which are waiting for some time. Both patchsets should be pulled
> > > together.
> >=20
> > I took those patches in yesterday. So we have three options:
>=20
> Great! Thanks.
>=20
> >=20
> > 1) MFD tree can pull a stable commit from the clk tree. I'm happy t=
o
> > make a topic branch for this. Then these patches can be applied.
> >=20
> > 2) clk tree can pull a stable commit from the mfd tree if the mfd f=
olks
> > can provide one.
> >=20
> > 3) Wait until after the merge window to apply this one to the clk t=
ree.
> > I don't currently plan to send 2 PRs during the merge window, so th=
is
> > could either go in 3.16 or maybe into 3.15 if a split PR is sent.
>=20
> Dear Lee,
>=20
> How do you wish to proceed? The patchset depends on changes in sec-co=
re
> MFD driver.

The MFD tree is betting pretty complicated with sec-core stuff at the
minuite. Can I vote for option 3?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
