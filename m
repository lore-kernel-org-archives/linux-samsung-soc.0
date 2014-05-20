From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] Fix for possible null pointer dereference in dma.c
Date: Tue, 20 May 2014 21:16:59 +0200
Message-ID: <537BAA2B.9090906@gmail.com>
References: <1400191076-28279-1-git-send-email-rickard_strandqvist@spectrumdigital.se>	<5379E284.7030700@gmail.com> <CAFo99gZ3kVGn04we5OtRtbkceYRs6SiHXRyoX1Gb-SknJH=z=w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f42.google.com ([74.125.83.42]:55267 "EHLO
	mail-ee0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbaETTRI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 May 2014 15:17:08 -0400
In-Reply-To: <CAFo99gZ3kVGn04we5OtRtbkceYRs6SiHXRyoX1Gb-SknJH=z=w@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Mark Brown <broonie@kernel.org>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org

Hi Rickard,

On 20.05.2014 21:12, Rickard Strandqvist wrote:
> Hi Tomasz
>=20
> What I based my patch on is really because of this line:
> if (substream)
>          snd_pcm_period_elapsed(substream);
>=20
> Boojin Kim thought that this was needed, if this is true anymore..? I
> have not been able to immerse myself so much in all patches.
> I'm working on about 100 similar patches.

To me having NULL as either data argument of buffer done callback or
private_data would be a serious driver bug and IMHO it's better to let
it crash with a NULL pointer dereference to let someone notice than mas=
k
it by adding a condition.

Still, I'm not too experienced with ALSA and ASoC, so I might be wrong.
Mark, what do you think about this?

Best regards,
Tomasz

>=20
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 123)              prtd->dma_pos +=3D prtd->dma_period;
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 124)              if (prtd->dma_pos >=3D prtd->dma_end=
)
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 125)                      prtd->dma_pos =3D
> prtd->dma_start;
> 5111c075 sound/soc/s3c24xx/s3c24xx-pcm.c (Mark Brown        2008-04-3=
0
> 17:19:32 +0200 126)
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 127)              if (substream)
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 128)
> snd_pcm_period_elapsed(substream);
> c0f41bb1 sound/soc/s3c24xx/s3c24xx-pcm.c (Ben Dooks         2007-02-1=
4
> 13:20:03 +0100 129)
> 344b4c48 sound/soc/samsung/dma.c         (Boojin Kim        2011-09-0=
2
> 09:44:43 +0900 130)              spin_lock(&prtd->lock);
>=20
>=20
> Best regards
> Rickard Strandqvist
>=20
>=20
> 2014-05-19 12:52 GMT+02:00 Tomasz Figa <tomasz.figa@gmail.com>:
>> Hi Rickard,
>>
>> On 15.05.2014 23:57, Rickard Strandqvist wrote:
>>> There is otherwise a risk of a possible null pointer dereference.
>>>
>>> Was largely found by using a static code analysis program called cp=
pcheck.
>>>
>>> Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdig=
ital.se>
>>> ---
>>>  sound/soc/samsung/dma.c |   10 ++++++----
>>>  1 fil =C3=A4ndrad, 6 till=C3=A4gg(+), 4 borttagningar(-)
>>>
>>> diff --git a/sound/soc/samsung/dma.c b/sound/soc/samsung/dma.c
>>> index dc09b71..b1f6757 100644
>>> --- a/sound/soc/samsung/dma.c
>>> +++ b/sound/soc/samsung/dma.c
>>> @@ -115,17 +115,19 @@ static void dma_enqueue(struct snd_pcm_substr=
eam *substream)
>>>  static void audio_buffdone(void *data)
>>>  {
>>>       struct snd_pcm_substream *substream =3D data;
>>> -     struct runtime_data *prtd =3D substream->runtime->private_dat=
a;
>>> +     struct runtime_data *prtd =3D NULL;
>>>
>>>       pr_debug("Entered %s\n", __func__);
>>>
>>> -     if (prtd->state & ST_RUNNING) {
>>> +     if(substream)
>>> +             prtd =3D substream->runtime->private_data;
>>> +
>>> +     if (prtd && prtd->state & ST_RUNNING) {
>>>               prtd->dma_pos +=3D prtd->dma_period;
>>>               if (prtd->dma_pos >=3D prtd->dma_end)
>>>                       prtd->dma_pos =3D prtd->dma_start;
>>>
>>> -             if (substream)
>>> -                     snd_pcm_period_elapsed(substream);
>>> +             snd_pcm_period_elapsed(substream);
>>>
>>>               spin_lock(&prtd->lock);
>>>               if (!samsung_dma_has_circular()) {
>>>
>>
>> Can you find a path (or use case, if possible) on which any of affec=
ted
>> pointers will be NULL?
>>
>> Best regards,
>> Tomasz
