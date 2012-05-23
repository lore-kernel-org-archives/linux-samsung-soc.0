From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH v3 2/2] regulator: Add support for MAX77686.
Date: Wed, 23 May 2012 18:32:23 +0530
Message-ID: <CAKew6eVoqnJaVP81oiopowsqrhNZ1rSMWO4YuGo5ghsmcTGQtA@mail.gmail.com>
References: <y@samsung.com>
	<4fbb2ada.63de440a.589d.78e2@mx.google.com>
	<4FBC3FF0.5080408@samsung.com>
	<CAKew6eW2eGrBnzSGsr3N_dXSixXv-bkBo7xkbC-o9DNnwBhcuw@mail.gmail.com>
	<4FBC6A2D.6040408@samsung.com>
	<CAKew6eUew+=f-dGjJZD7Wy8Xt2f4smEhkYh=CUhx6Y_EMByFFw@mail.gmail.com>
	<4FBC76A8.2070004@samsung.com>
	<20120523101834.GI4085@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:34318 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770Ab2EWNCY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 23 May 2012 09:02:24 -0400
In-Reply-To: <20120523101834.GI4085@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: jonghwa3.lee@samsung.com
Cc: Mark Brown <broonie@opensource.wolfsonmicro.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Liam Girdwood <lrg@ti.com>, Yadwinder Singh Brar <yadi.brar@samsung.com>, Kyungmin Park <kmpark@infradead.org>, Samuel Ortiz <sameo@linux.intel.com>

Hi Jonghwa,

I didn't know about confirmation of your mfd driver by Samuel Oritz.
So please feel free to revise and submit your patch set.
Anyways, I am interested only in getting the driver for max77686 in mainline.

Thanks,
Yadwinder.

On Wed, May 23, 2012 at 3:48 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Wed, May 23, 2012 at 02:33:28PM +0900, jonghwa3.lee@samsung.com wrote:
>
>> I inform you my mfd driver has been confirmed by Samuel Oritz and there
>> is no mfd private API. This situation looks unusual that we registers
>> mfd driver and regulator driver separately. But how should we do? For
>> corporation , i'm asking you to consider my suggestion.
>
> Given all this discussion I'm going to ignore this patch for now and
> wait for a repost after you've come to an agreement.
