From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add init code of audio to Goni and
 Aquila board
Date: Thu, 14 Oct 2010 15:17:59 +0100
Message-ID: <20101014141758.GB8991@opensource.wolfsonmicro.com>
References: <4CA5623B.5030405@samsung.com>
 <003701cb6b37$4c106fb0$e4314f10$%kim@samsung.com>
 <AANLkTimwNprWtZiMnAt2-fYGwRySs-mbxxh-TYSqh=f6@mail.gmail.com>
 <AANLkTimqBgUuVzhV84HKGUygNB2raebrgTrEeKnd3uQc@mail.gmail.com>
 <AANLkTin4pHDMT1Cq_7Wf_P57wEvB28UZt601Y09EY-Pg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53063 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1753806Ab0JNORq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Oct 2010 10:17:46 -0400
Content-Disposition: inline
In-Reply-To: <AANLkTin4pHDMT1Cq_7Wf_P57wEvB28UZt601Y09EY-Pg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Myungjoo Ham <myungjoo.ham@samsung.com>, Ben Dooks <ben-linux@fluff.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Liam Girdwood <lrg@slimlogic.co.uk>

On Thu, Oct 14, 2010 at 10:17:11AM +0900, Jassi Brar wrote:

> > It's not exactly. GPIO pins are different.

> Maybe the GPIO differences could be handled at one place and other codes
> compressed ?

Platform data for the audio driver, perhaps?  That's being used by some
other systems, and should be much easier now with multi-component.
