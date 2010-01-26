From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 2/3] ASoC: AC97: S3C: Add controller driver
Date: Tue, 26 Jan 2010 20:57:56 +0900
Message-ID: <1b68c6791001260357p62b5c10dpfa2a5ddcae0704dd@mail.gmail.com>
References: <1264485101-13782-1-git-send-email-jassisinghbrar@gmail.com>
	 <1264485101-13782-2-git-send-email-jassisinghbrar@gmail.com>
	 <20100126102343.GA24843@trinity.fluff.org>
	 <1b68c6791001260303m38e6e689p2ee8c2c4c6ac2af3@mail.gmail.com>
	 <20100126110945.GJ15759@rakim.wolfsonmicro.main>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from qw-out-2122.google.com ([74.125.92.27]:2983 "EHLO
	qw-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751892Ab0AZL55 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Jan 2010 06:57:57 -0500
Received: by qw-out-2122.google.com with SMTP id 8so141055qwh.37
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Jan 2010 03:57:56 -0800 (PST)
In-Reply-To: <20100126110945.GJ15759@rakim.wolfsonmicro.main>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, lrg@slimlogic.co.uk, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>

On Tue, Jan 26, 2010 at 8:09 PM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> On Tue, Jan 26, 2010 at 08:03:09PM +0900, jassi brar wrote:
>
>> The only reason I didn't submit patch to delete s3c2443-ac97.c is th=
at my
>> =C2=A0smdk2443 didn't produce any sound. (btw the s3c2443-ac97.c als=
o fails to do so)
>
> If they both work equally well please just go ahead and remove the ol=
d
> driver. =C2=A0Keeping the old driver around if it doesn't work is lik=
ely to
> result in any fixups going into that.
ok, will submit a patch for that too.
Btw, I don't have ln2440sbc and don't know how would it take the change=
,
though I sincerely think it should be just fine.
