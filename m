From: D Krishna Mohan <krishna.md@samsung.com>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is
 disabled
Date: Mon, 24 Nov 2014 12:48:31 +0530
Message-ID: <C8902B5E8A6B4B63A3B9A732345B33AD@sisodomain.com>
References: <1416232589-31319-1-git-send-email-krishna.md@samsung.com>
 <20141117155617.GJ27002@pengutronix.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Boundary_(ID_dEee6aALfrCa8Vw9I7jVig)"
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:33682 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751434AbaKXHSb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:18:31 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFJ00IU58AQC710@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 16:18:27 +0900 (KST)
In-reply-to: <20141117155617.GJ27002@pengutronix.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?UweKleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Mark Brown <broonie@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, kgene.kim@samsung.com, Claude Youn <claude.youn@gmail.com>

This is a multi-part message in MIME format.

--Boundary_(ID_dEee6aALfrCa8Vw9I7jVig)
Content-type: text/plain; format=flowed; charset=iso-8859-1; reply-type=original
Content-transfer-encoding: 8BIT

Attaching the patch with changes suggested by Uwe. Though there is another 
patch which I submitted, but I leave it to Mark Brown as to which patch to 
pick.

Previous patch :
>From 80b55f898d0a31b63fd6ed3bd82c548a0559b07b Mon Sep 17 00:00:00 2001
From: Krishna Mohan Dani <krishna.md@samsung.com>
Date: Mon, 17 Nov 2014 19:24:46 +0530
Subject: [PATCH 1/2] ASoC: rt5631: Fixing compilation warning when DT is
 disabled

-Krishna

--------------------------------------------------
From: "UweKleine-König" <u.kleine-koenig@pengutronix.de>
Sent: Monday, November 17, 2014 9:26 PM
To: "Krishna Mohan Dani" <krishna.md@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>; 
<linux-arm-kernel@lists.infradead.org>; <alsa-devel@alsa-project.org>; 
<broonie@kernel.org>; <kgene.kim@samsung.com>; "Claude Youn" 
<claude.youn@gmail.com>
Subject: Re: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is 
disabled

> On Mon, Nov 17, 2014 at 07:26:29PM +0530, Krishna Mohan Dani wrote:
>> Fixes the following compilation warning:
>> Warning: 'rt5631_i2c_dt_ids' defined but not used - when DT is not used.
>>
>> Signed-off-by: Claude Youn <claude.youn@gmail.com>
>> Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>
>> ---
>>  sound/soc/codecs/rt5631.c |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c
>> index 3b7d5e4..9425545 100644
>> --- a/sound/soc/codecs/rt5631.c
>> +++ b/sound/soc/codecs/rt5631.c
>> @@ -1691,12 +1691,14 @@ static const struct i2c_device_id rt5631_i2c_id[] 
>> = {
>>  };
>>  MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);
>>
>> +#ifdef CONFIG_OF
>>  static struct of_device_id rt5631_i2c_dt_ids[] = {
>>  { .compatible = "realtek,rt5631"},
>>  { .compatible = "realtek,alc5631"},
>>  { }
>>  };
>>  MODULE_DEVICE_TABLE(of, rt5631_i2c_dt_ids);
>> +#endif
>
> An (IMHO nicer) alternative is:
>
> -static struct of_device_id rt5631_i2c_dt_ids[] = {
> +static struct of_device_id rt5631_i2c_dt_ids[] __maybe_unused = {
>
> Best regards
> Uwe
>
> -- 
> Pengutronix e.K.                           | Uwe Kleine-König            |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  | 

--Boundary_(ID_dEee6aALfrCa8Vw9I7jVig)
Content-type: application/octet-stream;
 name=0001-ASoC-rt5631-Fixing-compilation-warning-when-DT-is-di.patch
Content-transfer-encoding: quoted-printable
Content-disposition: attachment;
 filename=0001-ASoC-rt5631-Fixing-compilation-warning-when-DT-is-di.patch

>From 8d9e91b5dfe666f1a424297c016cf85fc3e35dd4 Mon Sep 17 00:00:00 2001=0A=
From: Krishna Mohan Dani <krishna.md@samsung.com>=0A=
Date: Mon, 24 Nov 2014 12:41:20 +0530=0A=
Subject: [PATCH] ASoC: rt5631: Fixing compilation warning when DT is =
disabled=0A=
=0A=
Fixes the following compilation warning:=0A=
Warning: 'rt5631_i2c_dt_ids' defined but not used - when DT is not used.=0A=
=0A=
Signed-off-by: Claude Youn <claude.youn@gmail.com>=0A=
Signed-off-by: Krishna Mohan Dani <krishna.md@samsung.com>=0A=
---=0A=
 sound/soc/codecs/rt5631.c |    2 +-=0A=
 1 file changed, 1 insertion(+), 1 deletion(-)=0A=
=0A=
diff --git a/sound/soc/codecs/rt5631.c b/sound/soc/codecs/rt5631.c=0A=
index 3b7d5e4..5c65915 100644=0A=
--- a/sound/soc/codecs/rt5631.c=0A=
+++ b/sound/soc/codecs/rt5631.c=0A=
@@ -1691,7 +1691,7 @@ static const struct i2c_device_id rt5631_i2c_id[] =
=3D {=0A=
 };=0A=
 MODULE_DEVICE_TABLE(i2c, rt5631_i2c_id);=0A=
 =0A=
-static struct of_device_id rt5631_i2c_dt_ids[] =3D {=0A=
+static struct of_device_id rt5631_i2c_dt_ids[] __maybe_unused =3D {=0A=
 	{ .compatible =3D "realtek,rt5631"},=0A=
 	{ .compatible =3D "realtek,alc5631"},=0A=
 	{ }=0A=
-- =0A=
1.7.9.5=0A=
=0A=

--Boundary_(ID_dEee6aALfrCa8Vw9I7jVig)--
