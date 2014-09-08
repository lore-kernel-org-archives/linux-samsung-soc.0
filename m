From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH v2 0/5] Add max77802 support for Peach boards
Date: Mon, 8 Sep 2014 14:37:39 +0200
Message-ID: <CABxcv==ycrPw1MTv7X0baX2WfqgDS+4EEfGAWc+ZhpiR6=Uy+Q@mail.gmail.com>
References: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f179.google.com ([74.125.82.179]:55686 "EHLO
	mail-we0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753413AbaIHMhk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 8 Sep 2014 08:37:40 -0400
Received: by mail-we0-f179.google.com with SMTP id u56so1374940wes.38
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Sep 2014 05:37:39 -0700 (PDT)
In-Reply-To: <1408533593-32346-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Doug Anderson <dianders@chromium.org>, Linux Kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>, Olof Johansson <olof@lixom.net>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Rahul Sharma <rahul.sharma@samsung.com>

Hello Kukjin,

On Wed, Aug 20, 2014 at 1:19 PM, Javier Martinez Canillas
<javier.martinez@collabora.co.uk> wrote:
>
> This is a second version of the series that adds max77802 support for
> the Peach Pit and Pi boards. The series also have all the pending
> patches that were posted but depended on this support. I've picked
> all the patches I found and rebased them to be sure that they apply
> cleanly on top of linux-next. Also I've taken some DT snippets from
> the downstream Chrome OS 3.8 kernel DTS for devices that use one of
> these regulators as their input supply.
>

Any comments on this series?

Best regards,
Javier
