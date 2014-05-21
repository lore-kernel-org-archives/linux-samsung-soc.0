From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [alsa-devel] [PATCH v2 1/2] ASoC: samsung: s3c24{xx,
 12}-i2s: port to use generic dmaengine API
Date: Wed, 21 May 2014 17:07:47 +0200
Message-ID: <537CC143.9050307@samsung.com>
References: <1400617569-7187-1-git-send-email-anarsoul@gmail.com>
 <537CA9F0.8000704@samsung.com>
 <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:18454 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751425AbaEUPHv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 11:07:51 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5X00DLMJCWA300@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 16:07:44 +0100 (BST)
In-reply-to: <CA+E=qVd_M5wes5rwU0pkR7-4FDS8J-XKfajV7-efTtm=sy2==g@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vasily Khoruzhick <anarsoul@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, =?UTF-8?B?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>

On 21.05.2014 16:53, Vasily Khoruzhick wrote:
> On Wed, May 21, 2014 at 4:28 PM, Tomasz Figa <t.figa@samsung.com> wro=
te:
>> Hi Vasily,
>=20
> Hi Tomasz,
>=20
>> Please remember to keep linux-samsung-soc ML on Cc when sending patc=
hes
>> related to Samsung platforms. It is essential to let Samsung people
>> review them.
>=20
> Ok, I'll keep it in mind. I've just checked and get_maintainer.pl
> outputs linux-samsung-soc ML for these
> patches. I've omitted it occasionally, because it wasn't necessary to
> keep it in CC back in 2011
> (year of my last sound-related patch for s3c24xx).
>=20
>> Please resend the series with this in mind.
>=20
> Is it really necessary? This patch is supposed to go through ASoC
> tree, not through Samsung's.
> And I really doubt that Samsung guys test kernel for s3c24xx boards n=
owadays.

Maybe not test, but at least review the code. Also there might be other
people following that list that might be interested in looking at this
series, while not subscribed to alsa-devel - I can name at least Heiko
St=C3=BCbner, who should be able to test it on further s3c24xx-based bo=
ards.

>=20
>> The patch in general looks good to me. Might be a good idea to speci=
fy
>> on what board(s) and how it was tested, though.
>=20
> It was tested on s3c2410-based iPAQ h1940, s3c2412 part was only
> compile-tested, as I don't have s3c2412 hardware.

OK, thanks.

Best regards,
Tomasz
