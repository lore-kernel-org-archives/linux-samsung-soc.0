From: Dillon <dillonhua@gmail.com>
Subject: Re: [PATCH CRITICAL] ARM: s3c64xx: dt: Fix boot failure due to double clock initialization
Date: Sat, 14 Dec 2013 22:14:23 +0800
Message-ID: <6123E404-6FF7-466A-99C1-5F9CE30D8F50@gmail.com>
References: <1386964779-29457-1-git-send-email-tomasz.figa@gmail.com> <CAOesGMifjnTDUcsweOwsw9fFgsE7b4q3wsASfP8YL-uMH5KiPA@mail.gmail.com> <CAPTRvHn7yTt6mC1fjEn5Ra9yx=GZ1DyNQtGWvHsDd_LkuiM_wA@mail.gmail.com> <1500417.9RFCmzklxv@flatron>
Mime-Version: 1.0 (1.0)
Content-Type: text/plain; charset=gb2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:65432 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753758Ab3LNOOn convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 14 Dec 2013 09:14:43 -0500
Received: by mail-pd0-f176.google.com with SMTP id w10so3611208pde.7
        for <linux-samsung-soc@vger.kernel.org>; Sat, 14 Dec 2013 06:14:43 -0800 (PST)
In-Reply-To: <1500417.9RFCmzklxv@flatron>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ben Dooks <ben.dooks@codethink.co.uk>, Mark Brown <broonie@kernel.org>

Hi all

  Let's me give some information about s3c6410 dev board in china,all o=
f them are very cheap.

Ok6410
http://www.witech.com.cn/product/FL6410.html

Ut6410
http://go.ppwan.com/?pp_mid=3D10&sid=3D33242

Real6410
Http://www.realarm.cn/pic/?76_451.html

Arm sys 6410
http://www.hzlitai.com.cn/product/ARM/ARM6410/ARMSYS6410-L43T42.html


=B7=A2=D7=D4=CE=D2=B5=C4 iPad

> =D4=DA 2013=C4=EA12=D4=C214=C8=D5=A3=AC=CF=C2=CE=E78:41=A3=ACTomasz F=
iga <tomasz.figa@gmail.com> =D0=B4=B5=C0=A3=BA
>=20
>> On Saturday 14 of December 2013 16:19:05 hua dillon wrote:
>> hi olof:
>>=20
>>  i think mini6410 from china is the board you want .
>=20
> There were several cheap boards with S3C6410 available, but I'm not s=
ure
> how many of them are still on the market.
>=20
> I guess Mini6410/Tiny6410 are, as I can at least see their prices the=
re:
> http://www.andahammer.com/mini6410-sdk/
> http://www.andahammer.com/t6410sdk/
>=20
> They are almost fully compatible, so they should be thought as just
> a single Mini6410 board, but in different form factors. I do most of
> my testing on the latter.
>=20
> From other boards supported in mainline, there are:
>=20
> - A&W6410 (mach-anw6410) - I couldn't find any information on it
>   anywhere,
>=20
> - Wolfson Cragganmore 6410 - Mark Brown (copied) is using it for some
>   testing of audio codec AFAIK, but I'm not sure if you can get that
>   anywhere.
>=20
> - HMT (mach-hmt), SmartQ 5/7 (mach-smartq*) - they are supposed to be
>   some tablet-like products, but again I'm not sure if you can still
>   get them,
>=20
> - SMDK6400/SMDK6410 are Samsung's official development boards for
>   S3C6400/S3C6410 - I have access to one at the office; no idea if
>   you can get one anywhere,
>=20
> - NCP - an abandoned Samsung's development board - you definitely
>   can't get that anywhere; in fact I'd say that there is no more such
>   board alive over the world and it just should be dropped from mainl=
ine.
>=20
> That's all I can find at the moment. Anyway, I have copied Ben, maybe=
 he
> knows more than that.
>=20
> Best regards,
> Tomasz
>=20
