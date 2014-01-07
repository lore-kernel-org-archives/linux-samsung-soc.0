From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Boot hang on Origen with (!SMP && CPU_IDLE)
Date: Tue, 7 Jan 2014 09:51:00 +0100
Message-ID: <201401070951.01107.arnd@arndb.de>
References: <CAHbNUh1LF9+v1en==t8znAL518ERWE2LffTDykAEb2HST+WKTw@mail.gmail.com> <4790422.Kg6m1IjKcC@flatron> <CAHbNUh3Ao0k5gKF-3V0Ktc5+3-NhucP62fUp_i9kPjn+jTevGg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:52244 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753315AbaAGIvN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 7 Jan 2014 03:51:13 -0500
In-Reply-To: <CAHbNUh3Ao0k5gKF-3V0Ktc5+3-NhucP62fUp_i9kPjn+jTevGg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tushar Behera <tushar.behera@linaro.org>
Cc: Tomasz Figa <tomasz.figa@gmail.com>, Tomasz Figa <t.figa@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kgene Kim <kgene.kim@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>

On Tuesday 07 January 2014, Tushar Behera wrote:
> >> > >> be a good time to get rid of the L2_AUX_VAL and L2_AUX_MASK defines and
> >> > >> just read the respective settings from DT.
> >> >
> >> > Ok.
> >>
> >> Does the node you list above have the right settings for this?
> >>
> 
> I will add another patch to remove the usage of L2_AUX_VAL and
> L2_AUX_MASK defines for regular mode, but we might still be needing
> them for secure firmware booting,

Well, the point was that all the settings from these arguments are
supposed to come from DT properties these days. If you need to set
or clear a bit that doesn't have a property yet, I'd prefer if you
extend the binding and the pl310_of_setup() implementation.

	Arnd
