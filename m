From: Alexey Galakhov <agalakhov@gmail.com>
Subject: Re: [PATCH] Fix compilation error on S3C2440
Date: Wed, 30 Jan 2013 15:48:48 +0600
Message-ID: <5108EC80.9090809@gmail.com>
References: <1359392823-30529-1-git-send-email-agalakhov@gmail.com> <05e201cdfde6$c711cb70$55356250$@samsung.com> <20130130021857.GF4945@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:49743 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751856Ab3A3Jzt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Jan 2013 04:55:49 -0500
Received: by mail-lb0-f171.google.com with SMTP id gg13so1920616lbb.16
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jan 2013 01:55:48 -0800 (PST)
In-Reply-To: <20130130021857.GF4945@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, 'Padmavathi Venna' <padma.v@samsung.com>, 'Sangbeom Kim' <sbkim73@samsung.com>

On 01/30/2013 08:18 AM, Mark Brown wrote:

> Though I've got a horrible feeling this will conflict with Padma's
> work...

Looks like Padma changed the code for S3C2412 and blindly copy-pasted
the same change for all S3C24xx. However S3C24xx is for I2S-v1 and
S3C2412 is for I2S-v2. The extra stuff in s3c_i2sv2_register_dai() is
unrelated to v1.

After this patch the code works again just like v3.7 one. However the
v3.7 code was already broken (in fact, since v3.2) in the DMA
notification part so it doesn't play sound correctly thus I can't tell
that everything works just fine now :). I found the patch that
introduced the bug (344b4c4) and now I'm debugging it.
