From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT option for
 snd_soc_set_fmt()
Date: Mon, 27 Aug 2012 13:45:51 -0700
Message-ID: <20120827204550.GA4400@opensource.wolfsonmicro.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:51492 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752256Ab2H0Up4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 27 Aug 2012 16:45:56 -0400
Content-Disposition: inline
In-Reply-To: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?utf-8?B?77+92rvvv73vv73vv70=?= <sangsu4u.park@samsung.com>
Cc: alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, lrg@ti.com, sbkim73@samsung.com, ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

On Sun, Aug 26, 2012 at 05:45:54PM +0900, =EF=BF=BD=DA=BB=EF=BF=BD=EF=BF=
=BD=EF=BF=BD wrote:
> SND_SOC_DAIFMT_CONT option is now needed because of below commit:
>=20
> ASoC: Allow DAI formats to be specified in the dai_link

Clearly it's not a direct consequence of this commit, that just
introduces a new optional facility which...

>  	/* Set the cpu DAI configuration */
>  	ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_B
> +				| SND_SOC_DAIFMT_CONT
>  				| SND_SOC_DAIFMT_IB_NF
>  				| SND_SOC_DAIFMT_CBS_CFS);

=2E..isn't being used by the driver.

Looking at the above it looks like the PCM driver is doing something
very odd - _CONT doesn't make a whole lot of sense on the slave side,
it's related to the clock generation so should have no effect at all on
the slave side.  The driver code looks reasonably sensible though.

What specifically is going wrong here?
