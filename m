From: Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: samsung: Add machine driver for
 Odroid X2/U3
Date: Mon, 14 Jul 2014 16:25:42 +0100
Message-ID: <CAD8Lp460Ym1y5OS8ya=jddO-spnojyGVWkUWhXmKCfbOOGL61A@mail.gmail.com>
References: <1404479625-25385-1-git-send-email-s.nawrocki@samsung.com>
	<1404479625-25385-2-git-send-email-s.nawrocki@samsung.com>
	<CAD8Lp44JFtbcD22c+0PVb5S4U1kVTTxHD=PgqiKzhVypFW5Prg@mail.gmail.com>
	<53BEBC3F.6030205@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:49332 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755615AbaGNPZn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Jul 2014 11:25:43 -0400
Received: by mail-we0-f172.google.com with SMTP id x48so2545349wes.31
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jul 2014 08:25:42 -0700 (PDT)
In-Reply-To: <53BEBC3F.6030205@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chen Zhen <zhen1.chen@samsung.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

On Thu, Jul 10, 2014 at 5:15 PM, Sylwester Nawrocki
<s.nawrocki@samsung.com> wrote:
> On 08/07/14 11:15, Daniel Drake wrote:
>> Testing on ODROID-U2, v3 is not quite working for me, but v2 of the
>> patch was fine.
>> I boot up, run:
>> # speaker-test -c 2 -t wav
>>
>> As soon as I hear the word "front" I press ctrl+c and then run the
>> command again.
>> Now the command hangs with no audible output.
>>
>> Any ideas? Let me know if you have trouble reproducing.
>
> I just posted a patch addressing this, please let me know
> if there are any further issues.


Sorry for not testing sooner. Your patch solves the issue.

Thanks
Daniel
