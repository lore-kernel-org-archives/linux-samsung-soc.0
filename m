From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: Requested features for next merge on s5pc110
Date: Thu, 8 Jul 2010 12:59:11 +0900
Message-ID: <AANLkTinGHkOsR7XhaDNl7_uMnvL4w0RI-V6QaGxuQ4tp@mail.gmail.com>
References: <AANLkTim58_kJFO0vjTXufYc0DkLhT-nVv25trxgjmsFk@mail.gmail.com>
	<AANLkTilt7GoWcPOVPJoy_L4nuZ9H1WI0aOWADsQpJoNf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:51937 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753004Ab0GHD7M convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Jul 2010 23:59:12 -0400
Received: by vws5 with SMTP id 5so547131vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 07 Jul 2010 20:59:11 -0700 (PDT)
In-Reply-To: <AANLkTilt7GoWcPOVPJoy_L4nuZ9H1WI0aOWADsQpJoNf@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?B?7ZWo66qF7KO8?= <myungjoo.ham@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Iqbal <iqbal.ams@samsung.com>, Singh Madhav <singh.madhav@samsung.com>

On Thu, Jul 8, 2010 at 12:39 PM, Jassi Brar <jassisinghbrar@gmail.com> =
wrote:
> On Thu, Jul 8, 2010 at 12:05 PM, Kyungmin Park <kmpark@infradead.org>=
 wrote:
>
>> 3. Aquila & goni board support.
>> =A0 =A0If possible all feature are included at current maineline ker=
nel
>> implemented.
>
> Without doubt it's pleasing to see so many people involved pushing su=
pport
> for Samsung's SoCs and machines based upon them.
> But it might be worthwhile to rethink if support for such
> 'not-so-popular' machines
> and 'transient' socs is necessary or even useful ?

It depends on the point of view.

Even though it's not sold from marker, others will be used. e.g., Limo.
We are planing to distribute mobile reference board to developer and
community that's reason to enable it at mainline.

Of course the best is sell the reference board from LSI like beagle
board from TI or other company.
you can enable these at smdk board.

I also want to know that which name of either s5pv210 or s5pc110 is
popular at outside? I think latter is well known since galaxy S and
wave phone uses it.

Anyway I hope to use mainline kernel as base kernel at our board.

To Jassi,

Can you post the sound related patches such as I2S?

Thank you,
Kyungmin Park
