From: Heiko =?utf-8?q?St=C3=BCbner?= <heiko@sntech.de>
Subject: Re: [RFC PATCH 1/6] spi: spi-s3c64xx: Remove platform dependent code
Date: Wed, 11 Sep 2013 18:21:58 +0200
Message-ID: <201309111821.59206.heiko@sntech.de>
References: <1378735766-12330-1-git-send-email-l.czerwinski@samsung.com> <1378735766-12330-2-git-send-email-l.czerwinski@samsung.com> <20130909143801.GA29403@sirena.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39265 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753959Ab3IKQVr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Sep 2013 12:21:47 -0400
In-Reply-To: <20130909143801.GA29403@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Lukasz Czerwinski <l.czerwinski@samsung.com>, s.nawrocki@samsung.com, linux-samsung-soc@vger.kernel.org, linux-spi@vger.kernel.org

Am Montag, 9. September 2013, 16:38:01 schrieb Mark Brown:
> On Mon, Sep 09, 2013 at 04:09:21PM +0200, Lukasz Czerwinski wrote:
> > Since support for generic DMA engine has beed added, there is no need
> > to keep platform specific code (behind the #ifdef CONFIG_S3C_DMA).
> 
> This would break s3c64xx at least until Tomasz's dmaengine conversion
> for that gets merged (hopefully this time around...).  Given that one
> of my main development systems is based on s3c64xx I'm even more keen
> to keep that working than otherwise.

Just for completenes sake, the same is true for the s3c2416 and s3c2443 using 
this controller - and similarily with a pending migration to dmaengine.
