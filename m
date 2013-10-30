From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH V4] spi: s3c64xx: Enable Word transfer
Date: Wed, 30 Oct 2013 18:06:30 +0100
Message-ID: <6043727.WVyVGYjJys@amdc1227>
References: <1382074356-28430-1-git-send-email-rajeshwari.s@samsung.com>
 <CAPs=JDeDbevjOtMH0y+9aVSbNSV4zmEQxWygtB-f69XzooSinQ@mail.gmail.com>
 <20131030170029.GK2493@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:13895 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750882Ab3J3RGd (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Oct 2013 13:06:33 -0400
In-reply-to: <20131030170029.GK2493@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>, Rajeshwari Birje <rajeshwari.birje@gmail.com>
Cc: Rajeshwari S Shinde <rajeshwari.s@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-spi@vger.kernel.org, Simon Glass <sjg@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Doug Anderson <dianders@google.com>

On Wednesday 30 of October 2013 10:00:29 Mark Brown wrote:
> On Wed, Oct 30, 2013 at 11:52:54AM +0530, Rajeshwari Birje wrote:
> 
> > The following patch already sets bits_per_word_mask for
> > drivers/spi/spi-s3c64xx.c in s3c64xx_spi_probe, hence I had a doubt do
> > I need to set the same again.
> 
> OK, so how did this work before then?  You're just adding new code but
> the driver was previously claiming to support different bits per word
> (and now I look at the code there is some handling for that in code).
> Is this a bug fix?

That's a good question. Rajeshwari, what SPI device did you test this
patch with? Does it have a driver in mainline kernel?

Best regards,
Tomasz
