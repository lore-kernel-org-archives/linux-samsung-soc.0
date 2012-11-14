From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] sound: use PTR_ERR to fix the value of the return
Date: Wed, 14 Nov 2012 14:25:40 +0530
Message-ID: <50A35C8C.1070505@linaro.org>
References: <1352809140-4214-1-git-send-email-windsdaemon@gmail.com> <50A324E1.7060003@linaro.org> <50A340BA.2090904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53598 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751458Ab2KNIzL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 14 Nov 2012 03:55:11 -0500
Received: by mail-pb0-f46.google.com with SMTP id wy7so234740pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Nov 2012 00:55:11 -0800 (PST)
In-Reply-To: <50A340BA.2090904@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wang Jing <windsdaemon@gmail.com>
Cc: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

On 11/14/2012 12:26 PM, Wang Jing wrote:
> On 2012=E5=B9=B411=E6=9C=8814=E6=97=A5 12:58, Tushar Behera wrote:
>> On 11/13/2012 05:49 PM, Wang Jing wrote:
>>> From: wangjing <wangjing@wangjing.(none)>
>>>
>>> This patch use the macro PTR_ERR to modify the value of the return
>>>
>>> Signed-off-by: wangjing <wangjing@wangjing.(none)>

Also please sign off with a valid e-mail address.

>>> ---
>>>   sound/soc/samsung/smdk_spdif.c |   30 +++++++++++++++------------=
---
>>>   1 file changed, 15 insertions(+), 15 deletions(-)
>>>
>>> diff --git a/sound/soc/samsung/smdk_spdif.c
>>> b/sound/soc/samsung/smdk_spdif.c
>>> index beaa9c1..8f78482 100644
>>> --- a/sound/soc/samsung/smdk_spdif.c
>>> +++ b/sound/soc/samsung/smdk_spdif.c
>>> @@ -28,32 +28,29 @@ static int set_audio_clock_heirachy(struct
>>> platform_device *pdev)
>>>         fout_epll =3D clk_get(NULL, "fout_epll");
>>>       if (IS_ERR(fout_epll)) {
>>> -        printk(KERN_WARNING "%s: Cannot find fout_epll.\n",
>>> -                __func__);
>>> -        return -EINVAL;
>>> +        printk(KERN_ERR "%s: Cannot find fout_epll.\n", __func__);
>>> +        ret =3D PTR_ERR(fout_epll);
>>> +        return ret;
>> We can have a single statement for the above two statements.
>>
>>         return PTR_ERR(fout_epll);
>>
>>>       }
>>>         mout_epll =3D clk_get(NULL, "mout_epll");
>>>       if (IS_ERR(mout_epll)) {
>>> -        printk(KERN_WARNING "%s: Cannot find mout_epll.\n",
>>> -                __func__);
>>> -        ret =3D -EINVAL;
>>> +        printk(KERN_ERR "%s: Cannot find mout_epll.\n", __func__);
>>> +        ret =3D PTR_ERR(mout_epll);
>>>           goto out1;
>>>       }
>>>         sclk_audio0 =3D clk_get(&pdev->dev, "sclk_audio");
>>>       if (IS_ERR(sclk_audio0)) {
>>> -        printk(KERN_WARNING "%s: Cannot find sclk_audio.\n",
>>> -                __func__);
>>> -        ret =3D -EINVAL;
>>> +        printk(KERN_ERR "%s: Cannot find sclk_audio.\n", __func__)=
;
>>> +        ret =3D PTR_ERR(sclk_audio0);
>>>           goto out2;
>>>       }
>>>         sclk_spdif =3D clk_get(NULL, "sclk_spdif");
>>>       if (IS_ERR(sclk_spdif)) {
>>> -        printk(KERN_WARNING "%s: Cannot find sclk_spdif.\n",
>>> -                __func__);
>>> -        ret =3D -EINVAL;
>>> +        printk(KERN_ERR "%s: Cannot find sclk_spdif.\n", __func__)=
;
>>> +        ret =3D PTR_ERR(sclk_spdif);
>>>           goto out3;
>>>       }
>>>   @@ -81,11 +78,13 @@ static int set_audio_clock_rate(unsigned long
>>> epll_rate,
>>>                   unsigned long audio_rate)
>>>   {
>>>       struct clk *fout_epll, *sclk_spdif;
>>> +    int ret =3D 0;
>>>         fout_epll =3D clk_get(NULL, "fout_epll");
>>>       if (IS_ERR(fout_epll)) {
>>>           printk(KERN_ERR "%s: failed to get fout_epll\n", __func__=
);
>>> -        return -ENOENT;
>>> +        ret =3D PTR_ERR(fout_epll);
>>> +        return ret;
>> Same as above.
>>
>>>       }
>>>         clk_set_rate(fout_epll, epll_rate);
>>> @@ -94,13 +93,14 @@ static int set_audio_clock_rate(unsigned long
>>> epll_rate,
>>>       sclk_spdif =3D clk_get(NULL, "sclk_spdif");
>>>       if (IS_ERR(sclk_spdif)) {
>>>           printk(KERN_ERR "%s: failed to get sclk_spdif\n", __func_=
_);
>>> -        return -ENOENT;
>>> +        ret =3D PTR_ERR(sclk_spdif);
>>> +        return ret;
>> Same as above.
>>
>>>       }
>>>         clk_set_rate(sclk_spdif, audio_rate);
>>>       clk_put(sclk_spdif);
>>>   -    return 0;
>>> +    return ret;
>>>   }
>>>     static int smdk_hw_params(struct snd_pcm_substream *substream,
>>>
>>
> Thanks ,I'll submit it again.


--=20
Tushar Behera
