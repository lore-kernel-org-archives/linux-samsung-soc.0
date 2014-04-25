From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] i2c: exynos5: Initialise Samsung High Speed I2C controller
 early
Date: Fri, 25 Apr 2014 10:28:06 +0530
Message-ID: <5359EB5E.7010800@linaro.org>
References: <1398350916-885-1-git-send-email-ch.naveen@samsung.com> <20140424162558.GB12304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:50041 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750843AbaDYE6M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 00:58:12 -0400
Received: by mail-pb0-f41.google.com with SMTP id rr13so2765822pbb.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Apr 2014 21:58:11 -0700 (PDT)
In-Reply-To: <20140424162558.GB12304@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Naveen Krishna Chatradhi <ch.naveen@samsung.com>
Cc: linux-i2c@vger.kernel.org, naveenkrishna.ch@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sjg@chromium.org, grundler@chromium.org, linux-kernel@vger.kernel.org, wsa@the-dreams.de, cpgs@samsung.com

On 04/24/2014 09:55 PM, Mark Brown wrote:
> On Thu, Apr 24, 2014 at 08:18:36PM +0530, Naveen Krishna Chatradhi wrote:
>> This patch moves initialization code to subsys_initcall() to ensure
>> that the i2c bus is available early so the regulators can be quickly
>> probed and available for other devices on their probe() call.
> 
>> Such solution has been proposed by Mark Brown to fix the problem of
>> the regulators not beeing available on the peripheral device probe():
>> http://lists.infradead.org/pipermail/linux-arm-kernel/2010-March/011971.html
> 
> What specifically is this needed for?  We *should* be able to use
> deferred probe for most things, but I know that not all subsystems are
> able to yet.
> 

DRM-Exynos is one such sub-system right now that doesn't handle deferred
probe well. That is one of the reasons for this patch.

-- 
Tushar Behera
