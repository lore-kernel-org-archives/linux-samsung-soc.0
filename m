From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Enable WM8994 MFD on I2S selection
Date: Thu, 26 May 2011 22:24:03 +0800
Message-ID: <20110526142333.GI15094@opensource.wolfsonmicro.com>
References: <1306298370-24997-1-git-send-email-angus.ainslie@linaro.org>
 <4DDD425A.1070202@samsung.com>
 <BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51060 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752315Ab1EZOn2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 26 May 2011 10:43:28 -0400
Received: from finisterre.wolfsonmicro.main (220-136-46-126.dynamic.hinet.net [220.136.46.126])
	by opensource2.wolfsonmicro.com (Postfix) with ESMTPSA id 56EF711069C
	for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2011 15:43:15 +0100 (BST)
Content-Disposition: inline
In-Reply-To: <BANLkTik5pqAgJGznPi2PLSyXucgOoLNR9w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>, linux-samsung-soc@vger.kernel.org, Giridhar Maruthy <giridhar.maruthy@linaro.org>, samsung@lists.linaro.org, patches@linaro.org, lrg@slimlogic.co.uk

On Wed, May 25, 2011 at 11:45:37PM +0530, Jassi Brar wrote:

> I2C here is a SMDK specific requirement and even if most devices need I2C,
> selecting I2C for every EXYNOS4210 based device is not ideal. IMO it'd better
> be tied to some SMDK specific config option.

Given that it's the audio machine driver the dependency on I2C doesn't
seem unreasonable - the CODEC will generally be I2C connected so I2C is
going to be required for the driver to do anything useful.  Might be
better to just add a dependency on the WM8994 MFD, though, which does
roughly the same thing.
