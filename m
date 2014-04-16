From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Wed, 16 Apr 2014 14:25:45 -0700
Message-ID: <CAD=FV=V+xpMEFVqH2Afo8XmCJsUPU2Y8xcmR3rwi+V25KKx8DQ@mail.gmail.com>
References: <1397592876-5741-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-1-git-send-email-dianders@chromium.org>
	<1397672724-9063-6-git-send-email-dianders@chromium.org>
	<CAPnjgZ2pPa=-L6UxRR3KKF-3Ghi63gEU+5RRybLDHOwKL2cs7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vc0-f182.google.com ([209.85.220.182]:37554 "EHLO
	mail-vc0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754914AbaDPVZq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 16 Apr 2014 17:25:46 -0400
Received: by mail-vc0-f182.google.com with SMTP id ib6so11687579vcb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Apr 2014 14:25:45 -0700 (PDT)
In-Reply-To: <CAPnjgZ2pPa=-L6UxRR3KKF-3Ghi63gEU+5RRybLDHOwKL2cs7Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Simon Glass <sjg@chromium.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, lk <linux-kernel@vger.kernel.org>

Simon,

On Wed, Apr 16, 2014 at 1:50 PM, Simon Glass <sjg@chromium.org> wrote:
>> +#define MAX_CTRL_READ_TRIES    5
>> +#define MAX_FET_ENABLE_TRIES   1000
>
> Gosh that is a lot of tries - should we maybe give up sooner?

That's actually a squash of a recent patch.  See
<https://chromium-review.googlesource.com/189239>.  I've specifically
seen at least one case on my device where it needed 888 retries at
bootup!

...on my really old Chromebook, it seems to get into a bad state if it
sits on my desk for a long time.  After I use it a bit it rarely needs
more than 10 retries.

-Doug
