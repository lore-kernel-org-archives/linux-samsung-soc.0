From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT option for
 snd_soc_set_fmt()
Date: Thu, 30 Aug 2012 10:43:18 -0700
Message-ID: <20120830174317.GG4356@opensource.wolfsonmicro.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
 <20120827204550.GA4400@opensource.wolfsonmicro.com>
 <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:55103 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751088Ab2H3RnW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Aug 2012 13:43:22 -0400
Content-Disposition: inline
In-Reply-To: <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangsu Park <sangsu4u.park@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Wed, Aug 29, 2012 at 08:06:32PM +0900, Sangsu Park wrote:

Please check your mailer configuration, it looks like it's reformatting
all the text with much longer line widths.

> On Sun, Aug 26, 2012 at 05:45:54PM +0900, Mark Brown wrote:

> > a whole lot of sense on the slave side, it's related to the clock generation so should have no
> > effect at all on the slave side.  The driver code looks reasonably sensible though.

> You mean cpu side is slave? 

Yes.


> > What specifically is going wrong here?

> SND_SOC_DAIFMT_CONT is used sound/soc/Samsung/pcm.c (s3c_pcm_set_fmt()) like below.

> switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
>         case SND_SOC_DAIFMT_CONT:
>                 pcm->idleclk = 1;
>                 break;
>         case SND_SOC_DAIFMT_GATED:
>                 pcm->idleclk = 0;
>                 break;
>         default:
>                 dev_err(pcm->dev, "Invalid Clock gating request!\n");
>                 ret = -EINVAL;
>                 goto exit;
>         }

> If fmt argument has no SND_SOC_DAIFMT_ option, s3c_pcm_set_fmt() return -EINVAL.

So, clearly this is unrelated to the change you mentioned in your commit
message - it looks like this is just a plain issue in the machine
driver.  That said the above code should be changed to at least ignore
the setting in slave mode (since the clock shouldn't be being driven and
it doesn't matter).
