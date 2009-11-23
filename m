From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 6/6] SMDK6410 SPI: Added spidev support as an example
Date: Mon, 23 Nov 2009 22:41:40 +0900
Message-ID: <1b68c6790911230541l55697438gbb4b22bddc57868b@mail.gmail.com>
References: <1258771948-14276-1-git-send-email-jassi.brar@samsung.com>
	 <20091123132320.GB3987@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:45186 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbZKWNld convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2009 08:41:33 -0500
Received: by pwi3 with SMTP id 3so3421446pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Nov 2009 05:41:40 -0800 (PST)
In-Reply-To: <20091123132320.GB3987@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Jassi Brar <jassi.brar@samsung.com>, linux-samsung-soc@vger.kernel.org

On Mon, Nov 23, 2009 at 10:23 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Sat, Nov 21, 2009 at 11:52:28AM +0900, Jassi Brar wrote:
>
>> +static void smdk6410_spidev_cs_set_level(int high)
>> +{
>> + =C2=A0 =C2=A0 u32 val;
>> +
>> + =C2=A0 =C2=A0 val =3D readl(S3C64XX_GPCDAT);
>> +
>> + =C2=A0 =C2=A0 if (high)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val |=3D (1<<3);
>> + =C2=A0 =C2=A0 else
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 val &=3D ~(1<<3);
>> +
>> + =C2=A0 =C2=A0 writel(val, S3C64XX_GPCDAT);
>> +}
>
> This should be using gpiolib, I suspect.
yes, that wud be more appropriate. thanks.
Also, i anticipate objections to the utility of a spidev device when
smdk6410 doesn't even have convenient pins to tap the SPI signals.
