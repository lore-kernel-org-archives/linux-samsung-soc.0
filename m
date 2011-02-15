From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S5PV210: Add GONI board setup for CIF camera
	support
Date: Tue, 15 Feb 2011 19:26:52 +0900
Message-ID: <00a801cbccfa$df478e10$9dd6aa30$%kim@samsung.com>
References: <1297445273-3829-1-git-send-email-s.nawrocki@samsung.com>
 <008d01cbccd4$3897da00$a9c78e00$%kim@samsung.com>
 <4D5A3F31.1070106@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9787 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751963Ab1BOK05 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 Feb 2011 05:26:57 -0500
Received: from epmmp2 (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LGN00H1UMCV2H80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 19:26:55 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LGN003PPMCV0C@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 Feb 2011 19:26:56 +0900 (KST)
In-reply-to: <4D5A3F31.1070106@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sylwester Nawrocki' <s.nawrocki@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, kyungmin.park@samsung.com

Sylwester Nawrocki wrote:
> 
> Hi Kukjin,
> 
Hi :)

> > Hmm...looks you don't want to follow my suggestion on 2nd patch.
> 
> I've attempted to make a change as you suggested but it turned out
> that all regulators I'm adding supplies for in the second patch are
> also used by the other, high resolution camera. It's not about I don't
> want to follow you suggestions. The argument is that I's like to add
shortly
> support for the other camera and then the patch would be just one line
> per a power supply rather than 4. I really don't mind to adhere to your
> preferred style. But in this case it would be just more work to revert
> things back and forth.
> 
Ok, I see, no problem.

> I've boot tested your patch:
> ARM: S5PV210: Use REGULATOR_SUPPLY macro for regulator consumers
> on Aquila and GONI board altogether with my changeset.
> 
Thanks :)

> >
> > I'm still wondering why array is needed for just one member in
> > regulator_consumer_supply structure now even though other something will
be
> > added later.
> >
> > Nevertheless will apply your 3 patches but if not required array will be
> > removed later.
> 
> Thanks! I am going to post further patches for this board soon so there
> should be no need to change anything. Please use you time for more
important
> things ;)
> 
Hehehe, ok and don't worry ;)

> I've noticed one issue with the first patch, i.e. Kyungmin's email address
> is broken. Should I resend the patch or could you please correct this on
your
> side?
> 
Oops, ok. I fixed it.

As a note, I received request about common phy control from Marek. So I will
re-think with your mini phy patches, then let you know about that soon.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
