From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/9] ARM: SAMSUNG: Remove platform dependency from samsung.S
Date: Thu, 2 Jan 2014 08:25:12 +0530
Message-ID: <CAHbNUh2srTmYU+04xt_goUw1E4QkWtdzSOT3wfgbQTtCtBjb_w@mail.gmail.com>
References: <1388397640-720-1-git-send-email-tushar.behera@linaro.org>
	<1388397640-720-2-git-send-email-tushar.behera@linaro.org>
	<20131231153826.GD31886@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:56944 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750829AbaABCzN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Jan 2014 21:55:13 -0500
Received: by mail-oa0-f54.google.com with SMTP id h16so14367193oag.41
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Jan 2014 18:55:12 -0800 (PST)
In-Reply-To: <20131231153826.GD31886@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kgene Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@linaro.org>

On 31 December 2013 21:08, Mark Brown <broonie@kernel.org> wrote:
> On Mon, Dec 30, 2013 at 03:30:32PM +0530, Tushar Behera wrote:
>> From: Sachin Kamat <sachin.kamat@linaro.org>
>>
>> regs-serial.h only includes linux/serial_s3c.h. Include this
>> header directly in samsung.S to remove unnecessary platform
>> dependency.
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>> ---
>
> If you're forwarding on a patch from someone else you need to add your
> Signed-off-by to it - that's important for the whole goal of tracking
> licensing.

Yeah, true. I forgot about that.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>

Kukjin,

While applying this series, can you please add my Signed-off-by?

-- 
Tushar Behera
