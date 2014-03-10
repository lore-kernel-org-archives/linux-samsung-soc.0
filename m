From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 2/3] regulator: s2mps11: Add set_suspend_disable for
 S2MPS14
Date: Mon, 10 Mar 2014 09:47:55 +0000
Message-ID: <20140310094755.GF14976@lee--X1>
References: <1394011373-4057-1-git-send-email-k.kozlowski@samsung.com>
 <1394011373-4057-3-git-send-email-k.kozlowski@samsung.com>
 <20140306093826.GO13126@sirena.org.uk>
 <1394099334.25853.1.camel@AMDC1943>
 <20140307015139.GS13126@sirena.org.uk>
 <1394177291.20224.1.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f178.google.com ([74.125.82.178]:54803 "EHLO
	mail-we0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753053AbaCJJsB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 05:48:01 -0400
Received: by mail-we0-f178.google.com with SMTP id u56so8045808wes.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2014 02:48:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1394177291.20224.1.camel@AMDC1943>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Mark Brown <broonie@kernel.org>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Samuel Ortiz <sameo@linux.intel.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

> > > Anyway can you look at other two patches and apply them if they a=
re OK?
> > > They don't depend on this.
> >=20
> > There appears to be some external dependency for the definition of
> > macros like S2MPS14X?
> The patchset depends on S2MPS14 support for MFD driver. This was appl=
ied
> by Lee here:
> https://git.linaro.org/people/lee.jones/mfd.git/shortlog/refs/heads/f=
or-mfd-next
> and merged into linux-next.

Right, so when this set obtains all its Acks, I'll apply them to the
MFD branch.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
