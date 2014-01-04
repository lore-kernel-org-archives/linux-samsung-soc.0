From: kgene@kernel.org
Subject: RE: [PATCH 1/9] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Sat, 04 Jan 2014 11:35:10 +0900
Message-ID: <22ff01cf08f5$96be3010$c43a9030$@kernel.org>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
 <1388397640-720-2-git-send-email-tushar.behera@linaro.org>
 <20131231153826.GD31886@sirena.org.uk>
 <CAHbNUh2srTmYU+04xt_goUw1E4QkWtdzSOT3wfgbQTtCtBjb_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:42665 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753815AbaADCfL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jan 2014 21:35:11 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYU00JPLV6MSE80@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 04 Jan 2014 11:35:10 +0900 (KST)
In-reply-to: <CAHbNUh2srTmYU+04xt_goUw1E4QkWtdzSOT3wfgbQTtCtBjb_w@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tushar Behera' <tushar.behera@linaro.org>, 'Mark Brown' <broonie@kernel.org>
Cc: 'linux-samsung-soc' <linux-samsung-soc@vger.kernel.org>, 'Sachin Kamat' <sachin.kamat@linaro.org>

Tushar Behera wrote:
> 
> On 31 December 2013 21:08, Mark Brown <broonie@kernel.org> wrote:
> > On Mon, Dec 30, 2013 at 03:30:32PM +0530, Tushar Behera wrote:
> >> From: Sachin Kamat <sachin.kamat@linaro.org>
> >>
> >> regs-serial.h only includes linux/serial_s3c.h. Include this
> >> header directly in samsung.S to remove unnecessary platform
> >> dependency.
> >>
> >> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> >> ---
> >
> > If you're forwarding on a patch from someone else you need to add your
> > Signed-off-by to it - that's important for the whole goal of tracking
> > licensing.
> 
> Yeah, true. I forgot about that.
> 
> Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
> 
> Kukjin,
> 
> While applying this series, can you please add my Signed-off-by?
> 
Tushar, The 'Signed-off-by' is different with others ack, review or whatever. In my understanding it's a legal issue so you need to repost.

BTW, I think this series looks good to me but we don't need separated #1 to #8 patches because it's samething, so please squash them.

Thanks,
Kukjin
