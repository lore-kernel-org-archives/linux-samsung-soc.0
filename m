From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 2/3] mfd: sec-core: Add of_compatible strings for MFD
 cells
Date: Thu, 13 Mar 2014 13:09:50 +0000
Message-ID: <20140313130950.GB10356@lee--X1>
References: <1394703425-6462-1-git-send-email-k.kozlowski@samsung.com>
 <1394703425-6462-3-git-send-email-k.kozlowski@samsung.com>
 <53219F80.9000300@samsung.com>
 <1394712996.20773.1.camel@AMDC1943>
 <5321A6A2.9070509@samsung.com>
 <1394714991.20773.5.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f171.google.com ([209.85.212.171]:40029 "EHLO
	mail-wi0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750983AbaCMNJ4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Mar 2014 09:09:56 -0400
Received: by mail-wi0-f171.google.com with SMTP id hn9so3862553wib.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Mar 2014 06:09:55 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1394714991.20773.5.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, linux-arm-kernel@lists.infradead.org, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Tushar Behera <tushar.behera@linaro.org>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

<snip>

> > >> Are these compatible strings documented anywhere?
> > >
> > > The "-clk" compatible strings are (in next patch). The "-rtc" and
> > > "-regulators" are not.
> >=20
> > Hmm, this doesn't sound good.
> >=20
> > > Actually they aren't also used by child driver (each child driver=
 parses
> > > from parent of_node).
> >=20
> > Do you need to add compatible strings to mfd_cell entries of such c=
ells=20
> > then?
>=20
> From my point of view there isn't any special need for them (except f=
or
> clk).
>=20
> Dear Lee,
>=20
> Do you wish to have these compatibles for all of child drivers even w=
hen
> they aren't used directly by them? If yes then probably I should
> document them.

It's your call, either remove the unused ones or document them all.

I don't really mind either way. In the previous version I asked if
there was any reason why you weren't applying compatible strings to
the other cells; "subordinate drivers don't use them" is a perfectly
reasonable reason.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
