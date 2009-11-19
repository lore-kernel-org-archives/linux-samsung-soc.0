From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 09/19] drivers: serial: add support for Samsung S5PC110
	SoC uart
Date: Thu, 19 Nov 2009 20:05:29 +0900
Message-ID: <1b68c6790911190305w33e777e3n1ed6b172d67f1639@mail.gmail.com>
References: <1258551194-16018-1-git-send-email-m.szyprowski@samsung.com>
	 <1258551194-16018-10-git-send-email-m.szyprowski@samsung.com>
	 <1b68c6790911180614y355f656fs828177ecc845ec8e@mail.gmail.com>
	 <20091118221345.GB4808@trinity.fluff.org>
	 <1b68c6790911181844p3fb32525h11f79f942afb2d64@mail.gmail.com>
	 <20091119103336.GB15460@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f42.google.com ([209.85.160.42]:51604 "EHLO
	mail-pw0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750716AbZKSLFY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Nov 2009 06:05:24 -0500
Received: by pwi3 with SMTP id 3so1331851pwi.21
        for <linux-samsung-soc@vger.kernel.org>; Thu, 19 Nov 2009 03:05:30 -0800 (PST)
In-Reply-To: <20091119103336.GB15460@sirena.org.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, kyungmin.park@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Thu, Nov 19, 2009 at 7:33 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Thu, Nov 19, 2009 at 11:44:14AM +0900, jassi brar wrote:
>
>> Let each platform code(SoC specific) define names of all possible
>> source clocks and let the board init code pass on the potential sour=
ce
>> clocks by some bit-mask(or some other mechanism) while setting the
>> platform data.
>
> This is going to set off warnings from a clock API point of view -
> passing clock names around in platform data is usually a sign that
> something is very wrong. =C2=A0Keeping the mapping inside the clock A=
PI
> (still controlled by the board driver but by telling the clock API th=
at
> device X should use clock Y).
no clock pointer needs to be passed, just a pointer to an array of _str=
ings_
There is no need to even include any clock header in platform code
for the purpose.
