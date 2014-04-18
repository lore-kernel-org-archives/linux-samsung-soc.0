From: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v3 5/5] regulator: tps65090: Make FETs more reliable by
 adding retries
Date: Fri, 18 Apr 2014 11:05:51 -0700
Message-ID: <CAD=FV=VQckC34rZwF2RP3F+2T1CRVs0JwtgoqUeA1NVmB20=sA@mail.gmail.com>
References: <1397689950-1568-1-git-send-email-dianders@chromium.org>
	<1397689950-1568-6-git-send-email-dianders@chromium.org>
	<20140418174353.GX12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ve0-f173.google.com ([209.85.128.173]:64570 "EHLO
	mail-ve0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751984AbaDRSFw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 18 Apr 2014 14:05:52 -0400
Received: by mail-ve0-f173.google.com with SMTP id oy12so3370470veb.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 18 Apr 2014 11:05:51 -0700 (PDT)
In-Reply-To: <20140418174353.GX12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>
Cc: Anton Vorontsov <anton@enomsg.org>, Olof Johansson <olof@lixom.net>, Sachin Kamat <sachin.kamat@linaro.org>, AJAY KUMAR RAMAKRISHNA SHYMALAMMA <ajaykumar.rs@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Simon Glass <sjg@chromium.org>, Michael Spang <spang@chromium.org>, Sean Paul <seanpaul@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Mark,

On Fri, Apr 18, 2014 at 10:43 AM, Mark Brown <broonie@kernel.org> wrote:
> On Wed, Apr 16, 2014 at 04:12:29PM -0700, Doug Anderson wrote:
>> An issue was discovered with tps65090 where sometimes the FETs
>> wouldn't actually turn on when requested (they would report
>> overcurrent).  The most problematic FET was the one used for the LCD
>
> This is basically fine but you said it depends on one of the previous
> patches which you didn't CC me on so I've no idea what's going on
> there?

Sorry about that.  :(

Lee has Acked the caching patch.  Lee: what's the best way for you and
Mark to coordinate there?  Should he apply the caching patch with your
Ack?

-Doug
