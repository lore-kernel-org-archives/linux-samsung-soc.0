From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [alsa-devel] [PATCH V3 2/2] ASoC: samsung: Add machine driver for
 Odroid X2/U3
Date: Thu, 10 Jul 2014 18:15:59 +0200
Message-ID: <53BEBC3F.6030205@samsung.com>
References: <1404479625-25385-1-git-send-email-s.nawrocki@samsung.com>
 <1404479625-25385-2-git-send-email-s.nawrocki@samsung.com>
 <CAD8Lp44JFtbcD22c+0PVb5S4U1kVTTxHD=PgqiKzhVypFW5Prg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:49438 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752722AbaGJQQF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jul 2014 12:16:05 -0400
In-reply-to: <CAD8Lp44JFtbcD22c+0PVb5S4U1kVTTxHD=PgqiKzhVypFW5Prg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Chen Zhen <zhen1.chen@samsung.com>, Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org

Hi Daniel,

On 08/07/14 11:15, Daniel Drake wrote:
> Testing on ODROID-U2, v3 is not quite working for me, but v2 of the
> patch was fine.
> I boot up, run:
> # speaker-test -c 2 -t wav
> 
> As soon as I hear the word "front" I press ctrl+c and then run the
> command again.
> Now the command hangs with no audible output.
> 
> Any ideas? Let me know if you have trouble reproducing.

I just posted a patch addressing this, please let me know
if there are any further issues.

-- 
Thanks,
Sylwester
