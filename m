From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] gpio: samsung: Update documentation
Date: Wed, 05 Sep 2012 06:39:56 +0900
Message-ID: <226401cd8ae5$d3e0ee90$7ba2cbb0$%kim@samsung.com>
References: <503D267A.2090406@gmail.com>
 <1346603089-14122-1-git-send-email-sylvester.nawrocki@gmail.com>
 <CACRpkdbudOv9AvS1XuyPB+BZ63+Ymu5dhkBBWFCo2qYDV+jAmw@mail.gmail.com>
 <5045B89D.50503@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35991 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932503Ab2IDVj6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Sep 2012 17:39:58 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9U004YWHIGK920@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 06:39:57 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9U00DN7HIKRTA0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Sep 2012 06:39:57 +0900 (KST)
In-reply-to: <5045B89D.50503@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Sylwester Nawrocki' <sylvester.nawrocki@gmail.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Sylwester Nawrocki wrote:
> 
> On 09/04/2012 09:27 AM, Linus Walleij wrote:
> > On Sun, Sep 2, 2012 at 6:24 PM, Sylwester Nawrocki
> > <sylvester.nawrocki@gmail.com> wrote:
> >
> >> Update Samsung GPIO API documentation to reflect removal of
> >> the s3c24xx specific gpio API. While at it, fix some typos.
> >>
> >> The notes on conversion from s3c2410_* functions to the gpiolib
> >> API are left here just in case there is any out of tree code that
> >> still needs to be converted.
> >>
> >> Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
> >
> > Acked-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > Get the Samsung maintainers to apply this patch since they carry
> > the API changes.
> 
Linus, thanks for your ack.

> Thanks Linus. Kgene, this is the documentation update we talked about
> previously. Can you please pick this patch as well ?
> 
Sure, I will apply this into Samsung tree.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
