From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ASoC: Samsung: Modify the I2S driver to support I2S on Exynos5420
Date: Thu, 11 Jul 2013 13:07:13 +0200
Message-ID: <10406176.2lc5qJ8Oq7@thinkpad>
References: <1373526505-27115-1-git-send-email-padma.v@samsung.com> <20130711104804.GK24508@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:64129 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932076Ab3GKLHU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 11 Jul 2013 07:07:20 -0400
Received: by mail-wi0-f173.google.com with SMTP id hq4so12473438wib.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 11 Jul 2013 04:07:19 -0700 (PDT)
In-Reply-To: <20130711104804.GK24508@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Padmavathi Venna <padma.v@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.kvr@gmail.com, sbkim73@samsung.com, kgene.kim@samsung.com, abrestic@chromium.org

On Thursday 11 of July 2013 11:48:04 Mark Brown wrote:
> On Thu, Jul 11, 2013 at 12:38:24PM +0530, Padmavathi Venna wrote:
> > -#define MOD_LR_LLOW		(0 << 7)
> > -#define MOD_LR_RLOW		(1 << 7)
> > -#define MOD_SDF_IIS		(0 << 5)
> > -#define MOD_SDF_MSB		(1 << 5)
> > -#define MOD_SDF_LSB		(2 << 5)
> > -#define MOD_SDF_MASK		(3 << 5)
> > 
> > +#define MOD_LR_LLOW		0
> > +#define MOD_LR_RLOW		1
> > +#define MOD_SDF_SHIFT		5
> > +#define MOD_SDF_IIS		0
> > +#define MOD_SDF_MSB		1
> > +#define MOD_SDF_LSB		2
> > +#define MOD_SDF_MASK		3
> 
> This patch has an awful lot of coding style changes like this which
> are just coding style changes and not implementing TDM support.  These
> should be done separately, not as part of the same patch, in order to
> make the code easier to review.
> 
> >  	case 768:
> > -		mod |= MOD_RCLK_768FS;
> > +		mod |= (MOD_RCLK_768FS << rfs_shift);
> > 
> >  		break;
> 
> This stuff is another example.
> 
> I think the change itself should be fine but I'm not 100% sure I'm
> correctly identifying what's a stylistic change and what's a functional
> change.

Right. This could be split into two patches, first reworking the style to give 
more flexibility with operations on registers and another one adding TDM 
specific changes, like new bitfield definitions and conditional handling of 
register accesses to account for new bitfield locations.

Best regards,
Tomasz
