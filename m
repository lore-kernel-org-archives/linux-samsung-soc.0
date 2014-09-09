From: kgene@kernel.org
Subject: RE: [PATCH v2 0/5] Add max77802 support for Peach boards
Date: Tue, 09 Sep 2014 12:47:35 +0900
Message-ID: <04ab01cfcbe0$caeac4d0$60c04e70$@kernel.org>
References: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
 <CABxcv==ycrPw1MTv7X0baX2WfqgDS+4EEfGAWc+ZhpiR6=Uy+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:10237 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753171AbaIIDrh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 23:47:37 -0400
In-reply-to: <CABxcv==ycrPw1MTv7X0baX2WfqgDS+4EEfGAWc+ZhpiR6=Uy+Q@mail.gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Javier Martinez Canillas' <javier@dowhile0.org>
Cc: linux-samsung-soc@vger.kernel.org, 'Javier Martinez Canillas' <javier.martinez@collabora.co.uk>, 'Doug Anderson' <dianders@chromium.org>, 'Linux Kernel' <linux-kernel@vger.kernel.org>, 'Mark Brown' <broonie@kernel.org>, 'Olof Johansson' <olof@lixom.net>, 'Naveen Krishna Chatradhi' <ch.naveen@samsung.com>, =?UTF-8?Q?'Andreas_F=C3=A4rber'?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, 'Rahul Sharma' <rahul.sharma@samsung.com>

Javier Martinez Canillas wrote:
> 
> Hello Kukjin,
> 
Hi,

> On Wed, Aug 20, 2014 at 1:19 PM, Javier Martinez Canillas
> <javier.martinez@collabora.co.uk> wrote:
> >
> > This is a second version of the series that adds max77802 support for
> > the Peach Pit and Pi boards. The series also have all the pending
> > patches that were posted but depended on this support. I've picked
> > all the patches I found and rebased them to be sure that they apply
> > cleanly on top of linux-next. Also I've taken some DT snippets from
> > the downstream Chrome OS 3.8 kernel DTS for devices that use one of
> > these regulators as their input supply.
> >
> 
> Any comments on this series?
> 
Looks good to me but I just wanted to get ack from chrome guy, Doug? But since
Naveen tested, it should be fine I think. I'll take the series.

Thanks,
Kukjin
