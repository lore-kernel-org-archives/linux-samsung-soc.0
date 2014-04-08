From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH V2 17/17] ARM: exynos: config: Enable cpuidle
Date: Tue, 08 Apr 2014 11:40:04 +0200
Message-ID: <1476266.LaBMgo4h3O@amdc1032>
References: <1396618989-2897-1-git-send-email-daniel.lezcano@linaro.org>
 <CAOesGMgf4owZBCVz4RTgbFVsogws6WKARmA7COkgXVQaG5ky9A@mail.gmail.com>
 <CAK9yfHz_J+NAtxk-Ec-cW6_u0ukssNGi24HZgGRRXb8Hzz2sig@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:37135 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755384AbaDHJkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Apr 2014 05:40:12 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N3P003H2HIYUM50@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 08 Apr 2014 18:40:10 +0900 (KST)
In-reply-to: <CAK9yfHz_J+NAtxk-Ec-cW6_u0ukssNGi24HZgGRRXb8Hzz2sig@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: Olof Johansson <olof@lixom.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, "linaro-kernel@lists.linaro.org" <linaro-kernel@lists.linaro.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Chander Kashyap <chander.kashyap@linaro.org>

On Tuesday, April 08, 2014 09:27:04 AM Sachin Kamat wrote:
> On 8 April 2014 00:03, Olof Johansson <olof@lixom.net> wrote:
> > On Mon, Apr 7, 2014 at 10:44 AM, Bartlomiej Zolnierkiewicz
> > <b.zolnierkie@samsung.com> wrote:
> >>
> >> Hi,
> >>
> >> On Monday, April 07, 2014 09:28:39 AM Olof Johansson wrote:
> >>> On Fri, Apr 4, 2014 at 9:09 AM, Bartlomiej Zolnierkiewicz
> >>> <b.zolnierkie@samsung.com> wrote:
> >>>
> >>> [...]
> >
> > Does 5420 even work upstream? I have hardware access but nothing that
> > will run an upstream kernel as far as I know. Maybe SLSI has an SMDK
> > they can help out with?
> 
> By working upstream if you mean being bootable, then yes I am able to boot both
> SMDK and Arndale Octa boards based on 5420 with the current upstream kernel.
> CPU idle however doesn't work though. I get a crash when I hot plug out all
> secondary CPUs on SMDK.

Thanks for testing.  This behavior is an expected one given the current code
(=> we need to disable AFTR on 5420 for now).

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
