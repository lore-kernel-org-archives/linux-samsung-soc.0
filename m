From: Kevin Hilman <khilman@linaro.org>
Subject: Re: [PATCH 0/3] MCPM: clarify boot CPU situation wrt CCI
Date: Wed, 25 Jun 2014 19:41:03 -0700
Message-ID: <CAGa+x853xBjmb5Pe37wM9Q5jRVJExn_4xmM+bXyFspnzKb+9tw@mail.gmail.com>
References: <1403583071-5650-1-git-send-email-nicolas.pitre@linaro.org>
	<7hd2dymiaw.fsf@paris.lan>
	<CAD=FV=WHU0TDkjXVCCw6odBFSF7uvv3joCP+oW4cBS_tsSgF+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f172.google.com ([209.85.216.172]:58018 "EHLO
	mail-qc0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754177AbaFZClE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 25 Jun 2014 22:41:04 -0400
Received: by mail-qc0-f172.google.com with SMTP id o8so2609682qcw.31
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jun 2014 19:41:03 -0700 (PDT)
In-Reply-To: <CAD=FV=WHU0TDkjXVCCw6odBFSF7uvv3joCP+oW4cBS_tsSgF+Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Doug Anderson <dianders@google.com>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Abhilash Kesavan <kesavan.abhilash@gmail.com>, Andrew Bresticker <abrestic@chromium.org>, Olof Johansson <olof@lixom.net>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, Tushar Behera <tushar.b@samsung.com>

On Tue, Jun 24, 2014 at 3:57 PM, Doug Anderson <dianders@google.com> wrote:
> Kevin,
>
> On Tue, Jun 24, 2014 at 8:35 AM, Kevin Hilman <khilman@linaro.org> wrote:
>> - Leave mau_epll enabled
>>   http://lists.infradead.org/pipermail/linux-arm-kernel/2014-June/262259.html
>
> Can you drop your mau_epll one and instead pick just
> <https://patchwork.kernel.org/patch/4333581/>?
>
> I noticed that Tushar has only been pushing for that patch to be
> applied and I'm going to guess that the "leave mau_epll enabled" isn't
> needed.  I just tested myself and confirmed that things are happy.

I replied on the other thread too, but just to be thorough...

Picking the above patch alone, I still get the boot hang.  Adding
'clk_ignore_unused' to the command line gets things booting again,
which suggest there's still a missing piece of the puzzle.

Kevin
