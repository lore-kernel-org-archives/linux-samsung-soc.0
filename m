From: Sangsu Park <sangsu4u.park@samsung.com>
Subject: RE: [PATCH] ASoC: SAMSUNG: Add SND_SOC_DAIFMT_CONT option for
 snd_soc_set_fmt()
Date: Wed, 29 Aug 2012 20:06:32 +0900
Message-ID: <001d01cd85d6$59298040$0b7c80c0$@samsung.com>
References: <003101cd8367$3476e650$9d64b2f0$@samsung.com>
 <20120827204550.GA4400@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46205 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752541Ab2H2LGf convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Aug 2012 07:06:35 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M9I001ZCK6U2M30@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 20:06:33 +0900 (KST)
Received: from DOSANGSU4UP02 ([12.23.118.226])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M9I006XXK6WKU40@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 29 Aug 2012 20:06:33 +0900 (KST)
In-reply-to: <20120827204550.GA4400@opensource.wolfsonmicro.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Mark Brown' <broonie@opensource.wolfsonmicro.com>
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, 'Kukjin Kim' <kgene.kim@samsung.com>, ben-linux@fluff.org, lrg@ti.com, linux-arm-kernel@lists.infradead.org

On Sun, Aug 26, 2012 at 05:45:54PM +0900, Mark Brown wrote:
> On Sun, Aug 26, 2012 at 05:45:54PM +0900,  =DA=BB    wrote:
> > SND_SOC_DAIFMT_CONT option is now needed because of below commit:
> >
> > ASoC: Allow DAI formats to be specified in the dai_link
>=20
> Clearly it's not a direct consequence of this commit, that just intro=
duces a new optional facility
> which...
OK, I'll change it.
>=20
> >  	/* Set the cpu DAI configuration */
> >  	ret =3D snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_DSP_B
> > +				| SND_SOC_DAIFMT_CONT
> >  				| SND_SOC_DAIFMT_IB_NF
> >  				| SND_SOC_DAIFMT_CBS_CFS);
>=20
> ...isn't being used by the driver.
>=20
> Looking at the above it looks like the PCM driver is doing something =
very odd - _CONT doesn't make
> a whole lot of sense on the slave side, it's related to the clock gen=
eration so should have no
> effect at all on the slave side.  The driver code looks reasonably se=
nsible though.
You mean cpu side is slave?=20
And I think that pcm driver can be changed to solve this issue.
>=20
> What specifically is going wrong here?
SND_SOC_DAIFMT_CONT is used sound/soc/Samsung/pcm.c (s3c_pcm_set_fmt())=
 like below.

switch (fmt & SND_SOC_DAIFMT_CLOCK_MASK) {
        case SND_SOC_DAIFMT_CONT:
                pcm->idleclk =3D 1;
                break;
        case SND_SOC_DAIFMT_GATED:
                pcm->idleclk =3D 0;
                break;
        default:
                dev_err(pcm->dev, "Invalid Clock gating request!\n");
                ret =3D -EINVAL;
                goto exit;
        }

If fmt argument has no SND_SOC_DAIFMT_ option, s3c_pcm_set_fmt() return=
 -EINVAL.

>=20
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
