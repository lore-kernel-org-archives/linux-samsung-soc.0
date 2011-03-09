From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] SAMSUNG: S5PV310: Add I2S playback support
Date: Wed, 9 Mar 2011 10:24:38 +0000
Message-ID: <20110309102438.GE6923@opensource.wolfsonmicro.com>
References: <1299580852-20959-1-git-send-email-giridhar.maruthy@linaro.org>
 <20110308113752.GA5892@sirena.org.uk>
 <AANLkTimYv-F-0VXzy9=Cb9GoSQzWs0RMd4y5rbpP+fCw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:53773 "EHLO
	opensource2.wolfsonmicro.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1757160Ab1CIKYk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Mar 2011 05:24:40 -0500
Content-Disposition: inline
In-Reply-To: <AANLkTimYv-F-0VXzy9=Cb9GoSQzWs0RMd4y5rbpP+fCw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Giridhar Bachalli Maruthy <giridhar.maruthy@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com

On Wed, Mar 09, 2011 at 03:50:18PM +0530, Giridhar Bachalli Maruthy wrote:

> Since WM8994 codec requires CONFIG_REGULATOR to be defined, would it
> be appropriate to select REGULATOR also in [1] and remove the ifdef
> CONFIG_REGULATOR?

What makes you say that CONFIG_REGULATOR is required?
